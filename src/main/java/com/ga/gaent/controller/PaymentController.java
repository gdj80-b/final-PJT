package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ga.gaent.dto.PaymentDTO;
import com.ga.gaent.service.PaymentService;
import com.ga.gaent.vo.PaymentVO;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/prod")
public class PaymentController {
    @Autowired PaymentService paymentService;
    
    @Value("${toss-clientid-key}") 
    String clientKey;
    
    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }
   
    // 구매이력
    @GetMapping("/payList")
    public String getPayList(
            HttpSession session, Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage
            ) {
       
        String empCode = getEmpCode(session);
        
        List<PaymentDTO>list = paymentService.getPaymentList(empCode);
        Map<String, Object> pagingMap = paymentService.getPagingIdx(empCode,currentPage);
        
        
        model.addAttribute("list", list);
        return "/product/payList";
    }
    
    // 토스결제 페이지
    @PostMapping("/toss")
    public String toss(
            Model model,
            @RequestParam String prodCode,
            @RequestParam String prodPrice,
            @RequestParam String prodContent) {
       
        model.addAttribute("clientKey",clientKey);
        model.addAttribute("prodCode",prodCode);
        model.addAttribute("proName",prodContent);
        model.addAttribute("prodPrice",prodPrice);
        return "/product/pay";
    }
    
    
    // 결제 성공시 도착하는 페이지
    @GetMapping("/success")
    public String success(
            Model model,HttpSession session,
            @RequestParam String orderId,
            @RequestParam String paymentKey,
            @RequestParam String amount,
            @RequestParam String prodCode
            
            ) throws Exception {
        
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        
        String empCode = (String)loginInfo.get("empCode");
        
        int success =  paymentService.payPrd(orderId,paymentKey,amount,prodCode,empCode);

       model.addAttribute("amount", amount);
       model.addAttribute("empCode", empCode);  
       model.addAttribute("prodCode", prodCode);  
        
        return "product/success";
    }

    @GetMapping("/succ")
    // @ResponseBody
    public String success() throws Exception {        
       // <String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        
        // String empCode = (String)loginInfo.get("empCode");
        
        // int success =  paymentService.payPrd(orderId,paymentKey,amount,prodCode,empCode);
        // System.out.println("success" + success);

        return "product/success";
    }
  
    
}
