package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.BoardService;
import com.ga.gaent.service.HomeService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
    
    @Autowired HomeService homeService;
    
    @Autowired BoardService boardService;

    @GetMapping("/home")
    public String home(Model model) {
        
        List<Map<String, Object>> noticeListToHome = boardService.selectNoticeToMain();
        
        model.addAttribute("noticeListToHome", noticeListToHome);
        log.debug(TeamColor.PURPLE_BG + "noticeListToHome: " + noticeListToHome + TeamColor.RESET);
        
        return "home/home";
    }
    
    @GetMapping("/myPage")
    @ResponseBody
    public EmpVO getMyPageInfo(@RequestParam(name = "empCode") String empCode) {
        return homeService.selectMyPageInfo(empCode);
    }
}
