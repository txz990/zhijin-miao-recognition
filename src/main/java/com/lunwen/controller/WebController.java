package com.lunwen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/recognize")
    public String recognize() {
        return "recognize";
    }

    @GetMapping("/statistics")
    public String statistics() {
        return "statistics";
    }

    @GetMapping("/history")
    public String history() {
        return "history";
    }
}
