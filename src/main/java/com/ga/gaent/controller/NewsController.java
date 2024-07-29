package com.ga.gaent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ga.gaent.dto.NewsRequestDTO;
import com.ga.gaent.service.NewsService;
import com.ga.gaent.util.TeamColor;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class NewsController {
    
    @Autowired NewsService newsService;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 16.  + (Validation : 29일)
     * Description : 네이버 뉴스검색 API
     */
    @PostMapping("/api/naverSearch") // Ajax 요청 처리
    public String naverSearch(
            @Valid NewsRequestDTO newsRequestDTO,
            Errors errors,
            @RequestParam(name = "page", defaultValue = "1") int page
            ) {

        if (errors.hasErrors()) {
            log.debug(TeamColor.RED + "에러발생"  + TeamColor.RESET);
            for(FieldError e : errors.getFieldErrors()) {
                // 에러가 발생한 form 필드 메시지
                log.debug(TeamColor.RED_BG + "에러메시지: "+ e.getDefaultMessage() + TeamColor.RESET);
                return "error : " + e.getDefaultMessage() ;
            }
        }
        return newsService.naverSearch(newsRequestDTO,page);
    }
}
