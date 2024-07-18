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
    
    // 부서 등록 폼
    @GetMapping("/addTeam")
    public String addTeamForm() {
        return "team/addTeam";
    }
    
    // 부서 등록 액션
    @PostMapping("/addTeam")
    public String addTeamAction(TeamVO team) {
        
        int addTeam = teamService.insertTeam(team);
        if(addTeam == 1) {
            return "redirect:/team/teamList";
        }else {
            return "redirect:/team/addTeam";
        }
    }
    
    // 부서 수정
    @PostMapping("/modifyTeam")
    public String modifyTeam(TeamVO team) {
        
        int modifyTeam = teamService.updateTeam(team);
        if(modifyTeam == 1) {
            return "redirect:/team/teamList";
        }else {
            return "redirect:/team/teamList";
        }
    }
    
    // 부서 삭제
    @GetMapping("/removeTeam")
    public String removeTeam(int teamCode) {
        
        int removeTeam = teamService.deleteTeam(teamCode);
        if(removeTeam == 1) {
            return "redirect:/team/teamList";
        }else {
            return "redirect:/team/teamList";
        }
    }
    
    // 부서 리스트 조회
    // 페이징 기능 적용
    @GetMapping("/teamList")
    public String getTeamList(Model model,
                            @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
                            @RequestParam(name="rowPerPage", defaultValue = "10") int rowPerPage) {
        
        List<TeamVO> teamList = teamService.selectTeamList(currentPage, rowPerPage);
        
        int lastPage = teamService.selectTeamCount() / rowPerPage;
        if(lastPage % rowPerPage != 0) {
            lastPage++;
        }
        
        model.addAttribute("teamList", teamList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("rowPerPage", rowPerPage);
        model.addAttribute("lastPage", lastPage);
        
        return "team/teamList";
    }
    
    // 부서 등록 부서코드 유효성 검사
    @ResponseBody
    @GetMapping("/checkTeamCode")
    public int checkTeamCode(@RequestParam(value="teamCode") String teamCode) {
        return teamService.checkTeamCode(teamCode);
    }
}
