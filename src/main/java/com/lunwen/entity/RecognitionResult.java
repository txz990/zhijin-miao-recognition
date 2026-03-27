package com.lunwen.entity;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 识别结果实体
 */
@Data
@Entity
@Table(name = "recognition_results")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RecognitionResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "audio_file_path", length = 255)
    private String audioFilePath;

    @Column(name = "input_audio_duration_ms")
    private Float inputAudioDurationMs;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "top1_word_id")
    private Vocabulary top1Word;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "top1_template_id")
    private Template top1Template;

    @Column(name = "top1_distance")
    private Float top1Distance;

    @Column(name = "top1_confidence")
    private Float top1Confidence;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "top2_word_id")
    private Vocabulary top2Word;

    @Column(name = "top2_distance")
    private Float top2Distance;

    @Column(name = "top2_confidence")
    private Float top2Confidence;

    @Column(name = "recognized_tone", length = 20)
    private String recognizedTone;

    @Column(name = "processing_time_ms")
    private Integer processingTimeMs;

    @Column
    private Float rtf;

    @Column(name = "is_rejected")
    private Boolean isRejected = false;

    @Column(name = "rejection_reason", length = 255)
    private String rejectionReason;

    @Column(name = "manual_verification", length = 100)
    private String manualVerification;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

}
