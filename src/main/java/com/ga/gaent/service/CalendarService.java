package com.ga.gaent.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ga.gaent.mapper.CalendarMapper;
import com.ga.gaent.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CalendarService {

    @Autowired
    CalendarMapper calendarMapper;
    
    // 일정등록
    public int insertEvent(CalendarVO calendar) {
        
        int addEvent = calendarMapper.insertEvent(calendar);
        
        if(addEvent == 1) {
            log.debug("일정 등록 성공");
        }else{
            log.debug("일정 등록 실패");
        }
        return addEvent;
    }
    
    // 일정조회
    public List<Map<String, Object>> selectEventList() {

        List<Map<String, Object>> eventList = calendarMapper.selectEventList();
        
        return eventList;
    }
    
    // 일정상세
    public List<String> selectEventOne(int calNum){
        
        List<String> eventOne = calendarMapper.selectEventOne(calNum);
        
        return eventOne;
    }
    
    // 일정삭제
    public int deleteEvent(int calNum) {
        
        int deleteEvent = calendarMapper.deleteEvent(calNum);
        if(deleteEvent == 1) {
            log.debug("일정 삭제 성공");
        }else {
            log.debug("일정 삭제 실패");
        }
        return deleteEvent;
    }
    
    // 일정수정
    public int updateEvent(CalendarVO calendar) {
        
        int updateEvent = calendarMapper.updateEvent(calendar);
        if(updateEvent == 1) {
            log.debug("일정 수정 성공");
        }else {
            log.debug("일정 수정 실패");
        }
        return updateEvent;
    }
}
