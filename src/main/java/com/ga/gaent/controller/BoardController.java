package com.ga.gaent.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.BoardRequestDTO;
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

    @GetMapping("")
    public String board() {
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
}
