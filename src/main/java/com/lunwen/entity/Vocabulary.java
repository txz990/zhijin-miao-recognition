package com.lunwen.entity;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "vocabulary")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Vocabulary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "word_id", nullable = false, unique = true, length = 10)
    private String wordId;

    @Column(name = "word_text", nullable = false, length = 100)
    private String wordText;

    @Column(name = "pinyin", length = 100)
    private String pinyin;

    @Column(name = "tone", length = 20)
    private String tone;

    @Column(name = "pos_tag", length = 20)
    private String posTag;

    @Column(name = "category", length = 50)
    private String category;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();
}
