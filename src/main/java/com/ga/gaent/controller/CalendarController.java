package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.CalendarService;
import com.ga.gaent.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/calendar")
public class CalendarController {
    
    @Autowired
    CalendarService calendarService;
    
    // 기본 페이지 표시
    @RequestMapping
    public String viewCalendar() {
        return "calendar/calendar";
    }
    
    @GetMapping("/addEvent")
    public String addEventForm() {
        return "calendar/addEvent";
    }
    
    @PostMapping("/addEvent")
    public String addEventAction(CalendarVO calendar) {
        
        calendar.formatDate(calendar.getCalStartDate(), calendar.getCalEndDate());
        
        int addEvent = calendarService.insertEvent(calendar);
        
        if (addEvent == 1) {
            return "redirect:/calendar";
        } else {
            return "redirect:/gaent/calendar/addEvent";
        }
    }
    
    // ajax 데이터 전송 URL
    @GetMapping("/event")
    public @ResponseBody List<Map<String, Object>> getEventList() {

        return calendarService.selectEventList();
    }
}
