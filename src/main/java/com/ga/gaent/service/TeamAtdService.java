package com.ga.gaent.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ga.gaent.mapper.AtdMapper;
import com.ga.gaent.mapper.TeamAtdMapper;
import com.ga.gaent.util.TeamColor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class TeamAtdService {
    @Autowired TeamAtdMapper teamAtdMapper;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 팀 출근 이력 리스트 조회
     */
    public List< Map<String, Object>>getTeamAtdStatus(String teamCode,String year,String week){
        
        
        Map<String, Object>m = new HashMap<>();
        m.put("teamCode", teamCode);
        m.put("year", year);
        m.put("week", week);
        
        
        List<Map<String, Object>>list = teamAtdMapper.selectTeamAtdStatus(m);
        
        return list;
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 주간별 팀 출근 현황 횟수 조회
     */
    public Map<String, Object>getTeamAtdStatusCount(String teamCode,String year,String week){
        
        Map<String, Object>m = new HashMap<>();
        m.put("teamCode", teamCode);
        m.put("year", year);
        m.put("week", week);
        
        return teamAtdMapper.selectTeamAtdStatusCount(m);
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 31. 
     * Description : 주간별 팀 개인 출근 현황 횟수 조회
     */
    public List<Map<String, Object>>getPersonalAtdStatus(String teamCode,String year,String week){
        
        Map<String, Object>m = new HashMap<>();
        m.put("teamCode", teamCode);
        m.put("year", year);
        m.put("week", week);
        
        return teamAtdMapper.selectPersonalAtdStatus(m);
    }
    
    
    
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 팀 근태현황 출력시 필요한 map 구하기
     */
    public Map<String, Object>getDateOfWeek(String year,String fullWeek){
        
        // 캘린더 객체 선언
        Calendar today = Calendar.getInstance();
        // 연도를 설정하지 않으면 현재연도로 설정
        if(year==null) {
           year = String.valueOf(today.get(Calendar.YEAR));
        }
        // 주를 선택하지 않으면 현재 주로 설정
       if(fullWeek == null ) {
        fullWeek = String.valueOf(today.get(Calendar.WEEK_OF_YEAR));
       }   
       
       
       // 올해의 마지막 주 값 구하기
       LocalDate lastDayOfThisYear = LocalDate.of(Integer.parseInt(year), 12, 31);
       WeekFields thisWeekFields = WeekFields.of(Locale.getDefault());
       int lastWeekOfThisYear = lastDayOfThisYear.get(thisWeekFields.weekOfYear());
       
       // 매년 첫주에서 이전 연도로 넘어가거나 매년 마지막주에서 다음연도로 넘어갈때
        if(Integer.parseInt(fullWeek) <= 0   ) {
            year = String.valueOf( Integer.parseInt(year) -1);
            LocalDate lastDayOfYear = LocalDate.of(Integer.parseInt(year), 12, 31);
            WeekFields weekFields = WeekFields.of(Locale.getDefault());
            fullWeek = String.valueOf(lastDayOfYear.get(weekFields.weekOfYear()));
        }else if(Integer.parseInt(fullWeek) >= lastWeekOfThisYear ) {
            year = String.valueOf( Integer.parseInt(year) +1);
            fullWeek = "1";
        }
        
        // 날짜 포맷 정의
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일");

        // 연도와 주 번호를 사용하여 월요일 날짜 계산
        int weekNumber = Integer.parseInt(fullWeek);
        LocalDate mondayOfWeek = LocalDate.parse(year + "-01-01").with(DayOfWeek.MONDAY).plusWeeks(weekNumber - 1);
        
        // 날짜를 저장할 Map 생성
        Map<String, Object> dateMap = new HashMap<>();
        for (int i = 0; i < 5; i++) {
            // 현재 날짜를 Map에 추가, 새로운 포맷으로 변환
            String formattedDate = mondayOfWeek.plusDays(i).format(outputFormatter);
            dateMap.put("date" + (i + 1), formattedDate);
        }
        dateMap.put("year",year);
        dateMap.put("fullWeek",fullWeek);
        dateMap.put("nowWeek", today.get(Calendar.WEEK_OF_YEAR));
        
        return dateMap;
        
    }
}
