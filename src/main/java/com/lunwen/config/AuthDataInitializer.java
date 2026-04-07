package com.lunwen.config;

import com.lunwen.entity.User;
import com.lunwen.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class AuthDataInitializer {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    public ApplicationRunner initializeDefaultAdmin() {
        return args -> {
            ensureRoleColumn();
            ensureDefaultAdmin();
        };
    }

    private void ensureRoleColumn() {
        Integer count = jdbcTemplate.queryForObject(
            "SELECT COUNT(*) FROM information_schema.COLUMNS " +
                "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'users' AND COLUMN_NAME = 'role'",
            Integer.class
        );

        if (count == null || count == 0) {
            jdbcTemplate.execute("ALTER TABLE users ADD COLUMN role VARCHAR(20) NOT NULL DEFAULT 'USER' AFTER password");
        }
    }

    private void ensureDefaultAdmin() {
        userRepository.findByUsername("admin").ifPresentOrElse(user -> {
            if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
                user.setRole("ADMIN");
                userRepository.save(user);
            }
        }, () -> userRepository.save(User.builder()
            .username("admin")
            .password(passwordEncoder.encode("admin123"))
            .role("ADMIN")
            .email("admin@zhijin.local")
            .build()));
    }
}
