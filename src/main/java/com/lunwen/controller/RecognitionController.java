package com.lunwen.controller;

import com.lunwen.dto.AuthSessionUser;
import com.lunwen.dto.RecognitionRequest;
import com.lunwen.dto.RecognitionResponse;
import com.lunwen.service.AuthService;
import com.lunwen.service.RecognitionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping({"/recognition", "/api/v1/recognition"})
@CrossOrigin(origins = "*")
public class RecognitionController {

    @Autowired
    private RecognitionService recognitionService;

    @PostMapping("/recognize")
    public ResponseEntity<?> recognize(@RequestParam("audio") MultipartFile audioFile, HttpSession session) {
        try {
            AuthSessionUser currentUser = (AuthSessionUser) session.getAttribute(AuthService.SESSION_USER_KEY);

            File tempFile = File.createTempFile("audio_", ".wav");
            audioFile.transferTo(tempFile);

            RecognitionResponse response = recognitionService.recognize(
                RecognitionRequest.builder()
                    .audioFilePath(tempFile.getAbsolutePath())
                    .userId(currentUser != null ? currentUser.getId() : null)
                    .build()
            );

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
