package com.ga.gaent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }

    @GetMapping("/findPw")
    public String findPw() {
        return "user/findPw";
    }

    @GetMapping("/resetPw")
    public String resetPw() {
        return "user/resetPw";
    }
    
    @GetMapping("/home")
    public String home() {
        return "home";
    }
    
    @GetMapping("/sidebar")
    public String sidebar() {
        return "common/sidebar";
    }
    
    @GetMapping("/header")
    public String header() {
        return "common/header";
    }
}
