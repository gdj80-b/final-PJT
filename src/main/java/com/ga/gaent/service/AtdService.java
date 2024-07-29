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
import com.ga.gaent.util.TeamColor;
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
    public List<AtdDTO> getAtdHistory(String empCode,String year,String month){
        
        Map<String, Object>m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("year", year);
        m.put("month", month);
        
        return atdMapper.selectAtdHistory(m);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22. 
     * Description : 개인 근무시간 조회
     */
    public Map<String, Object>getAtdStatus(String empCode){
        
        
        Map<String, Object> map = new HashMap<>();

        Integer daily = atdMapper.dailyWorkMinutes(empCode);
        Integer weekly = atdMapper.weeklyWorkMinutes(empCode);
        Integer montly = atdMapper.monthlyWorkMinutes(empCode);

        

        if (montly != null) {
            String montlyWorkTime = (montly / 60) + "시간" + (montly % 60) + "분";
            map.put("montlyWorkTime", montlyWorkTime);
        }else {
            map.put("montlyWorkTime", "0시간 0분");
        }

        
        if (weekly != null) {
            String weeklyWorkTime = (weekly / 60) + "시간" + (weekly % 60) + "분";
            map.put("weeklyWorkTime", weeklyWorkTime);
        }else {
            map.put("weeklyWorkTime", "0시간 0분");
        }

        if (daily != null) {
            String dailyWorkTime = (daily / 60) + "시간" + (daily % 60) + "분";
            map.put("dailyWorkTime", dailyWorkTime);
        }else {
            map.put("dailyWorkTime", "0시간 0분");
        }
      
        return map;
        
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 29. 
     * Description : 근무 상태 횟수 조회
     */
    public Map<String, Object>getAtdStatusCnt(String empCode,String year,String month){
        
        Map<String, Object> map = new HashMap<>();
        Map<String, Object>m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("year", year);
        m.put("month", month);
        
        return atdMapper.selectAtdStatusCount(m);
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 29. 
     * Description : 출근하지 않은사람들 자동등록되는 매서드
     */
    @Scheduled(cron = "0 55 11 * * 1-5")
    void registerAtdByScheduler() {
          
        int success = 0;
        List<String>empCodeList = atdMapper.getNotAtendEmpCode();
        for( String empCode : empCodeList) {
            
           success = success + atdMapper.autoRegisterAtd(empCode);
                      
        }
      
        log.debug(TeamColor.RED + "자동 입력: " + success + TeamColor.RESET);
    }
}
