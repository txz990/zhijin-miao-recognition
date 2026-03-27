package com.lunwen.repository;

import com.lunwen.entity.AudioSample;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface AudioSampleRepository extends JpaRepository<AudioSample, Long> {
    Optional<AudioSample> findBySampleId(String sampleId);
    List<AudioSample> findBySpeakerId(Integer speakerId);
    List<AudioSample> findByVocabularyId(Integer vocabularyId);
    List<AudioSample> findBySpeakerIdAndVocabularyId(Integer speakerId, Integer vocabularyId);
}
