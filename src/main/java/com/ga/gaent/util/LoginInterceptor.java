package com.ga.gaent.util;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginInterceptor implements HandlerInterceptor{
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 로그인 인증 분기 인터셉터
     */
    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;
        HttpSession session = req.getSession();
        
        if(session.getAttribute("loginInfo") == null) {
            res.sendRedirect(req.getContextPath()+"/notLogin");
            return false;
        }
        
        return true;
    }
}
