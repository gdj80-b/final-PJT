package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.VacationDTO;
import com.ga.gaent.service.VacationService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/atd")
public class VacationController {
    @Autowired VacationService vacationService;
    
    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }
    
    @PostMapping("/myVacStatus")
    @ResponseBody
    public Map<String,Object>selectMyVacStatus(HttpSession session){
        
        String empCode = getEmpCode(session);
        System.out.println(empCode);
        Map<String, Object>map= vacationService.selectMyVacStatus(empCode);
        return map;
    }
    
    @GetMapping("/vacation")
    public String getVacationHistory(
            HttpSession session, Model model,
            @RequestParam(defaultValue = "1") int currentPage) {
        
        String empCode = getEmpCode(session);
        
        // 리스트
        List<VacationDTO>list = vacationService.selectMyVacList(empCode);
        
        // @@ 페이징 @@
        Map<String, Object>paginMap = vacationService.getPagingIdx(empCode, currentPage);
        
        model.addAttribute("pg", paginMap);
        model.addAttribute("list", list);
        return "atd/vacHistory";
    }

    
    
}
