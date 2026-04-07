package com.lunwen.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lunwen.dto.AuthSessionUser;
import com.lunwen.service.AuthService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String path = request.getRequestURI();

        // 受保护页面统一禁用浏览器缓存，避免退出或重启后仍显示上一次的页面内容。
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        if (isPublicPath(path)) {
            return true;
        }

        HttpSession session = request.getSession(false);
        AuthSessionUser currentUser = session == null ? null : (AuthSessionUser) session.getAttribute(AuthService.SESSION_USER_KEY);

        if (currentUser == null) {
            handleUnauthorized(request, response);
            return false;
        }

        if (isAdminPath(path) && !currentUser.isAdmin()) {
            handleForbidden(request, response);
            return false;
        }

        return true;
    }

    private boolean isPublicPath(String path) {
        return path.equals("/login")
            || path.equals("/register")
            || path.equals("/auth/login")
            || path.equals("/auth/register")
            || path.equals("/auth/logout")
            || path.startsWith("/css/")
            || path.startsWith("/js/")
            || path.startsWith("/images/")
            || path.startsWith("/webjars/")
            || path.equals("/error");
    }

    private boolean isAdminPath(String path) {
        return path.equals("/template-library") || path.startsWith("/templates/");
    }

    private void handleUnauthorized(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (isApiRequest(request.getRequestURI())) {
            writeJson(response, HttpServletResponse.SC_UNAUTHORIZED, Map.of("error", "请先登录"));
        } else {
            response.sendRedirect("/login");
        }
    }

    private void handleForbidden(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (isApiRequest(request.getRequestURI())) {
            writeJson(response, HttpServletResponse.SC_FORBIDDEN, Map.of("error", "当前账号无管理权限"));
        } else {
            response.sendRedirect("/?forbidden=1");
        }
    }

    private boolean isApiRequest(String path) {
        return path.startsWith("/recognition")
            || path.startsWith("/api/")
            || path.startsWith("/templates/");
    }

    private void writeJson(HttpServletResponse response, int status, Map<String, String> payload) throws IOException {
        response.setStatus(status);
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(payload));
    }
}
