package com.ga.gaent.util;

import java.util.Map;
import org.springframework.stereotype.Component;
import jakarta.servlet.http.HttpSession;

@Component
public class getSessionEmpCode {

    public String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }
}
