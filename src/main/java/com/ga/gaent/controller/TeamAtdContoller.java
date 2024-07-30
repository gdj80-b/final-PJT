package com.ga.gaent.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.AtdService;
import com.ga.gaent.util.TeamColor;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeamAtdContoller {

    @Autowired AtdService atdService;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 팀 출근 이력 리스트 조회
     */
    @GetMapping("/team/atd")
    public String teamAtdHistory(Model model,HttpSession session,
               @RequestParam(name="teamCode", required=false) String teamCode, 
               @RequestParam(name="year", required=false) String year,
               @RequestParam(name="week", required=false) String fullWeek
               ) {
        
        if(teamCode == null) {
            Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
            teamCode = (String) loginInfo.get("teamCode");
        }
       
        Calendar today = Calendar.getInstance();
        
        String mWeek  = null;
        year = String.valueOf(today.get(Calendar.YEAR));
        
        if(fullWeek == null ) {
            fullWeek = String.valueOf(today.get(Calendar.WEEK_OF_YEAR));
            mWeek = String.valueOf(today.get(Calendar.WEEK_OF_MONTH));

            String month = String.format("%02d", today.get(Calendar.MONTH) + 1);
            log.debug(TeamColor.RED + "확인 " + year + "&" + month + "&" + fullWeek + TeamColor.RESET);
        }

        if(Integer.parseInt(fullWeek) <= 0) {
            year = String.valueOf( Integer.parseInt(year) -1);
            
        }
        
        
        Map<String, Object> target = new HashMap<>();
        target.put("year", year);
        target.put("fullWeek", fullWeek);
        target.put("nowWeek", today.get(Calendar.WEEK_OF_YEAR));
        
        
        log.debug(TeamColor.PURPLE + "파라미터확인 " + teamCode + year + fullWeek  + TeamColor.RESET); 
        List< Map<String, Object>>list = atdService.getTeamAtdStatus(teamCode,year,fullWeek);
        
        model.addAttribute("t",teamCode);
        model.addAttribute("c", target);
        model.addAttribute("list", list);

        return "attendance/team/teamAtdStatus";
    }
    
    
    @PostMapping("/team/atdTeamStatus")
    @ResponseBody
    public Map<String,Object>getTeamAtdStatus(
           HttpSession session,
            @RequestParam(name="teamCode", required=false) String teamCode, 
            @RequestParam(name="year", required=false) String year,
            @RequestParam(name="week", required=false) String fullWeek
            
            ){
        
        if(teamCode ==null) {
            Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
            teamCode = (String) loginInfo.get("teamCode");
            
        }
        
        log.debug(TeamColor.YELLOW + "확인 " + year + "&" + fullWeek + TeamColor.RESET);
        
        if(Integer.parseInt(fullWeek) <= 0) {
            year = String.valueOf( Integer.parseInt(year) -1);
        }
        
        Map<String, Object>map = atdService.getTeamAtdStatusCount(teamCode, year, fullWeek);
        log.debug(TeamColor.GREEN + "ajax확인 " + map  + TeamColor.RESET); 
        
        return map;
    }
    
    
}
