package com.lunwen.repository;

import com.lunwen.entity.Template;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface TemplateRepository extends JpaRepository<Template, Long> {
    Optional<Template> findByTemplateId(String templateId);
    Optional<Template> findByAudioSampleId(Long audioSampleId);
    List<Template> findByVocabularyId(Integer vocabularyId);
    List<Template> findBySpeakerId(Integer speakerId);
    List<Template> findByVocabularyIdAndSpeakerId(Integer vocabularyId, Integer speakerId);
}
