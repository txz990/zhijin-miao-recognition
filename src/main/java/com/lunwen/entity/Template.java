package com.lunwen.entity;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "templates")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Template {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "template_id", nullable = false, unique = true, length = 50)
    private String templateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "word_id", nullable = false)
    private Vocabulary vocabulary;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "speaker_id", nullable = false)
    private Speaker speaker;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "audio_sample_id")
    private AudioSample audioSample;

    @Column(name = "mfcc_feature_path", length = 255)
    private String mfccFeaturePath;

    @Column(name = "feature_vector", columnDefinition = "LONGBLOB")
    private byte[] featureVector;

    @Column(name = "feature_length")
    private Integer featureLength;

    @Column(name = "num_frames")
    private Integer numFrames;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();
}
