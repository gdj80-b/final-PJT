package com.ga.gaent.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ga.gaent.service.EdocService;
import com.ga.gaent.vo.EdocFormTypeVO;

@RestController
public class EdocRestController {

    @Autowired EdocService edocService;
    
    @GetMapping("/edocType")
    public List<EdocFormTypeVO> getEdocType() {
        return edocService.selectEdocType();
    }
}
