package com.lunwen.entity;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 语音样本实体
 */
@Data
@Entity
@Table(name = "audio_samples")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AudioSample {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sample_id", nullable = false, unique = true, length = 50)
    private String sampleId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "speaker_id", nullable = false)
    private Speaker speaker;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "word_id", nullable = false)
    private Vocabulary vocabulary;

    @Column(name = "audio_path", length = 255)
    private String audioPath;

    @Column(name = "duration_ms")
    private Float durationMs;

    @Column(name = "sample_rate")
    private Integer sampleRate = 16000;

    @Column(name = "bit_depth")
    private Integer bitDepth = 16;

    @Column
    private Integer channels = 1;

    @Column(name = "quality_flag", length = 10)
    private String qualityFlag = "OK";

    @Column(name = "quality_score")
    private Float qualityScore;

    @Column(name = "noise_level")
    private Float noiseLevel;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

}
