package com.ga.gaent.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String viewCalendar(Model model) {
        
        List<Map<String, Object>> eventType = calendarService.selectEventType();
        List<Map<String, Object>> eventTarget = calendarService.selectEventTarget();
        
        model.addAttribute("eventType", eventType);
        model.addAttribute("eventTarget", eventTarget);
        
        return "calendar/calendar";
    }
    
    // 일정등록 폼
    @GetMapping("/addEvent")
    public String addEventForm() {
        return "calendar/addEvent";
    }
    
    // 일정등록 액션
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
    
    // 일정조회
    // ajax 데이터 전송 URL
    @GetMapping("/event")
    public @ResponseBody List<Map<String, Object>> getEventList() {

        return calendarService.selectEventList();
    }
    
    // 일정상세
    @GetMapping("/eventOne")
    public String getEventOne(Model model, int calNum) {
        
        List<String> eventOne = calendarService.selectEventOne(calNum);
        model.addAttribute("eventOne", eventOne);
        
        return "calendar/eventOne";
    }
    
    // 일정삭제
    @GetMapping("/removeEvent")
    public String removeEvent(int calNum) {
        
        int removeEvent = calendarService.deleteEvent(calNum);
        if(removeEvent == 1) {
            return "redirect:/calendar";
        }else {
            return "redirect:/calendar/eventOne?calNum=" + calNum;
        }
    }
    
    // 일정수정
    @PostMapping("/modifyEvent")
    public String modifyEvent(CalendarVO calendar) {
        
        calendar.formatDate(calendar.getCalStartDate(), calendar.getCalEndDate());
        
        int modifyEvent = calendarService.updateEvent(calendar);
        if(modifyEvent == 1) {
            return "redirect:/calendar";
        }else {
            return "redirect:/calendar";
        }
    }
}
