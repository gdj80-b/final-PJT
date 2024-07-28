package com.ga.gaent.controller;

import static org.junit.Assert.fail;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.MsgDTO;
import com.ga.gaent.service.BoardService;
import com.ga.gaent.service.EdocService;
import com.ga.gaent.service.HomeService;
import com.ga.gaent.service.MsgService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.util.getSessionEmpCode;
import com.ga.gaent.vo.EmpVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
    
    @Autowired private HomeService homeService;
    
    @Autowired private MsgService msgService;
    
    @Autowired private BoardService boardService;
    
    @Autowired private EdocService edocService;
    
    @Autowired private getSessionEmpCode getSessionEmpCode;
    
    // 받은 쪽지함 요청
    final int RECEVIE_REQUEST = 1;

    /*
     * @author : 정건희
     * @since : 2024. 07. 28.
     * Description : 홈(메인)으로 이동, 홈에서 공지사항 조회
     */
    @GetMapping("/home")
    public String home(
            HttpSession session, Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name = "searchMsg", defaultValue = "") String searchMsg) {
        
        String empCode = getSessionEmpCode.getEmpCode(session);
        
        List<Map<String, Object>> noticeListToHome = boardService.selectNoticeToMain();
        List<MsgDTO> msgListToHome = msgService.getMsgList(empCode, RECEVIE_REQUEST, currentPage, searchMsg);
        Map<String, Object> pagingMap = msgService.getPagingIdx(empCode, RECEVIE_REQUEST, currentPage, searchMsg);
        
        model.addAttribute("notice", noticeListToHome);
        model.addAttribute("msg", msgListToHome);
        model.addAttribute("pg", pagingMap);
        log.debug(TeamColor.PURPLE_BG + "noticeListToHome: " + noticeListToHome + TeamColor.RESET);
        log.debug(TeamColor.PURPLE_BG + "msgListToHome: " + msgListToHome + TeamColor.RESET);
        
        return "home/home";
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
     * @since : 2024. 07. 28.
     * Description : 홈(메인)에서 결재대기문서 조회
     */
    @GetMapping("/approval/{request}")
    @ResponseBody
    public int approvalCntAtHome(HttpSession session,
            @PathVariable(name = "request", required = false) Integer request) {
        
        String empCode = getSessionEmpCode.getEmpCode(session);
        return edocService.waitEdocCnt(empCode, request);
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
}
