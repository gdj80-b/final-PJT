package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ga.gaent.service.PaymentService;
import com.ga.gaent.vo.PaymentVO;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/prd")
public class PaymentController {
    @Autowired PaymentService paymentService;
    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }
    
    @PostMapping("/pay")
    public String payPrd() {
        
        return null;
    }
    
    // 구매이력
    @GetMapping("/payList")
    public String getPayList(HttpSession session, Model model) {
       
        String empCode = getEmpCode(session);
        
        List<PaymentVO>list = paymentService.getPaymentList(empCode);
        
        model.addAttribute("list", list);
        return "";
    }
}
