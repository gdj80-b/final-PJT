package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 14. 
     * Description : 개인 출퇴근 여부 조회
     */
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
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 15. 
     * Description : 출근 등록
     */
    public int atdIn(String empCode) {   
        return atdMapper.atdIn(empCode) ;
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 15. 
     * Description : 퇴근등록
     */
    public int atdOut(String empCode) {      
        return atdMapper.atdOut(empCode);        
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 14. 
     * Description : 개인 출근 이력 리스트 조회
     */
    public List<AtdDTO> getAtdHistory(String empCode){
        
        return atdMapper.selectAtdHistory(empCode);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22. 
     * Description : 개인 근무시간 조회
     */
    public Map<String, Object>getAtdStatus(String empCode){
        
        int daily = atdMapper.dailyWorkMinutes(empCode);
        int weekly = atdMapper.weeklyWorkMinutes(empCode);
        int montly = atdMapper.monthlyWorkMinutes(empCode);
      
      
        String dailyWorkTime  =  (daily/60) + "시간" + (daily%60) + "분"  ;
        String weeklyWorkTime  =  (weekly/60) + "시간" + (weekly%60) + "분"  ;
        String montlyWorkTime  =  (montly/60) + "시간" + (montly%60) + "분"  ;
        
        Map<String, Object>map = new HashMap<>();
        map.put("dailyWorkTime", dailyWorkTime);
        map.put("weeklyWorkTime", weeklyWorkTime);
        map.put("montlyWorkTime", montlyWorkTime);
        
        return map;
        
    }
    
    
    @Scheduled(cron = "0 12 * * * *")   //매일 12시간마다
    void eliminateMsg() {

//        
//        System.out.println(dailyWorkTime);
//        System.out.println(weeklyWorkTime);
//        System.out.println(montlyWorkTime);
        
    }
}
