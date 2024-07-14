package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.service.AtdService;
import com.ga.gaent.vo.AtdVO;
import com.ga.gaent.vo.atdCalender.AtdHistory;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/atd")
public class AtdController {
    @Autowired AtdService atdService;
    @Autowired AtdHistory atdHistory;
    
    @GetMapping("/atdHistory")
    public String atdHistory() {
        return "/atd/atdHistory";
    }
    
    @GetMapping("/atd2") //
    public String atd2() { 
        return "/atd/atd-Regi";
    }
    
    
    //출퇴근 여부
    @GetMapping("/checkAtd")
    @ResponseBody
    public AtdVO checkAtd(@RequestParam String empCode) {
        
        return atdService.checkAtd(empCode);
    }
    
    // 출근등록
    @GetMapping("/atdIn")
    @ResponseBody
    public int atdIn(@RequestParam String empCode) {
        
        return atdService.atdIn(empCode);
    }
    
    // 퇴근등록
    @GetMapping("/atdOut")
    @ResponseBody
    public int atdOut(@RequestParam String empCode) {
        
        return atdService.atdOut(empCode);
    }
    
    @GetMapping("/atdCalendar")
    public String atdCalendar(Model model,HttpSession session,
               @RequestParam(name="year", required=false) String year,
               @RequestParam(name="month", required=false) String month) {
        
        Map<String,Object> loginInfo = (Map<String,Object>)(session.getAttribute("loginInfo"));
        String empCode = (String)loginInfo.get("empCode"); // 세션에서 로그인한사람의 empCode추출
        
        Map<String, Object> target = atdHistory.makeCalendar(year, month);
        List<AtdDTO>list = atdService.getAtdHistory(empCode);
        
        model.addAttribute("c", target);
        model.addAttribute("list", list);

        return "/atd/atdHistory";
    }
}
