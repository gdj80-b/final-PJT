package com.ga.gaent.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ga.gaent.dto.LoginRequestDTO;
import com.ga.gaent.service.LoginService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
    
    private TeamColor teamColor;
    
    @Autowired LoginService loginService;

    @GetMapping("/login")
    public String login() {
        return "user/login";
    }
    
    @PostMapping("/login")
    public String loginCheck(
            @RequestParam(name = "email") String email,
            @RequestParam(name = "password") String password,
            HttpSession session) {
        
        System.out.println("email: " + email);
        System.out.println("password: " + password);
        
        Map<String, String> loginInfo = new HashMap<>();
        
        loginInfo.put("email", email);
        loginInfo.put("password", password);
        
        EmpVO empInfo = loginService.selectLoginCheck(loginInfo);
        log.debug(teamColor.YELLOW + "loginInfoMap: " + loginInfo + teamColor.RESET);
        
        if( empInfo != null) {
            session.setAttribute("loginInfo", loginInfo);
            return "redirect:/home";
        }
        
        return "login";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
       session.invalidate();
       return "redirect:/login";
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
