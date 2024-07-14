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
    
    // 일정 등록
    public int insertEvent(CalendarVO calendar) {
        
        int addEvent = calendarMapper.insertEvent(calendar);
        
        if(addEvent == 1) {
            log.debug("일정 등록 성공");
        }else{
            log.debug("일정 등록 실패");
        }
        return addEvent;
    }
    
    // 일정 조회
    public List<Map<String, Object>> selectEventList() {

        List<Map<String, Object>> eventList = calendarMapper.selectEventList();
        
        return eventList;
    }
}
