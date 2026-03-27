package com.lunwen.entity;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "speakers")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Speaker {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "speaker_id", nullable = false, unique = true, length = 10)
    private String speakerId;

    @Column(name = "name", length = 50)
    private String name;

    @Column
    private Integer age;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", length = 1)
    private Gender gender;

    @Column(name = "dialect_background", length = 100)
    private String dialectBackground;

    @Column(name = "phonetic_quality", length = 20)
    private String phoneticQuality;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public enum Gender {
        M, F
    }
}
