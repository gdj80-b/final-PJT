package com.ga.gaent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.HomeService;
import com.ga.gaent.vo.EmpVO;

@Controller
public class HomeController {
    
    @Autowired HomeService homeService;

    @GetMapping("/home")
    public String home() {
        return "home";
    }
    
    @GetMapping("/myPage")
    @ResponseBody
    public EmpVO getMyPageInfo(@RequestParam(name = "empCode") String empCode) {
        return homeService.selectMyPageInfo(empCode);
    }
}
