package com.lunwen.dto;

import lombok.*;

/**
 * 识别请求DTO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RecognitionRequest {

    private String audioFilePath;
    private Long userId;
    private String language = "zhijin_miao";

}
