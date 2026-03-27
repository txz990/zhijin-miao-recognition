package com.lunwen.repository;

import com.lunwen.entity.RecognitionResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 识别结果数据访问层
 */
@Repository
public interface RecognitionResultRepository extends JpaRepository<RecognitionResult, Long> {

    /**
     * 根据用户ID获取识别结果
     */
    List<RecognitionResult> findByUser_IdOrderByCreatedAtDesc(Long userId);

    /**
     * 获取最近N条识别结果
     */
    List<RecognitionResult> findTop100ByOrderByCreatedAtDesc();

    /**
     * 获取最近一段时间的识别结果
     */
    @Query("SELECT r FROM RecognitionResult r WHERE r.createdAt >= :startTime ORDER BY r.createdAt DESC")
    List<RecognitionResult> findRecentResults(LocalDateTime startTime);

    /**
     * 统计平均准确率（基于置信度）
     */
    @Query("SELECT AVG(r.top1Confidence) FROM RecognitionResult r WHERE r.isRejected = false")
    Double getAverageAccuracy();

    /**
     * 统计正确识别数（高置信度）
     */
    @Query("SELECT COUNT(r) FROM RecognitionResult r WHERE r.top1Confidence >= :threshold AND r.isRejected = false")
    Long countCorrectRecognitions(Float threshold);

    /**
     * 统计总识别数
     */
    @Query("SELECT COUNT(r) FROM RecognitionResult r WHERE r.isRejected = false")
    Long countTotalRecognitions();

}
