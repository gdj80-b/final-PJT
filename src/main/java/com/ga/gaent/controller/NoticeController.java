package com.ga.gaent.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ga.gaent.dto.NoticeDTO;
import com.ga.gaent.service.NoticeService;
import com.ga.gaent.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {
    @Autowired NoticeService noticeService;
    
 // 공지사항 상세보기
    @GetMapping("/noticeOne")
    public String noticeOne() {
        return "noticeOne";
    }
    
    // 공지사항 등록form
    @GetMapping("/addNotice")
    public String addNotice() {
        return "addNotice";
    }
    
    // 공지사항 등록action
    @PostMapping("/addNotice")
    public String addNotice(NoticeDTO noticeVO) {
        noticeService.addNotice(noticeVO);
        return "redirect:/noticeList";
    }
    
    
    // 공지사항 수정form
    @GetMapping("/modifyNotice")
    public String modifyNotice() {
        return "modifyNotice";
    }
    
    // 공지사항 수정action
    @PostMapping("/modifyNotice")
    public String modifyNotice1() {
        return "redirect:/noticeOne";
    }
    // 공지사항 삭제
    @PostMapping("/removeNotice")
    public String removeNotice() {
        return "redirect:/noticeList";
    }
    
    // 공지사항 전체항목 출력, 페이징
    @GetMapping("/noticeList")
    public String noticeList(Model model,
            @RequestParam(name="currentPage", defaultValue="1") int currentPage,
            @RequestParam(name="rowPerPage", defaultValue="5") int rowPerPage,
            @RequestParam(name="search", defaultValue="") String search,
            @RequestParam(name="category", defaultValue="") String category
            ) {
        
        List<NoticeVO> list = noticeService.getNoticeList(currentPage, rowPerPage, search, category);
        int lastPage = noticeService.getLastPage(rowPerPage, search, category);
        
        model.addAttribute("list", list);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("search", search);
        
        return "noticeList";
    }
}
