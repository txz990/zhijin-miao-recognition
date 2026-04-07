package com.lunwen.service;

import com.lunwen.entity.AudioSample;
import com.lunwen.entity.Template;
import com.lunwen.repository.AudioSampleRepository;
import com.lunwen.repository.TemplateRepository;
import com.lunwen.repository.VocabularyRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 模板库管理服务
 *
 * 提供基础版模板重建和统计能力，支持按单个样本或按词条批量重建模板。
 */
@Slf4j
@Service
public class TemplateLibraryService {

    private final Map<String, BatchRebuildTaskStatus> rebuildTasks = new ConcurrentHashMap<>();

    @Autowired
    private MFCCFeatureExtractionService mfccService;

    @Autowired
    private TemplateRepository templateRepository;

    @Autowired
    private AudioSampleRepository audioSampleRepository;

    @Autowired
    private VocabularyRepository vocabularyRepository;

    @Transactional
    public Template rebuildTemplateFromAudioSample(Long audioSampleId) throws Exception {
        AudioSample sample = audioSampleRepository.findById(audioSampleId)
            .orElseThrow(() -> new IllegalArgumentException("语音样本不存在: " + audioSampleId));

        validateAudioSample(sample);

        float[][] features = mfccService.extractMFCC(sample.getAudioPath());
        byte[] featureVector = flattenToBytes(features);

        Template template = templateRepository.findByAudioSampleId(audioSampleId)
            .orElseGet(() -> Template.builder()
                .templateId(generateTemplateId())
                .audioSample(sample)
                .speaker(sample.getSpeaker())
                .vocabulary(sample.getVocabulary())
                .build());

        template.setSpeaker(sample.getSpeaker());
        template.setVocabulary(sample.getVocabulary());
        template.setAudioSample(sample);
        template.setFeatureVector(featureVector);
        template.setFeatureLength(featureVector.length / 4);
        template.setNumFrames(features.length);
        template.setMfccFeaturePath(sample.getAudioPath());

        Template saved = templateRepository.save(template);
        log.info("模板重建完成: sampleId={}, templateId={}", sample.getSampleId(), saved.getTemplateId());
        return saved;
    }

    @Transactional
    public Template rebuildTemplateFromAudioSample(String sampleId) throws Exception {
        AudioSample sample = audioSampleRepository.findBySampleId(sampleId)
            .orElseThrow(() -> new IllegalArgumentException("语音样本不存在: " + sampleId));
        return rebuildTemplateFromAudioSample(sample.getId());
    }

    @Transactional
    public List<Template> rebuildTemplatesForVocabulary(Integer vocabularyId) throws Exception {
        vocabularyRepository.findById(vocabularyId)
            .orElseThrow(() -> new IllegalArgumentException("词条不存在: " + vocabularyId));

        List<AudioSample> samples = audioSampleRepository.findByVocabularyId(vocabularyId);
        if (samples.isEmpty()) {
            throw new IllegalArgumentException("该词条暂无可用语音样本");
        }

        List<Template> templates = samples.stream()
            .filter(sample -> sample.getAudioPath() != null && !sample.getAudioPath().isBlank())
            .map(sample -> {
                try {
                    return rebuildTemplateFromAudioSample(sample.getId());
                } catch (Exception e) {
                    throw new RuntimeException("模板重建失败，sampleId=" + sample.getId(), e);
                }
            })
            .collect(Collectors.toList());

        if (templates.isEmpty()) {
            throw new IllegalArgumentException("该词条的语音样本缺少有效音频路径");
        }

        return templates;
    }

    @Transactional
    public List<Template> rebuildTemplatesForVocabulary(String wordId) throws Exception {
        return rebuildTemplatesForVocabulary(
            vocabularyRepository.findByWordId(wordId)
                .orElseThrow(() -> new IllegalArgumentException("词条不存在: " + wordId))
                .getId()
        );
    }

    @Transactional
    public Map<String, Object> rebuildAllTemplates(boolean onlyMissing) {
        List<AudioSample> samples = audioSampleRepository.findAll();
        if (samples.isEmpty()) {
            throw new IllegalArgumentException("当前没有可用于建模的语音样本");
        }

        int processedCount = 0;
        int successCount = 0;
        int skippedCount = 0;
        List<String> failedSamples = new ArrayList<>();

        for (AudioSample sample : samples) {
            processedCount++;

            if (onlyMissing && templateRepository.findByAudioSampleId(sample.getId()).isPresent()) {
                skippedCount++;
                continue;
            }

            try {
                rebuildTemplateFromAudioSample(sample.getId());
                successCount++;
            } catch (Exception e) {
                String sampleLabel = sample.getSampleId() != null ? sample.getSampleId() : String.valueOf(sample.getId());
                failedSamples.add(sampleLabel);
                log.warn("批量重建模板失败: sampleId={}, reason={}", sampleLabel, e.getMessage());
            }
        }

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("totalSamples", samples.size());
        result.put("processedCount", processedCount);
        result.put("successCount", successCount);
        result.put("skippedCount", skippedCount);
        result.put("failedCount", failedSamples.size());
        result.put("failedSamples", failedSamples);
        result.put("templateCount", templateRepository.count());
        return result;
    }

    public String startRebuildAllTemplatesTask(boolean onlyMissing) {
        List<AudioSample> samples = audioSampleRepository.findAll();
        if (samples.isEmpty()) {
            throw new IllegalArgumentException("当前没有可用于建模的语音样本");
        }

        String taskId = "task-" + UUID.randomUUID().toString().replace("-", "").substring(0, 12);
        BatchRebuildTaskStatus status = new BatchRebuildTaskStatus(taskId, onlyMissing, samples.size());
        rebuildTasks.put(taskId, status);

        CompletableFuture.runAsync(() -> runRebuildTask(samples, status));
        return taskId;
    }

    public Map<String, Object> getRebuildTaskStatus(String taskId) {
        BatchRebuildTaskStatus status = rebuildTasks.get(taskId);
        if (status == null) {
            throw new IllegalArgumentException("批量任务不存在: " + taskId);
        }
        return status.toMap();
    }

    private void runRebuildTask(List<AudioSample> samples, BatchRebuildTaskStatus status) {
        try {
            for (AudioSample sample : samples) {
                status.processedCount++;

                if (status.onlyMissing && templateRepository.findByAudioSampleId(sample.getId()).isPresent()) {
                    status.skippedCount++;
                    continue;
                }

                try {
                    rebuildTemplateFromAudioSample(sample.getId());
                    status.successCount++;
                } catch (Exception e) {
                    String sampleLabel = sample.getSampleId() != null ? sample.getSampleId() : String.valueOf(sample.getId());
                    status.failedSamples.add(sampleLabel);
                    status.failedCount++;
                    log.warn("批量重建模板失败: sampleId={}, reason={}", sampleLabel, e.getMessage());
                }
            }

            status.templateCount = templateRepository.count();
            status.finished = true;
            status.message = status.onlyMissing ? "缺失模板补建完成" : "全部模板重建完成";
        } catch (Exception e) {
            status.finished = true;
            status.message = "批量建库过程中出现异常";
            log.error("批量模板任务执行失败: taskId={}", status.taskId, e);
        }
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getTemplateStatistics() {
        long templateCount = templateRepository.count();
        long sampleCount = audioSampleRepository.count();
        long vocabularyCount = vocabularyRepository.count();

        return new HashMap<>(Map.of(
            "templateCount", templateCount,
            "audioSampleCount", sampleCount,
            "vocabularyCount", vocabularyCount
        ));
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> listTemplates() {
        return templateRepository.findAll(Sort.by(Sort.Direction.DESC, "id")).stream()
            .map(template -> {
                Map<String, Object> item = new LinkedHashMap<>();
                item.put("id", template.getId());
                item.put("templateId", template.getTemplateId());
                item.put("wordId", template.getVocabulary() != null ? template.getVocabulary().getWordId() : null);
                item.put("wordText", template.getVocabulary() != null ? template.getVocabulary().getWordText() : null);
                item.put("pinyin", template.getVocabulary() != null ? template.getVocabulary().getPinyin() : null);
                item.put("speakerId", template.getSpeaker() != null ? template.getSpeaker().getSpeakerId() : null);
                item.put("sampleDbId", template.getAudioSample() != null ? template.getAudioSample().getId() : null);
                item.put("sampleId", template.getAudioSample() != null ? template.getAudioSample().getSampleId() : null);
                item.put("numFrames", template.getNumFrames());
                item.put("createdAt", template.getCreatedAt() != null ? template.getCreatedAt().toString() : null);
                return item;
            })
            .collect(Collectors.toList());
    }

    @Transactional
    public void deleteTemplate(Long templateId) {
        Template template = templateRepository.findById(templateId)
            .orElseThrow(() -> new IllegalArgumentException("模板不存在: " + templateId));
        templateRepository.delete(template);
    }

    @Transactional
    public int deleteTemplates(List<Long> templateIds) {
        if (templateIds == null || templateIds.isEmpty()) {
            throw new IllegalArgumentException("请选择要删除的模板");
        }

        List<Template> templates = templateRepository.findAllById(templateIds);
        if (templates.isEmpty()) {
            throw new IllegalArgumentException("未找到可删除的模板");
        }

        templateRepository.deleteAll(templates);
        return templates.size();
    }

    private void validateAudioSample(AudioSample sample) {
        if (sample.getAudioPath() == null || sample.getAudioPath().isBlank()) {
            throw new IllegalArgumentException("语音样本缺少音频路径");
        }

        File audioFile = new File(sample.getAudioPath());
        if (!audioFile.exists() || !audioFile.isFile()) {
            throw new IllegalArgumentException("音频文件不存在: " + sample.getAudioPath());
        }
    }

    private byte[] flattenToBytes(float[][] features) {
        int totalFloats = features.length * 39;
        byte[] bytes = new byte[totalFloats * 4];
        int index = 0;

        for (float[] frame : features) {
            for (float value : frame) {
                int bits = Float.floatToIntBits(value);
                bytes[index++] = (byte) (bits & 0xFF);
                bytes[index++] = (byte) ((bits >> 8) & 0xFF);
                bytes[index++] = (byte) ((bits >> 16) & 0xFF);
                bytes[index++] = (byte) ((bits >> 24) & 0xFF);
            }
        }

        return bytes;
    }

    private String generateTemplateId() {
        return "T-" + UUID.randomUUID().toString().replace("-", "").substring(0, 12).toUpperCase();
    }

    private static class BatchRebuildTaskStatus {
        private final String taskId;
        private final boolean onlyMissing;
        private final int totalSamples;
        private volatile int processedCount;
        private volatile int successCount;
        private volatile int skippedCount;
        private volatile int failedCount;
        private volatile boolean finished;
        private volatile long templateCount;
        private volatile String message = "正在处理中";
        private final List<String> failedSamples = Collections.synchronizedList(new ArrayList<>());

        private BatchRebuildTaskStatus(String taskId, boolean onlyMissing, int totalSamples) {
            this.taskId = taskId;
            this.onlyMissing = onlyMissing;
            this.totalSamples = totalSamples;
        }

        private Map<String, Object> toMap() {
            Map<String, Object> result = new LinkedHashMap<>();
            result.put("taskId", taskId);
            result.put("onlyMissing", onlyMissing);
            result.put("totalSamples", totalSamples);
            result.put("processedCount", processedCount);
            result.put("successCount", successCount);
            result.put("skippedCount", skippedCount);
            result.put("failedCount", failedCount);
            result.put("finished", finished);
            result.put("templateCount", templateCount);
            result.put("message", message);
            result.put("progressPercent", totalSamples == 0 ? 0 : Math.min(100, (processedCount * 100) / totalSamples));
            result.put("failedSamples", new ArrayList<>(failedSamples));
            return result;
        }
    }
}
