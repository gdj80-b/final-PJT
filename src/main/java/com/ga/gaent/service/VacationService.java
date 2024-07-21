package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ga.gaent.dto.VacationDTO;
import com.ga.gaent.mapper.VacationMapper;
import com.ga.gaent.util.Paging;

@Service
public class VacationService {
    @Autowired VacationMapper vacationMapper;
    
    public Map<String,Object>selectMyVacStatus(String empCode){
        
        return vacationMapper.selectMyVacStatus(empCode);
    }
    
    // 휴가내역리스트
    public List<VacationDTO>selectMyVacList(String empCode){
        
        Map<String, Object>m = new HashMap<>();
        m.put("empCode", empCode);
        
        return vacationMapper.selectMyVacList(m);
    }
    
    
    // 페이징
    public Map<String, Object> getPagingIdx(String empCode, int currentPage) {
        
        
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        
        // total페이지를 구함
        int totalRow = vacationMapper.myVacCnt(m);
        
        // 페이징을 위한 요소들을 담아옴
        Paging v = new Paging();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);
        
        
        return pagingMap; 
    }
    
    
}
