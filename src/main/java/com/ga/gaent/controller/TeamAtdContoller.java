package com.ga.gaent.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.TeamAtdService;
import com.ga.gaent.util.TeamColor;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeamAtdContoller {
    @Autowired TeamAtdService teamAtdService;
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
        // 팀코드를 따로 요청하지 않으면 본인이 속한 team코드로 설정
        if(teamCode == null) {
            Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
            teamCode = (String) loginInfo.get("teamCode");
        }
        
        log.debug(TeamColor.PURPLE + "파라미터확인 " + teamCode + year + fullWeek  + TeamColor.RESET); 
       
       
        // 날짜 관련 데이터 가져오기
        Map<String, Object> map = teamAtdService.getDateOfWeek(year, fullWeek);
        // 데이터 호출
        List< Map<String, Object>>list = teamAtdService.getTeamAtdStatus(teamCode,(String)map.get("year"),(String)map.get("fullWeek"));
        
        map.put("teamCode",teamCode);
        log.debug(TeamColor.CYAN + "dateMap: " + map + TeamColor.RESET);
        
        model.addAttribute("c", map);
        model.addAttribute("list", list);

        return "attendance/team/teamAtdStatus";
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 주간별 팀 출근 현황 횟수 조회
     */
    @PostMapping("/team/atdTeamStatus")
    @ResponseBody
    public Map<String,Object>getTeamAtdStatus(
           HttpSession session,
            @RequestParam(name="teamCode", required=false) String teamCode, 
            @RequestParam(name="year", required=false) String year,
            @RequestParam(name="week", required=false) String week
            
            ){
        
        Map<String, Object>map = teamAtdService.getTeamAtdStatusCount(teamCode, year, week);
        log.debug(TeamColor.GREEN + "ajax확인 " + map  + TeamColor.RESET); 
        
        return map;
    }
    
    
}
