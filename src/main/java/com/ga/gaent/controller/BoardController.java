package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.BoardRequestDTO;
import com.ga.gaent.dto.BoardResponseDTO;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.service.BoardService;
import com.ga.gaent.util.FileUploadSetting;
import com.ga.gaent.util.TeamColor;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

    @Autowired private BoardService boardService;
    
    @Autowired private FileUploadSetting fileUploadSetting;

    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }

    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 소통공간 홈 이동 -> 게시글(자유게시판, 공지사항) 메인 호출
     */
    @GetMapping("")
    public String board(Model model) {
        
        List<Map<String, Object>> communityListToMain = boardService.selectCommunityToMain();
        List<Map<String, Object>> noticeListToMain = boardService.selectNoticeToMain();
        
        model.addAttribute("communityListToMain", communityListToMain);
        model.addAttribute("noticeListToMain", noticeListToMain);
        
        return "board/board";
    }

    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글 작성하기
     */
    @PostMapping("/addArticle")
    @ResponseBody
    public void addArticle(HttpSession session, BoardRequestDTO boardRequestDTO, FileReqDTO fileReqDTO) {
        
        log.debug(TeamColor.PURPLE_BG + "boardRequestDTO: " + boardRequestDTO + TeamColor.RESET);
        log.debug(TeamColor.BLUE_BG + "fileReqDTO: " + fileReqDTO + TeamColor.RESET);
        
        if (!fileReqDTO.getGaFile().isEmpty()) {
            fileReqDTO.validateFileType();
        }
        
        boardRequestDTO.setEmpCode(getEmpCode(session));
        
        int result = 0;
        
        String newFileName = boardService.insertBoard(boardRequestDTO, fileReqDTO);
        
        if(!newFileName.equals("empty")) {
            result = fileUploadSetting.insertFile(newFileName, fileReqDTO, "forumfile");
        }
        
        if(result != 1) {
            throw new RuntimeException("게시글 작성에 실패했습니다.");
        }
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 리스트 호출
     */
    @GetMapping("/community")
    public String community(
            Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") int nowPage,
            @RequestParam(name = "rowPerPage", defaultValue = "10") int rowPerPage) {
        
        List<Map<String, Object>> communityList = boardService.selectCommunityList(nowPage, rowPerPage);
        Map<String, Object> pagingMap = boardService.selectCommunityListPaging(nowPage);
        model.addAttribute("communityList", communityList);
        model.addAttribute("pg", pagingMap);
        
        return "board/communityList";
    }
    
    @GetMapping("/notice")
    public String notice(
            Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") int nowPage,
            @RequestParam(name = "rowPerPage", defaultValue = "10") int rowPerPage) {
        
        List<Map<String, Object>> noticeList = boardService.selectNoticeList(nowPage, rowPerPage);
        Map<String, Object> pagingMap = boardService.selectNoticeListPaging(nowPage);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pg", pagingMap);
        
        return "board/noticeList";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 상세 조회
     */
    @GetMapping("/community/boardDetail")
    public String getCommunityDetail(@RequestParam(name = "boardNum") int boardNum, Model model) {
        
        Map<String, Object> boardDetail = boardService.selectCommunityDetail(boardNum);
        model.addAttribute("boardDetail", boardDetail);
        
        return "board/communityDetail";
    }
    
    @GetMapping("/notice/boardDetail")
    public String getNoticeDetail(@RequestParam(name = "boardNum") int boardNum, Model model) {
        Map<String, Object> boardDetail = boardService.selectNoticeDetail(boardNum);
        model.addAttribute("boardDetail", boardDetail);
        return "board/noticeDetail";
    }
}
