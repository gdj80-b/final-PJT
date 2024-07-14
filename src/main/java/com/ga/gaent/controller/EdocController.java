package com.ga.gaent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EdocController {

    @GetMapping("/approval")
    public String approval() {
        return "edoc/approval";
    }
    
    @GetMapping("/edoc")
    public String edocFrom() {
        return "edoc/edoc";
    }
}
