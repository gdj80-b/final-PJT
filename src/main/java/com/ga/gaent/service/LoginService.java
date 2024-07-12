package com.ga.gaent.service;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ga.gaent.dto.LoginRequestDTO;
import com.ga.gaent.mapper.LoginMapper;
import com.ga.gaent.vo.EmpVO;

@Service
public class LoginService {
    
    @Autowired LoginMapper loginMapper;

    public EmpVO selectLoginCheck(Map<String, String> loginInfo) {
        return loginMapper.selectLoginCheck(loginInfo);
    }
}
