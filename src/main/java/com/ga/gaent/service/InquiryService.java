package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.InquiryMapper;
import com.ga.gaent.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class InquiryService {
    
    private final String yellow = "\u001B[33m";
    
    @Autowired
    InquiryMapper inquiryMapper;
    
    // 직원 리스트 정보 조회
    public List<EmpVO> selectEmpList(int currentPage, int rowPerPage){
        
        int startRow = (currentPage - 1) * rowPerPage;
        
        Map<String, Integer> map = new HashMap<>();
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);
        
        List<EmpVO> empList = inquiryMapper.selectEmpList(map);
        log.debug(yellow + "empList : " + empList + yellow);
        
        return empList;
    }
    
    // 직원 리스트 카운트
    public int selectEmpCount() {
        
        int empCount = inquiryMapper.selectEmpCount();
        log.debug(yellow + "empCount : " + empCount + yellow);
        
        return empCount;
    }
}
