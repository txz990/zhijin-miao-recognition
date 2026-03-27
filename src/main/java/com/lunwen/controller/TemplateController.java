package com.lunwen.controller;

import com.lunwen.entity.Template;
import com.lunwen.service.TemplateLibraryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 模板库管理控制器
 */
@Slf4j
@RestController
@RequestMapping("/templates")
@CrossOrigin(origins = "*")
public class TemplateController {

    @Autowired
    private TemplateLibraryService templateLibraryService;

    @PostMapping("/rebuild/sample/{audioSampleId}")
    public ResponseEntity<?> rebuildTemplateBySample(@PathVariable Long audioSampleId) {
        try {
            Template template = templateLibraryService.rebuildTemplateFromAudioSample(audioSampleId);
            return ResponseEntity.ok(Map.of(
                "templateId", template.getTemplateId(),
                "audioSampleId", audioSampleId,
                "numFrames", template.getNumFrames(),
                "message", "模板重建成功"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("按样本重建模板失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "模板重建失败"));
        }
    }

    @PostMapping("/rebuild/vocabulary/{vocabularyId}")
    public ResponseEntity<?> rebuildTemplatesByVocabulary(@PathVariable Integer vocabularyId) {
        try {
            List<Template> templates = templateLibraryService.rebuildTemplatesForVocabulary(vocabularyId);
            return ResponseEntity.ok(Map.of(
                "vocabularyId", vocabularyId,
                "templateCount", templates.size(),
                "message", "词条模板批量重建成功"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("按词条批量重建模板失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "批量重建模板失败"));
        }
    }

    @GetMapping("/statistics")
    public ResponseEntity<?> getTemplateStatistics() {
        try {
            return ResponseEntity.ok(templateLibraryService.getTemplateStatistics());
        } catch (Exception e) {
            log.error("获取模板统计失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "获取模板统计失败"));
        }
    }
}
