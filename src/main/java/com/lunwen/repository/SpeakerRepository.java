package com.lunwen.repository;

import com.lunwen.entity.Speaker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface SpeakerRepository extends JpaRepository<Speaker, Integer> {
    Optional<Speaker> findBySpeakerId(String speakerId);
}
