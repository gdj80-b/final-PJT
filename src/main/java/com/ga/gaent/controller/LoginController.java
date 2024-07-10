package com.ga.gaent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {
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
}
