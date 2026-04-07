package com.lunwen.controller;

import com.lunwen.dto.AuthSessionUser;
import com.lunwen.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private AuthService authService;

    @GetMapping("/login")
    public String loginPage(
        @RequestParam(value = "error", required = false) String error,
        @RequestParam(value = "redirect", required = false) String redirect,
        HttpSession session,
        Model model
    ) {
        if (authService.getCurrentUser(session) != null) {
            return "redirect:/";
        }
        model.addAttribute("error", "invalid_credentials".equals(error) ? "用户名或密码错误" : error);
        model.addAttribute("redirect", redirect);
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(
        @RequestParam(value = "error", required = false) String error,
        HttpSession session,
        Model model
    ) {
        if (authService.getCurrentUser(session) != null) {
            return "redirect:/";
        }
        model.addAttribute("error", mapMessage(error));
        return "register";
    }

    @PostMapping("/auth/login")
    public String login(
        @RequestParam("username") String username,
        @RequestParam("password") String password,
        @RequestParam(value = "redirect", required = false) String redirect,
        HttpSession session
    ) {
        try {
            AuthSessionUser user = authService.authenticate(username.trim(), password);
            authService.storeUser(session, user);
            if (redirect != null && !redirect.isBlank() && redirect.startsWith("/")) {
                return "redirect:" + redirect;
            }
            return "redirect:/";
        } catch (IllegalArgumentException ex) {
            String target = (redirect != null && !redirect.isBlank() && redirect.startsWith("/"))
                ? "/login?error=invalid_credentials&redirect=" + redirect
                : "/login?error=invalid_credentials";
            return "redirect:" + target;
        }
    }

    @PostMapping("/auth/register")
    public String register(
        @RequestParam("username") String username,
        @RequestParam(value = "email", required = false) String email,
        @RequestParam("password") String password,
        @RequestParam("confirmPassword") String confirmPassword,
        HttpSession session
    ) {
        if (!password.equals(confirmPassword)) {
            return "redirect:/register?error=password_mismatch";
        }

        try {
            AuthSessionUser user = authService.register(username, email, password);
            authService.storeUser(session, user);
            return "redirect:/";
        } catch (IllegalArgumentException ex) {
            return "redirect:/register?error=" + mapErrorCode(ex.getMessage());
        }
    }

    @GetMapping("/profile")
    public String profilePage(
        @RequestParam(value = "success", required = false) String success,
        @RequestParam(value = "error", required = false) String error,
        HttpSession session,
        Model model
    ) {
        AuthSessionUser currentUser = authService.getCurrentUser(session);
        if (currentUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("profileUser", authService.getUserEntity(currentUser.getId()));
        model.addAttribute("success", mapMessage(success));
        model.addAttribute("error", mapMessage(error));
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(
        @RequestParam(value = "email", required = false) String email,
        @RequestParam(value = "newPassword", required = false) String newPassword,
        @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
        HttpSession session
    ) {
        AuthSessionUser currentUser = authService.getCurrentUser(session);
        if (currentUser == null) {
            return "redirect:/login";
        }

        if (newPassword != null && !newPassword.isBlank() && !newPassword.equals(confirmPassword)) {
            return "redirect:/profile?error=password_mismatch";
        }

        try {
            AuthSessionUser updated = authService.updateProfile(currentUser.getId(), email, newPassword);
            authService.storeUser(session, updated);
            return "redirect:/profile?success=profile_saved";
        } catch (IllegalArgumentException ex) {
            return "redirect:/profile?error=" + mapErrorCode(ex.getMessage());
        }
    }

    @GetMapping("/auth/logout")
    public String logout(HttpSession session) {
        authService.logout(session);
        session.invalidate();
        return "redirect:/login";
    }

    private String mapErrorCode(String message) {
        if ("用户名不能为空".equals(message)) {
            return "username_required";
        }
        if ("密码长度不能少于6位".equals(message) || "新密码长度不能少于6位".equals(message)) {
            return "password_too_short";
        }
        if ("用户名已存在".equals(message)) {
            return "username_exists";
        }
        if ("用户不存在".equals(message)) {
            return "user_not_found";
        }
        return "operation_failed";
    }

    private String mapMessage(String code) {
        if (code == null || code.isBlank()) {
            return null;
        }
        switch (code) {
            case "invalid_credentials":
                return "用户名或密码错误";
            case "password_mismatch":
                return "两次输入的密码不一致";
            case "password_too_short":
                return "密码长度不能少于6位";
            case "username_exists":
                return "用户名已存在";
            case "username_required":
                return "用户名不能为空";
            case "user_not_found":
                return "用户不存在";
            case "profile_saved":
                return "保存成功";
            default:
                return "操作失败";
        }
    }
}
