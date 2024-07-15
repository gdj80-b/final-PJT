package com.ga.gaent.controller;

import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.service.EdocService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EdocController {
    
    @Autowired EdocService edocService;

    @GetMapping("/approval")
    public String approval() {
        return "edoc/approval";
    }
    
    @GetMapping("/edoc")
    public String edocFrom(Model model) {
        
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH);
        int day = now.get(Calendar.DATE);
        
        model.addAttribute("date", year + "-" + (month + 1) + "-" + day);
        
        return "edoc/edoc";
    }
    
    @GetMapping("/edoc/{request}")
    public String getEdocType(@PathVariable(name = "request", required = false) Integer request) {
        
        if(request == 0) {
            return "edoc/edocFormTypeDraft";
        } else if (request == 1){
            return "edoc/휴가신청서";
        } else if (request == 2){
            return "edoc/지출결의서";
        } else if (request == 3){
            return "edoc/경조사지출결의서";
        } else if (request == 4) {
            return "edoc/차량이용신청서";
        } else {
            return "edoc/보고서";
        }
    }
    
    @GetMapping("/getApprover")
    public String getApprover(Model model) {
        
        List<EmpVO> approverList = edocService.selectApprover();
        
        model.addAttribute("approverList", approverList);
        // log.debug(TeamColor.BLUE_BG + "approverList: " + approverList + TeamColor.RESET);
        
        return "edoc/edocApproverModal";
    }
    
    @GetMapping("/approver")
    public String getEdocApprover() {
        return "edoc/edocApprover";
    }
    
    @PostMapping("/approver/edoc")
    public String approvalRequest(EdocRequestDTO edocRequestDTO) {
        return "redirect:edoc/edocDetail";
    }
}
