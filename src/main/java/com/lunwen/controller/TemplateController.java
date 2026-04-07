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

    @PostMapping("/rebuild/sample/code/{sampleId}")
    public ResponseEntity<?> rebuildTemplateBySampleCode(@PathVariable String sampleId) {
        try {
            Template template = templateLibraryService.rebuildTemplateFromAudioSample(sampleId);
            return ResponseEntity.ok(Map.of(
                "templateId", template.getTemplateId(),
                "sampleId", sampleId,
                "numFrames", template.getNumFrames(),
                "message", "模板重建成功"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("按样本编号重建模板失败", e);
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

    @PostMapping("/rebuild/vocabulary/code/{wordId}")
    public ResponseEntity<?> rebuildTemplatesByVocabularyCode(@PathVariable String wordId) {
        try {
            List<Template> templates = templateLibraryService.rebuildTemplatesForVocabulary(wordId);
            return ResponseEntity.ok(Map.of(
                "wordId", wordId,
                "templateCount", templates.size(),
                "message", "词条模板批量重建成功"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("按词条编号批量重建模板失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "批量重建模板失败"));
        }
    }

    @PostMapping("/rebuild/all")
    public ResponseEntity<?> startRebuildAllTemplates(
        @RequestParam(name = "onlyMissing", defaultValue = "false") boolean onlyMissing
    ) {
        try {
            String taskId = templateLibraryService.startRebuildAllTemplatesTask(onlyMissing);
            return ResponseEntity.ok(Map.of(
                "taskId", taskId,
                "onlyMissing", onlyMissing,
                "message", onlyMissing ? "缺失模板补建任务已启动" : "全部模板重建任务已启动"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("批量重建全部模板失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "批量重建全部模板失败"));
        }
    }

    @GetMapping("/rebuild/tasks/{taskId}")
    public ResponseEntity<?> getRebuildTaskStatus(@PathVariable String taskId) {
        try {
            return ResponseEntity.ok(templateLibraryService.getRebuildTaskStatus(taskId));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("获取批量任务进度失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "获取批量任务进度失败"));
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

    @GetMapping("/list")
    public ResponseEntity<?> listTemplates() {
        try {
            return ResponseEntity.ok(templateLibraryService.listTemplates());
        } catch (Exception e) {
            log.error("获取模板列表失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "获取模板列表失败"));
        }
    }

    @DeleteMapping("/{templateId}")
    public ResponseEntity<?> deleteTemplate(@PathVariable Long templateId) {
        try {
            templateLibraryService.deleteTemplate(templateId);
            return ResponseEntity.ok(Map.of(
                "templateId", templateId,
                "message", "模板删除成功"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("删除模板失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "删除模板失败"));
        }
    }

    @PostMapping("/batch-delete")
    public ResponseEntity<?> deleteTemplates(@RequestBody Map<String, List<Long>> payload) {
        try {
            List<Long> templateIds = payload.get("templateIds");
            int deletedCount = templateLibraryService.deleteTemplates(templateIds);
            return ResponseEntity.ok(Map.of(
                "deletedCount", deletedCount,
                "message", "批量删除模板成功"
            ));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            log.error("批量删除模板失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "批量删除模板失败"));
        }
    }
}
