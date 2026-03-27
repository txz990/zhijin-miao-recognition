package com.lunwen.dto;

import lombok.*;

/**
 * 识别响应DTO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RecognitionResponse {

    private String wordId;
    private String wordText;
    private String pinyin;
    private String tone;
    private Float confidence;
    private Float distance;
    private Integer processingTimeMs;
    private Boolean rejected;
    private String rejectionReason;
    private Boolean success;
    private String message;

}
