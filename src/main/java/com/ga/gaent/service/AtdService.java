package com.ga.gaent.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.mapper.AtdMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class AtdService {
    @Autowired AtdMapper atdMapper;
    
    // 출퇴근여부
    public AtdDTO checkAtd(String empCode) {
        
        AtdDTO check = atdMapper.checkAtdStatus(empCode);
        
        AtdDTO v =   new AtdDTO();
        v.setEmpCode(empCode);

        
        if(check!=null) {
           v.setInTime(check.getInTime());
           v.setWeeklyWorkTime(check.getWeeklyWorkTime());
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
    
    
    @Scheduled(cron = "0 12 * * * *")   //매일 12시간마다
    void eliminateMsg() {
        String empCode = "20110004";
//        int daily = atdMapper.dailyWorkMinutes(empCode);
//        int weekly = atdMapper.weeklyWorkMinutes(empCode);
//        int montly = atdMapper.monthlyWorkMinutes(empCode);
//        
//        
//        String dailyWorkTime  =  (daily/60) + "시간" + (daily%60) + "분"  ;
//        String weeklyWorkTime  =  (weekly/60) + "시간" + (weekly%60) + "분"  ;
//        String montlyWorkTime  =  (montly/60) + "시간" + (montly%60) + "분"  ;
//        
//        System.out.println(dailyWorkTime);
//        System.out.println(weeklyWorkTime);
//        System.out.println(montlyWorkTime);
        
    }
}
