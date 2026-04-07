package com.lunwen.service;

import com.lunwen.dto.AuthSessionUser;
import com.lunwen.entity.User;
import com.lunwen.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class AuthService {

    public static final String SESSION_USER_KEY = "AUTH_USER";

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public AuthSessionUser authenticate(String username, String rawPassword) {
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new IllegalArgumentException("用户名或密码错误"));

        if (!passwordEncoder.matches(rawPassword, user.getPassword())) {
            throw new IllegalArgumentException("用户名或密码错误");
        }

        return AuthSessionUser.builder()
            .id(user.getId())
            .username(user.getUsername())
            .role(user.getRole())
            .build();
    }

    public void storeUser(HttpSession session, AuthSessionUser user) {
        session.setAttribute(SESSION_USER_KEY, user);
    }

    public AuthSessionUser getCurrentUser(HttpSession session) {
        Object user = session.getAttribute(SESSION_USER_KEY);
        return user instanceof AuthSessionUser ? (AuthSessionUser) user : null;
    }

    public void logout(HttpSession session) {
        session.removeAttribute(SESSION_USER_KEY);
    }

    public AuthSessionUser register(String username, String email, String rawPassword) {
        String normalizedUsername = username == null ? "" : username.trim();
        if (normalizedUsername.isEmpty()) {
            throw new IllegalArgumentException("用户名不能为空");
        }
        if (rawPassword == null || rawPassword.length() < 6) {
            throw new IllegalArgumentException("密码长度不能少于6位");
        }
        if (userRepository.existsByUsername(normalizedUsername)) {
            throw new IllegalArgumentException("用户名已存在");
        }

        User saved = userRepository.save(User.builder()
            .username(normalizedUsername)
            .password(passwordEncoder.encode(rawPassword))
            .role("USER")
            .email(email == null || email.trim().isEmpty() ? null : email.trim())
            .build());

        return AuthSessionUser.builder()
            .id(saved.getId())
            .username(saved.getUsername())
            .role(saved.getRole())
            .build();
    }

    public User getUserEntity(Long userId) {
        return userRepository.findById(userId)
            .orElseThrow(() -> new IllegalArgumentException("用户不存在"));
    }

    public AuthSessionUser updateProfile(Long userId, String email, String newPassword) {
        User user = getUserEntity(userId);
        user.setEmail(email == null || email.trim().isEmpty() ? null : email.trim());

        if (newPassword != null && !newPassword.isBlank()) {
            if (newPassword.length() < 6) {
                throw new IllegalArgumentException("新密码长度不能少于6位");
            }
            user.setPassword(passwordEncoder.encode(newPassword));
        }

        User saved = userRepository.save(user);
        return AuthSessionUser.builder()
            .id(saved.getId())
            .username(saved.getUsername())
            .role(saved.getRole())
            .build();
    }
}
