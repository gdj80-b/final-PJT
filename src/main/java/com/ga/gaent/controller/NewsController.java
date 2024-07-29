package com.ga.gaent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ga.gaent.service.NewsService;
import com.ga.gaent.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class NewsController {
    
    @Autowired NewsService newsService;
    
    @PostMapping("/api/naverSearch") // Ajax 요청 처리
    public String naverSearch(
            @RequestParam(name = "naverSearch") String search,
            @RequestParam(name = "page", defaultValue = "1") int page
            ) {
        
        log.debug(TeamColor.RED + "확인 : " + search + "& " + page + TeamColor.RESET);
        
        return newsService.naverSearch(search,page);
    }
}
