package com.ga.gaent.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.eclipse.tags.shaded.org.apache.xpath.objects.XNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ga.gaent.dto.EdocFormTypeDTO;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.service.EdocService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EdocFormTypeVO;
import com.ga.gaent.vo.EdocVO;
import com.ga.gaent.vo.EmpVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EdocController {
    
    @Autowired EdocService edocService;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 16.
     * Description : 로그인 사용자 정보 세션에서 꺼내기(공통코드)
     */
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }

    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 페이지
     */
    @GetMapping("/approval")
    public String approval(HttpSession session, Model model) {
        
        String empCode = getEmpCode(session);
        
        // 전자결재 페이지에서 보이는 카드(결재대기문서)
        List<Map<String, String>> toDoList = edocService.selectToDo(empCode);
        log.debug(TeamColor.BLUE_BG + "toDoList: " + toDoList + TeamColor.RESET);
        
        model.addAttribute("toDoList", toDoList);
        
        return "edoc/approval";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 기안일 구하기
     */
    @GetMapping("/edoc")
    public String edocFrom(Model model) {
        
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH);
        int day = now.get(Calendar.DATE);
        
        model.addAttribute("date", year + "-" + (month + 1) + "-" + day);
        
        return "edoc/edoc";
    }
    
    @GetMapping("/edocType")
    @ResponseBody
    public List<EdocFormTypeVO> getEdocType() {
        return edocService.selectEdocType();
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : select-box 선택에 따른 양식 호출
     */
    @GetMapping("/edoc/{request}")
    public String getEdocType(@PathVariable(name = "request", required = false) Integer request) {
        
        if(request == 0) {
            return "edoc/edocFormType/draftForm";
        } else if (request == 1){
            return "edoc/edocFormType/vacationForm";
        } else if (request == 2){
            return "edoc/edocFormType/projectForm";
        } else if (request == 3){
            return "edoc/edocFormType/eventForm";
        } else if (request == 4) {
            return "edoc/edocFormType/carForm";
        } else if (request == 5) {
            return "edoc/edocFormType/reportForm";
        } else {
            return "edoc/보고서";
        }
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 결재선 리스트 호출
     */
    @GetMapping("/getApprover")
    public String getApprover(Model model) {
        
        List<EmpVO> approverList = edocService.selectApprover();
        
        model.addAttribute("approverList", approverList);
        // log.debug(TeamColor.BLUE_BG + "approverList: " + approverList + TeamColor.RESET);
        
        return "edoc/edocApproverModal";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 결재선 폼 호출
     */
    @GetMapping("/approver")
    public String getEdocApprover() {
        return "edoc/edocApprover";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 전자결재 데이터 입력
     */
    @PostMapping("/approver/edoc")
    public String approvalRequest(
            EdocRequestDTO edocRequestDTO,
            EdocFormTypeDTO edocFormTypeDTO,
            RedirectAttributes redirectAttributes) {
        
        int result = edocService.insertEdoc(edocRequestDTO, edocFormTypeDTO);
        int edocFileResult = -1;
        
        if(edocRequestDTO.getFileName() != null) {
            edocFileResult = edocService.insertEdocFile(edocRequestDTO);
        }
        
        String fail = "결재 요청에 실패하셨습니다.";
        String pass = "결재 요청에 성공하셨습니다.";
        
        if(result != 1) {
            redirectAttributes.addFlashAttribute("message", fail);
            return "redirect:edoc/approval";
        }
        
        redirectAttributes.addFlashAttribute("message", pass);
        return "redirect:/approval/wait";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 16.
     * Description : 결재대기문서 리스트 조회
     */
    @GetMapping("/approval/toDo")
    public String getToDo(
            HttpSession session, Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name = "rowPerPage", defaultValue = "10") int rowPerPage
            ) {
        
        String empCode = getEmpCode(session);
        
        List<Map<String, String>> toDoList = edocService.selectToDo(currentPage, rowPerPage, empCode);
        /* log.debug(TeamColor.BLUE_BG + "toDoList: " + toDoList + TeamColor.RESET); */
        
        model.addAttribute("toDoList", toDoList);
        
        return "edoc/toDo";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 16.
     * Description : 전자결재 문서 상세보기
     */
    @GetMapping("/edocDetail/{edocNum}")
    public String getEdocDetail(
            @PathVariable(name = "edocNum") Integer edocNum,
            Model model
            ) {
        
        Map<String, Object> edocDetail = edocService.selectEdocDetail(edocNum);
        log.debug(TeamColor.BLUE_BG + "edocDetail: " + edocDetail + TeamColor.RESET);
        
        model.addAttribute("edocDetail", edocDetail);
        
        return "edoc/edocDetail";
    }
    
    /*
     * @author : 홍길동
     * @since : 2024. 07. 00.
     * Description : 결재진행문서 리스트 조회
     */
    @GetMapping("/approval/upComing")
    public String getUpComing(HttpSession session, Model model) {
        String empCode = getEmpCode(session);
        return "edoc/upComing";
    }
    
    /*
     * @author : 홍길동
     * @since : 2024. 07. 00.
     * Description : 결재내역 리스트 조회
     */
    @GetMapping("/approval/history")
    public String getHistory(HttpSession session, Model model) {
        String empCode = getEmpCode(session);
        return "edoc/history";
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 18.
     * Description : 기안문서 리스트 조회
     */
    @GetMapping("/approval/wait")
    public String getDraft(HttpSession session, Model model) {
        String empCode = getEmpCode(session);
        int request = 0;
        List<EdocVO>list = edocService.selectMyEdocSubmitList(empCode, request);
        
        model.addAttribute("list",list);
        
        return "edoc/edocPersonal/wait";
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 18.
     * Description : 승인문서 리스트 조회
     */
    @GetMapping("/approval/approve")
    public String getApprove(HttpSession session, Model model) {
        String empCode = getEmpCode(session);
        int request = 1;
        List<EdocVO>list = edocService.selectMyEdocSubmitList(empCode, request);
        
        model.addAttribute("list",list);
        return "edoc/edocPersonal/approve";
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 18.
     * Description : 반려문서 리스트 조회
     */
    @GetMapping("/approval/reject")
    public String getReject(HttpSession session, Model model) {
        String empCode = getEmpCode(session);
        int request = 2;
        List<EdocVO>list = edocService.selectMyEdocSubmitList(empCode, request);
        
        model.addAttribute("list",list);
        return "edoc/edocPersonal/reject";
    }
    
    // 결재,반려처리
    @PostMapping("/edoc/updateEdocProcess")
    @ResponseBody
    public int updateEdocProcess(
            @RequestParam(name = "empCode") int empCode,
            @RequestParam(name = "edocNum") String edocNum,
            @RequestParam(name = "apprReason", defaultValue = "") String apprReason,
            @RequestParam(name = "request") Integer request
            ) {
        System.out.println("승인들어옴");
        System.out.println("request: " + request);
        
        edocService.updateEdocProcess(empCode,edocNum,apprReason,request);
        
        return 1;
    }
    
    
    
    @GetMapping("/a/test")
    public String aa() {
        return "redirect:/approval/draft";
    }
}
