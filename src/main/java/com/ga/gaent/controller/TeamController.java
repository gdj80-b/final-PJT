package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.TeamService;
import com.ga.gaent.vo.TeamVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/team")
public class TeamController {
    
    @Autowired
    TeamService teamService;
    
    // 조직도 기본 페이지 표시
    @RequestMapping
    public String viewOrgChart() {
        return "team/sub-sidebar";
    }
    
    // 조직도 정보 조회
    @GetMapping("/tree")
    public @ResponseBody List<Map<String, Object>> orgChart(){
       
        return teamService.selectTreeInfo();
    }
    
    // 팀 등록 폼
    @GetMapping("/addTeam")
    public String addTeamForm() {
        return "team/addTeam";
    }
    
    // 팀 등록 액션
    @PostMapping("/addTeam")
    public String addTeamAction(TeamVO team) {
        
        int addTeam = teamService.insertTeam(team);
        if(addTeam == 1) {
            return "redirect:/gaent/team";
        }else {
            return "redirect:/gaent/addTeam";
        }
        
    }
}
