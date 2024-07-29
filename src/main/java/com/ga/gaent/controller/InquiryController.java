package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.InquiryService;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.TeamVO;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
    
    @Autowired
    InquiryService inquiryService;
    
    // 직원 조회 메인 화면
    @GetMapping("/main")
    public String main(Model model, String teamCode) {
        
        List<Map<String, Object>> teamModal = inquiryService.selectTeamDetail(teamCode);
        model.addAttribute("teamModal", teamModal);
        
        return "inquiry/main";
    }
    
    // 피라미드 조직도 정보 조회
    @GetMapping("/getGroupInfo")
    public @ResponseBody List<Map<String, Object>> getGroupInfo(){
        
        return inquiryService.selectGroupInfo();
    }

    // 직원 조회
    // 페이징 기능 적용
    @GetMapping("/empList")
    public String empList(Model model,
            @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue = "10") int rowPerPage) {
        
        List<EmpVO> empList = inquiryService.selectEmpList(currentPage, rowPerPage);
        
        int lastPage = inquiryService.selectEmpCount() / rowPerPage;
        if(lastPage % rowPerPage != 0) {
            lastPage++;
        }
        
        model.addAttribute("empList", empList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("rowPerPage", rowPerPage);
        model.addAttribute("lastPage", lastPage);
        
        return "inquiry/empList";
    }
    
    // 그룹 조회
    // 페이징 기능 적용
    @GetMapping("/teamList")
    public String teamList(Model model,
            @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue = "10") int rowPerPage) {
        
        List<TeamVO> teamList = inquiryService.selectTeamList(currentPage, rowPerPage);
        
        int lastPage = inquiryService.selectTeamCount() / rowPerPage;
        if(lastPage % rowPerPage != 0) {
            lastPage++;
        }
        
        model.addAttribute("teamList", teamList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("rowPerPage", rowPerPage);
        model.addAttribute("lastPage", lastPage);
        
        return "inquiry/teamList";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 27.
     * Description : 직원 상세 조회
     */
    @GetMapping("/empDetail/{empCode}")
    public String getEmpDetail(@PathVariable(name = "empCode") String empCode, Model model) {
        
        EmpVO empDetail = inquiryService.selectEmpDetail(empCode, model);
        model.addAttribute("empDetail", empDetail);
        
        return "inquiry/empDetail";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 부서 정보 조회
     */
    @GetMapping("/deptDetail")
    public String deptDetail(
            @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue = "5") int rowPerPage,
            Model model, String teamCode) {
        
        // 부서상세
        List<Map<String, Object>> deptDetail = inquiryService.selectDeptDetail(teamCode);
        // 부서총원
        int deptTotal = inquiryService.selectDeptTotal(teamCode);
        // 관련부서
        List<Map<String, Object>> deptTeam = inquiryService.selectDeptTeam(teamCode);
        // 팀상세
        List<Map<String, Object>> teamDetail = inquiryService.selectTeamDetail(teamCode);
        // 팀 멤버 정보 조회
        List<Map<String, Object>> memberDetail = inquiryService.selectMemberDetail(teamCode, currentPage, rowPerPage);
        // 팀 총원
        int memberCount = inquiryService.selectMemberCount(teamCode);
        
        int lastPage = memberCount / rowPerPage;
        if(memberCount % rowPerPage != 0) {
            lastPage++;
        }
        System.out.println("memberCount : " + memberCount);
        System.out.println("rowPerPage : " + rowPerPage);
        System.out.println("lastPage : " + lastPage);
                
        model.addAttribute("deptDetail", deptDetail);
        model.addAttribute("deptTotal", deptTotal);
        model.addAttribute("deptTeam", deptTeam);
        model.addAttribute("teamDetail", teamDetail);
        model.addAttribute("memberDetail", memberDetail);
        model.addAttribute("teamCode", teamCode);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("rowPerPage", rowPerPage);
        model.addAttribute("lastPage", lastPage);
        
        return "inquiry/deptDetail";
    }
}
