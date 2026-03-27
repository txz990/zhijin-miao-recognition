package com.lunwen.service;

import com.lunwen.dto.RecognitionRequest;
import com.lunwen.dto.RecognitionResponse;
import com.lunwen.dto.RecognitionHistoryItem;
import com.lunwen.entity.*;
import com.lunwen.repository.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 语音识别服务
 *
 * 使用Java实现的MFCC特征提取和DTW匹配，无需依赖Python
 */
@Slf4j
@Service
public class RecognitionService {

    private static final DateTimeFormatter HISTORY_TIME_FORMATTER =
        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final float REJECTION_DISTANCE_THRESHOLD = 8.5f;
    private static final float REJECTION_CONFIDENCE_THRESHOLD = 0.12f;

    @Autowired
    private MFCCFeatureExtractionService mfccService;

    @Autowired
    private DTWMatchingService dtwMatchingService;

    @Autowired
    private TemplateRepository templateRepository;

    @Autowired
    private RecognitionResultRepository resultRepository;

    /**
     * 执行语音识别
     *
     * 流程：
     * 1. 使用Java实现的MFCC提取39维特征
     * 2. 加载模板库
     * 3. 使用DTW算法匹配最相似的模板
     * 4. 计算置信度
     * 5. 存储识别结果
     */
    @Transactional
    public RecognitionResponse recognize(RecognitionRequest request) throws Exception {
        long startTime = System.currentTimeMillis();

        try {
            // 1. 提取MFCC特征（Java实现）
            log.info("开始提取MFCC特征: {}", request.getAudioFilePath());
            float[][] mfccFeatures = mfccService.extractMFCC(request.getAudioFilePath());
            log.info("特征提取完成: {}帧, {}维", mfccFeatures.length, mfccFeatures[0].length);

            // 2. 获取所有模板
            List<Template> templates = templateRepository.findAll();
            if (templates.isEmpty()) {
                throw new RuntimeException("模板库为空，请先构建模板库");
            }
            log.info("加载模板库: {} 个模板", templates.size());

            // 3. DTW匹配
            log.info("开始DTW匹配（Sakoe-Chiba带约束）");
            Map<Template, Float> distances = new HashMap<>();
            for (Template template : templates) {
                float[] templateFeatures = bytesToFloats(template.getFeatureVector());
                float[][] templateFeaturesMatrix = reshapeFeatureVector(templateFeatures);
                float distance = dtwMatchingService.calculateDTWDistance(
                    mfccFeatures,
                    templateFeaturesMatrix
                );
                distances.put(template, distance);
            }

            // 4. 获取最小距离的模板
            Template topTemplate = distances.entrySet().stream()
                .min(Comparator.comparingDouble(Map.Entry::getValue))
                .map(Map.Entry::getKey)
                .orElseThrow(() -> new RuntimeException("DTW匹配失败"));

            float topDistance = distances.get(topTemplate);

            // 5. 计算置信度
            float confidence = calculateConfidence(distances);
            RejectionDecision rejectionDecision = evaluateRejection(topDistance, confidence);
            log.info("匹配结果: {}, 距离: {:.3f}, 置信度: {:.2f}, 拒识: {}",
                topTemplate.getVocabulary().getWordText(), topDistance, confidence, rejectionDecision.rejected);

            // 6. 存储识别结果
            long processingTime = System.currentTimeMillis() - startTime;
            RecognitionResult result = RecognitionResult.builder()
                .audioFilePath(request.getAudioFilePath())
                .top1Template(topTemplate)
                .top1Word(topTemplate.getVocabulary())
                .top1Distance(topDistance)
                .top1Confidence(confidence)
                .isRejected(rejectionDecision.rejected)
                .rejectionReason(rejectionDecision.reason)
                .processingTimeMs((int) processingTime)
                .build();

            resultRepository.save(result);
            log.info("识别结果已保存, 耗时: {}ms", processingTime);

            return buildResponse(topTemplate, topDistance, confidence, rejectionDecision, (int) processingTime);

        } catch (Exception e) {
            log.error("识别失败", e);
            throw new RuntimeException("语音识别失败: " + e.getMessage(), e);
        }
    }

    /**
     * 计算置信度
     *
     * 置信度 = 1 - (最小距离 / 次小距离)
     * 范围：[0, 1]
     */
    private float calculateConfidence(Map<Template, Float> distances) {
        List<Float> sorted = distances.values().stream()
            .sorted()
            .collect(Collectors.toList());

        if (sorted.size() < 2) {
            return 0.5f;
        }

        float minDist = sorted.get(0);
        float secondMinDist = sorted.get(1);

        if (secondMinDist == 0 || minDist == secondMinDist) {
            return 0.95f;
        }

        float confidence = 1 - (minDist / secondMinDist);
        return Math.max(0, Math.min(1, confidence));
    }

    /**
     * 构建响应对象
     */
    private RecognitionResponse buildResponse(
        Template template,
        float distance,
        float confidence,
        RejectionDecision rejectionDecision,
        int processingTime
    ) {
        return RecognitionResponse.builder()
            .wordId(rejectionDecision.rejected ? null : template.getVocabulary().getWordId())
            .wordText(rejectionDecision.rejected ? "未识别" : template.getVocabulary().getWordText())
            .pinyin(rejectionDecision.rejected ? null : template.getVocabulary().getPinyin())
            .tone(rejectionDecision.rejected ? null : template.getVocabulary().getTone())
            .confidence(confidence)
            .distance(distance)
            .processingTimeMs(processingTime)
            .rejected(rejectionDecision.rejected)
            .rejectionReason(rejectionDecision.reason)
            .success(true)
            .message(rejectionDecision.rejected ? "拒识" : "识别成功")
            .build();
    }

    /**
     * 将特征向量（一维数组）还原为二维矩阵
     * 用于从数据库恢复模板特征
     */
    private float[][] reshapeFeatureVector(float[] featureVector) {
        int frameDim = 39;
        int numFrames = featureVector.length / frameDim;

        float[][] matrix = new float[numFrames][frameDim];
        for (int i = 0; i < numFrames; i++) {
            System.arraycopy(featureVector, i * frameDim, matrix[i], 0, frameDim);
        }

        return matrix;
    }

    /**
     * 将byte[]转换为float[]
     */
    private float[] bytesToFloats(byte[] bytes) {
        if (bytes == null || bytes.length == 0) {
            return new float[0];
        }
        float[] floats = new float[bytes.length / 4];
        for (int i = 0; i < floats.length; i++) {
            int value = (bytes[i * 4] & 0xFF) |
                        ((bytes[i * 4 + 1] & 0xFF) << 8) |
                        ((bytes[i * 4 + 2] & 0xFF) << 16) |
                        ((bytes[i * 4 + 3] & 0xFF) << 24);
            floats[i] = Float.intBitsToFloat(value);
        }
        return floats;
    }

    /**
     * 获取识别统计信息
     */
    public Map<String, Object> getStatistics() {
        Long totalCount = resultRepository.countTotalRecognitions();
        Long correctCount = resultRepository.countCorrectRecognitions(0.8f);
        Double avgConfidence = resultRepository.getAverageAccuracy();

        return Map.of(
            "totalRecognitions", totalCount != null ? totalCount : 0L,
            "correctRecognitions", correctCount != null ? correctCount : 0L,
            "accuracy", totalCount != null && totalCount > 0 ?
                (correctCount != null ? correctCount : 0) / (double) totalCount : 0.0,
            "averageConfidence", avgConfidence != null ? avgConfidence : 0.0
        );
    }

    /**
     * 获取最近识别历史
     */
    @Transactional(readOnly = true)
    public List<RecognitionHistoryItem> getRecognitionHistory() {
        return resultRepository.findTop100ByOrderByCreatedAtDesc().stream()
            .map(this::toHistoryItem)
            .collect(Collectors.toList());
    }

    private RejectionDecision evaluateRejection(float distance, float confidence) {
        boolean rejectByDistance = distance > REJECTION_DISTANCE_THRESHOLD;
        boolean rejectByConfidence = confidence < REJECTION_CONFIDENCE_THRESHOLD;

        if (rejectByDistance && rejectByConfidence) {
            return new RejectionDecision(true, "匹配距离过大且置信度偏低");
        }
        if (rejectByDistance) {
            return new RejectionDecision(true, "匹配距离超过拒识阈值");
        }
        if (rejectByConfidence) {
            return new RejectionDecision(true, "候选模板区分度不足，置信度偏低");
        }
        return new RejectionDecision(false, null);
    }

    private RecognitionHistoryItem toHistoryItem(RecognitionResult result) {
        Vocabulary word = result.getTop1Word();
        return RecognitionHistoryItem.builder()
            .id(result.getId())
            .wordId(word != null ? word.getWordId() : null)
            .wordText(word != null ? word.getWordText() : "未识别")
            .confidence(result.getTop1Confidence())
            .distance(result.getTop1Distance())
            .processingTimeMs(result.getProcessingTimeMs())
            .rejected(Boolean.TRUE.equals(result.getIsRejected()))
            .createdAt(result.getCreatedAt() != null
                ? result.getCreatedAt().format(HISTORY_TIME_FORMATTER)
                : null)
            .build();
    }

    private static class RejectionDecision {
        private final boolean rejected;
        private final String reason;

        private RejectionDecision(boolean rejected, String reason) {
            this.rejected = rejected;
            this.reason = reason;
        }
    }
}
