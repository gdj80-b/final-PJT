package com.ga.gaent.controller;

import java.util.HashMap;
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
import com.ga.gaent.service.NoticeService;
import com.ga.gaent.vo.NoticeVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {
    @Autowired NoticeService noticeService;
    
    // 세션에서 로그인한사람의 rankCode추출
    private String getrankCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("rankCode");
    }
    
    // 공지사항 상세보기
    @GetMapping("/noticeOne")
    public String noticeOne(Model model, @RequestParam(name="noticeNum") int noticeNum) {
        
        List<Map<String, Object>> noticeOne = noticeService.selectNoticeOne(noticeNum);
        model.addAttribute("noticeOne", noticeOne);
        return "noticeOne";
    }
    
    // 공지사항 등록 폼
    @GetMapping("/addNotice")
    public String addNotice() {
        return "addNotice";
    }
    
    // 공지사항 등록 액션
    @PostMapping("/addNotice")
    public String addNotice(NoticeVO notice) {
        int addNotice = noticeService.insertNotice(notice);
        
        if(addNotice == 1) {
            return "redirect:/noticeList";
        } else {
            return "redirect:/notice/addNotice";
        }
        
    }
    
    // 공지사항 삭제
    @PostMapping("/removeNotice")
    public String removeNotice(NoticeVO notice, int noticeNum) {
        int removeNotice = noticeService.deleteNotice(noticeNum);
        if(removeNotice == 1) {
            return "redirect:/noticeList";
        } else {
            return "redirect:/notice/noticeOne?noticeNum=" + noticeNum;
        }
    }
    
    // 공지사항 수정
    @PostMapping("/modifyNotice")
    public String modifyNotice(NoticeVO notice, int noticeNum) {
        int modifyNotice = noticeService.updateNotice(notice);
        if(modifyNotice == 1) {
            return  "redirect:/noticeList";
        } else {
            return "redirect:/notice/noticeOne?noticeNum=" + noticeNum;
        }
    }
    
    // 공지사항 전체항목 출력, 페이징
    @GetMapping("/noticeList")
    public @ResponseBody Map<String, Object> getNoticeList(
            @RequestParam(name="currentPage", defaultValue="1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue="5") int rowPerPage,
            @RequestParam(name="search", defaultValue="") String search,
            @RequestParam(name="category", defaultValue="") String category) {
        
        // 공지사항 목록을 가져옴
        List<NoticeVO> list = noticeService.getNoticeList(currentPage, rowPerPage, search, category);
        // 총 페이지수 계산
        int lastPage = noticeService.getLastPage(rowPerPage, search, category);
        
        Map<String, Object> m = new HashMap<>();
        m.put("list", list);
        m.put("currentPage", currentPage);
        m.put("lastPage", lastPage);
        m.put("search", search);
        m.put("category", category);

        return m;
    }
}
