package com.lunwen.controller;

import com.lunwen.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class WebController {

    @Autowired
    private AuthService authService;

    @GetMapping("/")
    public String home(HttpSession session) {
        if (authService.getCurrentUser(session) == null) {
            return "redirect:/login";
        }
        return "home";
    }

    @GetMapping("/recognize")
    public String recognize(HttpSession session) {
        if (authService.getCurrentUser(session) == null) {
            return "redirect:/login";
        }
        return "recognize";
    }

    @GetMapping("/statistics")
    public String statistics(HttpSession session) {
        if (authService.getCurrentUser(session) == null) {
            return "redirect:/login";
        }
        return "statistics";
    }

    @GetMapping("/history")
    public String history(HttpSession session) {
        if (authService.getCurrentUser(session) == null) {
            return "redirect:/login";
        }
        return "history";
    }

    @GetMapping("/template-library")
    public String templateLibrary(HttpSession session) {
        if (authService.getCurrentUser(session) == null) {
            return "redirect:/login";
        }
        return "template-library";
    }
}
