package com.ga.gaent.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.PaymentService;
import com.ga.gaent.service.ProductService;
import com.ga.gaent.vo.ProductVO;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.OutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.Set;

@Controller
@RequestMapping("prod")
public class ProductController {

   @Autowired ProductService productService;

   
   /*
    * @author : 조인환
    * @since : 2024. 07. 22.
    * Description : 상품리스트 페이지로 이동
    */
    @GetMapping("")
    public String prod(Model model) {
        
        List<ProductVO>list = productService.getProdList();
        
        
        model.addAttribute("list",list);
        return "/product/prodList";
    }    
}
