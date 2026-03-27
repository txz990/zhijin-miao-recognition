package com.lunwen.repository;

import com.lunwen.entity.Vocabulary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface VocabularyRepository extends JpaRepository<Vocabulary, Integer> {
    Optional<Vocabulary> findByWordId(String wordId);
    List<Vocabulary> findByCategory(String category);
    List<Vocabulary> findByTone(String tone);
}
