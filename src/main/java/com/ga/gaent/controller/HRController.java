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
import com.ga.gaent.service.HRService;
import com.ga.gaent.vo.TeamVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hr")
public class HRController {

    @Autowired private HRService hrService;
    
    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }

    // 인사관리 첫 페이지
    @GetMapping("")
    public String hr() {
        return "hr/hr";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 조직도 정보 조회
     */
    @GetMapping("/tree")
    public @ResponseBody List<Map<String, Object>> orgChart(){
        return hrService.selectTreeInfo();
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 19.
     * Description : 직원 등록 폼
     */
    @GetMapping("/addEmp")
    public String addEmpForm() {
        return "hr/emp/addEmp";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 19.
     * Description : 직원 리스트 조회(페이징 기능 적용)
     */
    @GetMapping("/empList")
    public String getEmpList(
            @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue = "10") int rowPerPage,
            Model model, HttpSession session) {
        
        String empCode = getEmpCode(session);
        
        List<Map<String, Object>> empList = hrService.selectEmpList(empCode, currentPage, rowPerPage);
        
        int lastPage = hrService.selectTeamCount() / rowPerPage;
        
        if(lastPage % rowPerPage != 0) {
            lastPage++;
        }
        
        model.addAttribute("empList", empList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("rowPerPage", rowPerPage);
        model.addAttribute("lastPage", lastPage);
        
        return "hr/emp/empList";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 등록 폼
     */
    @GetMapping("/addTeam")
    public String addTeamForm() {
        return "hr/team/addTeam";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 등록 액션
     */
    @PostMapping("/addTeam")
    public String addTeamAction(TeamVO team) {
        
        int addTeam = hrService.insertTeam(team);
        
        if(addTeam == 1) {
            return "redirect:/hr/team/teamList";
        }else {
            return "redirect:/hr/team/addTeam";
        }
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 수정
     */
    @PostMapping("/modifyTeam")
    public String modifyTeam(TeamVO team) {
        
        int modifyTeam = hrService.updateTeam(team);
        
        if(modifyTeam == 1) {
            return "redirect:/hr/team/teamList";
        }else {
            return "redirect:/hr/team/teamList";
        }
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 삭제
     */
    @GetMapping("/removeTeam")
    public String removeTeam(int teamCode) {
        
        int removeTeam = hrService.deleteTeam(teamCode);
        
        if(removeTeam == 1) {
            return "redirect:/hr/team/teamList";
        }else {
            return "redirect:/hr/team/teamList";
        }
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 리스트 조회(페이징 기능 적용)
     */
    @GetMapping("/teamList")
    public String getTeamList(
            Model model,
            @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue = "10") int rowPerPage) {
        
        List<TeamVO> teamList = hrService.selectTeamList(currentPage, rowPerPage);
        
        int lastPage = hrService.selectTeamCount() / rowPerPage;
        
        if(lastPage % rowPerPage != 0) {
            lastPage++;
        }
        
        model.addAttribute("teamList", teamList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("rowPerPage", rowPerPage);
        model.addAttribute("lastPage", lastPage);
        
        return "hr/team/teamList";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 등록 부서코드 유효성 검사
     */
    @ResponseBody
    @GetMapping("/checkTeamCode")
    public int checkTeamCode(@RequestParam(value="teamCode") String teamCode) {
        return hrService.checkTeamCode(teamCode);
    }
}
