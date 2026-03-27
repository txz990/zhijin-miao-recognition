package com.lunwen.controller;

import com.lunwen.dto.RecognitionRequest;
import com.lunwen.dto.RecognitionResponse;
import com.lunwen.service.RecognitionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * 语音识别API控制器
 */
@Slf4j
@RestController
@RequestMapping({"/recognition", "/api/v1/recognition"})
@CrossOrigin(origins = "*")
public class RecognitionController {

    @Autowired
    private RecognitionService recognitionService;

    /**
     * 上传音频并进行识别
     */
    @PostMapping("/recognize")
    public ResponseEntity<?> recognize(@RequestParam("audio") MultipartFile audioFile) {
        try {
            // 保存临时文件
            File tempFile = File.createTempFile("audio_", ".wav");
            audioFile.transferTo(tempFile);

            // 执行识别
            RecognitionResponse response = recognitionService.recognize(
                RecognitionRequest.builder()
                    .audioFilePath(tempFile.getAbsolutePath())
                    .userId(null)
                    .build()
            );

            // 删除临时文件
            tempFile.deleteOnExit();

            return ResponseEntity.ok(response);

        } catch (IOException e) {
            log.error("文件处理失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "文件处理失败: " + e.getMessage()));
        } catch (Exception e) {
            log.error("识别失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "识别失败: " + e.getMessage()));
        }
    }

    /**
     * 获取识别统计信息
     */
    @GetMapping("/statistics")
    public ResponseEntity<?> getStatistics() {
        try {
            return ResponseEntity.ok(recognitionService.getStatistics());
        } catch (Exception e) {
            log.error("获取统计信息失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "获取统计信息失败"));
        }
    }

    /**
     * 获取识别历史记录
     */
    @GetMapping("/history")
    public ResponseEntity<?> getHistory() {
        try {
            return ResponseEntity.ok(recognitionService.getRecognitionHistory());
        } catch (Exception e) {
            log.error("获取识别历史失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "获取识别历史失败"));
        }
    }

}
