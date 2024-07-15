package com.ga.gaent.controller;

import java.util.Calendar;
import java.util.List;
import org.eclipse.tags.shaded.org.apache.xpath.objects.XNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.service.EdocService;
import com.ga.gaent.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EdocController {
    
    @Autowired EdocService edocService;

    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 페이지
     */
    @GetMapping("/approval")
    public String approval() {
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
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : select-box 선택에 따른 양식 호출
     */
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
    public String approvalRequest(EdocRequestDTO edocRequestDTO, RedirectAttributes redirectAttributes) {
        
        int draftResult = edocService.insertDraft(edocRequestDTO);
        int edocFileResult = -1;
        
        if(edocRequestDTO.getFileName() != null) {
            edocFileResult = edocService.insertEdocFile(edocRequestDTO);
        }
        
        String fail = "결재 요청에 실패하셨습니다.";
        String pass = "결재 요청에 성공하셨습니다.";
        
        if(draftResult != 1) {
            redirectAttributes.addFlashAttribute("message", fail);
            return "redirect:edoc/approval";
        }
        
        redirectAttributes.addFlashAttribute("message", pass);
        return "redirect:edoc/edocDetail";
    }
}
