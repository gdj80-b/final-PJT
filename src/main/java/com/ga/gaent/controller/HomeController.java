package com.ga.gaent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String home() {
        return "home";
    }
    
    // 템플릿 확인을 위한 URL
    @GetMapping("/template")
    public String template() {
        return "common/template";
    }
}
