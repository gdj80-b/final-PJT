package com.ga.gaent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ga.gaent.dto.EdocFormTypeDTO;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.service.EdocProcessService;
import com.ga.gaent.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EdocProcessController {
    
    @Autowired EdocProcessService edocProcessService;
    
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
        
        log.debug(TeamColor.BLUE_BG + "edocRequestDTO: " + edocRequestDTO + TeamColor.RESET);
        
        int result = edocProcessService.insertEdoc(edocRequestDTO, edocFormTypeDTO);
        int edocFileResult = -1;
        
        if(edocRequestDTO.getFileName() != null) {
            edocFileResult = edocProcessService.insertEdocFile(edocRequestDTO);
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
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 결재 상태 승인,반려 처리
     */ 
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
        
        edocProcessService.updateEdocProcess(empCode,edocNum,apprReason,request);
        
        return 1;
    }
}
