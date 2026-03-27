package com.lunwen.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 识别历史记录项
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RecognitionHistoryItem {

    private Long id;
    private String wordId;
    private String wordText;
    private Float confidence;
    private Float distance;
    private Integer processingTimeMs;
    private Boolean rejected;
    private String createdAt;
}
