package com.lunwen.service;

import com.lunwen.entity.AudioSample;
import com.lunwen.entity.Template;
import com.lunwen.repository.AudioSampleRepository;
import com.lunwen.repository.TemplateRepository;
import com.lunwen.repository.VocabularyRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * 模板库管理服务
 *
 * 提供基础版模板重建和统计能力，支持按单个样本或按词条批量重建模板。
 */
@Slf4j
@Service
public class TemplateLibraryService {

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
}
