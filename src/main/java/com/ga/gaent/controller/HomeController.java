package com.ga.gaent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.EmpRequestDTO;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.dto.MsgDTO;
import com.ga.gaent.dto.MyPageRequestDTO;
import com.ga.gaent.service.BoardService;
import com.ga.gaent.service.EdocService;
import com.ga.gaent.service.HRService;
import com.ga.gaent.service.HomeService;
import com.ga.gaent.service.MsgService;
import com.ga.gaent.util.FileUploadSetting;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.util.getSessionEmpCode;
import com.ga.gaent.vo.EmpVO;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Slf4j
@Controller
public class HomeController {
    
    @Autowired private HomeService homeService;
    
    @Autowired private MsgService msgService;
    
    @Autowired private BoardService boardService;
    
    @Autowired private EdocService edocService;
    
    @Autowired private getSessionEmpCode getSessionEmpCode;
    
    @Autowired private FileUploadSetting fileUploadSetting;
    
    // 받은 쪽지함 요청
    final int RECEVIE_REQUEST = 1;

    // 홈으로 이동
    @GetMapping("/home")
    public String home() {
        return "home/home";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 28.
     * Description : 헤더(메인)에서 마이페이지 내 정보 조회
     */
    @GetMapping("/myPage")
    @ResponseBody
    public EmpVO getMyPageInfo(@RequestParam(name = "empCode") String empCode) {
        return homeService.selectMyPageInfo(empCode);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 28.
     * Description : 헤더(메인)에서 마이페이지 내 정보 수정
     */
    @PostMapping("/modifyMyPageInfo")
    @ResponseBody
    public void modifyMyPageInfo(HttpSession session,
            @Valid MyPageRequestDTO myPageRequestDTO,
            FileReqDTO fileReqDTO) {
        
        log.debug(TeamColor.PURPLE_BG + "myPageRequestDTO password: " + myPageRequestDTO.getMyPageEmpPassword() + TeamColor.RESET);
        
        if(!fileReqDTO.getGaFile().isEmpty()) {
            fileReqDTO.validateFileType();
        }
        
        int result = 0;
        
        String newFileName = homeService.updateMyPage(myPageRequestDTO, fileReqDTO);
        
        if(!newFileName.equals("empty")) {
            result = fileUploadSetting.insertFile(newFileName, fileReqDTO, "profile");
            if(result != 1) {
                throw new RuntimeException("직원 수정에 실패했습니다.");
            }
        }
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 30.
     * Description : 홈(메인)에서 프로필 카드
     */
    @GetMapping("/home/profile")
    @ResponseBody
    public EmpVO homeProfile(HttpSession session) {
        String empCode = getSessionEmpCode.getEmpCode(session);
        return homeService.selectMyPageInfo(empCode);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 28.
     * Description : 홈(메인)에서 전자결재문서 조회
     */
    @GetMapping("/approval/{request}")
    @ResponseBody
    public int approvalAtHome(HttpSession session,
            @PathVariable(name = "request", required = false) Integer request) {
        
        String empCode = getSessionEmpCode.getEmpCode(session);
        return edocService.waitEdocCnt(empCode, request);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 홈(메인) 쪽지함 조회
     */
    @GetMapping("/home/message")
    @ResponseBody
    public List<MsgDTO> homeMessage(HttpSession session,
            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
        
        String empCode = getSessionEmpCode.getEmpCode(session);
        return homeService.selectMessageListAtHome(empCode, currentPage);
    }
    
    @GetMapping("/home/message/page")
    @ResponseBody
    public Map<String, Object> homeMessagePaging(HttpSession session,
            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
        
        String empCode = getSessionEmpCode.getEmpCode(session);
        return homeService.selectMessagePagingAtHome(empCode, RECEVIE_REQUEST, currentPage);
    }
     
    /*
     * @author : 정건희
     * @since : 2024. 07. 28.
     * Description : 홈(메인)에서 읽지 않은 메세지 조회
     */
    @GetMapping("/unreadMessage")
    @ResponseBody
    public int unreadMessageAtHome(HttpSession session) {
        
        String empCode = getSessionEmpCode.getEmpCode(session);
        return msgService.msgNotReadCnt(empCode);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 홈(메인) 공지사항 조회
     */
    @GetMapping("/home/notice")
    @ResponseBody
    public List<Map<String, Object>> homeNotice() {
        
        return boardService.selectNoticeAtMain();
    }
}
