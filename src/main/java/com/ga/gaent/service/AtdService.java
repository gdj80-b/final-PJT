package com.ga.gaent.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.mapper.AtdMapper;
import com.ga.gaent.vo.AtdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class AtdService {
    @Autowired AtdMapper atdMapper;
    
    // 출퇴근여부
    public AtdVO checkAtd(String empCode) {
        
        AtdVO check = atdMapper.checkAtdStatus(empCode);
                
        AtdVO v =   new AtdVO();
        v.setEmpCode(empCode);
        
        if(check!=null) {
           v.setInTime(check.getInTime());
           if(check.getOutTime()!= null) {
               v.setOutTime(check.getOutTime());
           }
        }
        
        return v ;        
    }
    
  //출근 등록
    public int atdIn(String empCode) {   
        return atdMapper.atdIn(empCode) ;
    }
    
    //퇴근 등록
    public int atdOut(String empCode) {      
        return atdMapper.atdOut(empCode);        
    }
    
    // 출퇴근 내역
    public List<AtdDTO> getAtdHistory(String empCode){
        
        return atdMapper.selectAtdHistory(empCode);
    }
}
