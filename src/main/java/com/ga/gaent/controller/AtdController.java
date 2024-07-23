package com.ga.gaent.controller;

import java.util.HashMap;
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
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.service.AtdService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.util.atdCalender.AtdHistory;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/atd")
public class AtdController {
    @Autowired AtdService atdService;
    @Autowired AtdHistory atdHistory;
    
    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 14. 
     * Description : 개인 출근 이력 리스트 조회
     */
    @GetMapping("")
    public String atdHistory(Model model,HttpSession session,
               @RequestParam(name="year", required=false) String year,
               @RequestParam(name="month", required=false) String month) {
        
        String empCode = getEmpCode(session);
        
        Map<String, Object> target = atdHistory.makeCalendar(year, month);
        List<AtdDTO>list = atdService.getAtdHistory(empCode);
        
        model.addAttribute("c", target);
        model.addAttribute("list", list);

        return "/atd/atdHistory";
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 14. 
     * Description : 개인 근무시간 조회
     */
    @PostMapping("/atdStatus")
    @ResponseBody
    public Map<String, Object> atdStatus(HttpSession session) {
        
        String empCode = getEmpCode(session);
        Map<String, Object>map = atdService.getAtdStatus(empCode);
        
        return map;
    }
//    
//    @GetMapping("/atd2") 
//    public String atd2() { 
//        return "/atd/atd-register";
//    }
//    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 14. 
     * Description : 개인 출퇴근 여부 조회
     */
    @GetMapping("/checkAtd")
    @ResponseBody
    public AtdDTO checkAtd(@RequestParam String empCode) {
        
        return atdService.checkAtd(empCode);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 15. 
     * Description : 출근 등록
     */
    @GetMapping("/atdIn")
    @ResponseBody
    public int atdIn(@RequestParam String empCode,
            @RequestParam String inputDateTime
            )             {
        
        log.debug(TeamColor.RED + "확인1 : " + empCode + TeamColor.RESET);
        log.debug(TeamColor.RED + "확인2 : " + inputDateTime + TeamColor.RESET);
       //  System.out.println(inputDateTime);
        // return 1;
         return atdService.atdIn(empCode);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 15. 
     * Description : 퇴근등록
     */
    @GetMapping("/atdOut")
    @ResponseBody
    public int atdOut(@RequestParam String empCode) {
        
        return atdService.atdOut(empCode);
    }
    

//    
//    // 퇴근등록
//    @GetMapping("/ccc")
//    public String ccc(Model model,HttpSession session,
//            @RequestParam(name="year", required=false) String year,
//            @RequestParam(name="month", required=false) String month) {
//        Map<String, Object> target = atdHistory.makeCalendar(year, month);
//        
//        
//        Map<String,Object> loginInfo = (Map<String,Object>)(session.getAttribute("loginInfo"));
//        String empCode = (String)loginInfo.get("empCode"); // 세션에서 로그인한사람의 empCode추출
//        
//        List<AtdDTO>list = atdService.getAtdHistory(empCode);
//        model.addAttribute("list", list);
//        model.addAttribute("c", target);
//        return "/atd/ccc";
//    }
    
}
