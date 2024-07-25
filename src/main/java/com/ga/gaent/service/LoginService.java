package com.ga.gaent.service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.Cookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.LoginRequestDTO;
import com.ga.gaent.mapper.LoginMapper;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
public class LoginService {
    
    @Autowired LoginMapper loginMapper;

    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 로그인
     */
    public Map<String, Object> selectLoginCheck(LoginRequestDTO loginRequestDTO) {
        
        EmpVO empVO = loginMapper.selectLoginCheck(loginRequestDTO);
        
        Map<String, Object> loginInfo = new HashMap<>();
        
        loginInfo.put("empCode", empVO.getEmpCode());
        loginInfo.put("teamCode", empVO.getTeamCode());
        loginInfo.put("rankCode", empVO.getRankCode());
        loginInfo.put("empId", empVO.getEmpId());
        loginInfo.put("korName", empVO.getKorName());
        loginInfo.put("totalLeave", empVO.getTotalLeave());
        loginInfo.put("useLeave", empVO.getUseLeave());
        
        return loginInfo;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 아이디 찾기
     */
    public Map<String, String> selectEmpId(LoginRequestDTO loginRequestDTO) {
        
        EmpVO empVO = loginMapper.selectEmpId(loginRequestDTO);
        
        Map<String, String> userId = new HashMap<>();
        
        userId.put("empId", empVO.getEmpId());
        
        return userId;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 비밀번호 찾기
     */
    public Map<String, String> selectEmpPw(LoginRequestDTO loginRequestDTO) {
        
        EmpVO empVO = loginMapper.selectEmpPw(loginRequestDTO);
        
        Map<String, String> loginInfo = new HashMap<>();
        
        loginInfo.put("empId", empVO.getEmpId());
        loginInfo.put("empPw", empVO.getEmpPw());
        loginInfo.put("korName", empVO.getKorName());
        
        return loginInfo;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 비밀번호 재설정
     */
    public int updateEmpPw(LoginRequestDTO loginRequestDTO) {
        
        int result = loginMapper.updateEmpPw(loginRequestDTO);
        
        return result;
    }
    
}
