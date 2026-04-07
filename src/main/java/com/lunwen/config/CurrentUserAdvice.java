package com.lunwen.config;

import com.lunwen.dto.AuthSessionUser;
import com.lunwen.service.AuthService;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

@ControllerAdvice
public class CurrentUserAdvice {

    @ModelAttribute("currentUser")
    public AuthSessionUser currentUser(HttpSession session) {
        Object value = session.getAttribute(AuthService.SESSION_USER_KEY);
        return value instanceof AuthSessionUser ? (AuthSessionUser) value : null;
    }

    @ModelAttribute("isAdmin")
    public boolean isAdmin(HttpSession session) {
        Object value = session.getAttribute(AuthService.SESSION_USER_KEY);
        return value instanceof AuthSessionUser && ((AuthSessionUser) value).isAdmin();
    }
}
