package com.ga.gaent.controller;

import java.util.HashMap;
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
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/calendar")
public class CalendarController {
    
    @Autowired
    CalendarService calendarService;
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 캘린더 기본 페이지 표시
     */
    @RequestMapping
    public String viewCalendar(Model model) {
        
        /*
         * @author : 김형호
         * @since : 2024. 07. 23.
         * Description : 일정타입 조회
         */
        List<Map<String, Object>> eventType = calendarService.selectEventType();
        /*
         * @author : 김형호
         * @since : 2024. 07. 23.
         * Description : 일정분류 조회
         */
        List<Map<String, Object>> eventTarget = calendarService.selectEventTarget();
        
        model.addAttribute("eventType", eventType);
        model.addAttribute("eventTarget", eventTarget);
        
        return "calendar/calendar";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정등록 폼
     */
    @GetMapping("/addEvent")
    public String addEventForm(Model model) {
        
        List<Map<String, Object>> eventType = calendarService.selectEventType();
        List<Map<String, Object>> eventTarget = calendarService.selectEventTarget();
        
        model.addAttribute("eventType", eventType);
        model.addAttribute("eventTarget", eventTarget);
        
        return "calendar/addEvent";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정등록 액션
     */
    @PostMapping("/addEvent")
    public String addEventAction(CalendarVO calendar) {
        
        log.debug(TeamColor.BLUE_BG + "calStartDate: " + calendar.getCalStartDate() + TeamColor.RESET);
        log.debug(TeamColor.GREEN_BG + "calEndDate: " + calendar.getCalEndDate() + TeamColor.RESET);
        calendar.formatDate(calendar.getCalStartDate(), calendar.getCalEndDate());
        
        int addEvent = calendarService.insertEvent(calendar);
        
        if (addEvent == 1) {
            return "redirect:/calendar";
        } else {
            return "redirect:/gaent/calendar/addEvent";
        }
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정조회
     */
    @GetMapping("/event")
    public @ResponseBody List<Map<String, Object>> getEventList(
            @RequestParam(required = false) String empCode,
            @RequestParam(required = false) String teamCode,
            @RequestParam(required = false, defaultValue = "all") String filter) {
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("empCode", empCode);
        map.put("teamCode", teamCode);
        
        System.out.println("filter : " + filter);
        System.out.println("map : " + map);
        
        switch (filter) {
            case "all":
                return calendarService.selectAllEvents(map);
            case "personal":
                return calendarService.selectPersonalEvents(empCode);
            case "team":
                return calendarService.selectTeamEvents(teamCode);
            case "company":
                return calendarService.selectCompanyEvents();
            case "artist":
                return calendarService.selectArtistEvents();
            default:
                return calendarService.selectAllEvents(map);
        }
        
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정상세
     */
    @GetMapping("/eventOne")
    public String getEventOne(Model model, int calNum) {
        
        List<String> eventOne = calendarService.selectEventOne(calNum);
        model.addAttribute("eventOne", eventOne);
        
        return "calendar/eventOne";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정삭제
     */
    @GetMapping("/removeEvent")
    public String removeEvent(int calNum) {
        
        int removeEvent = calendarService.deleteEvent(calNum);
        if(removeEvent == 1) {
            return "redirect:/calendar";
        }else {
            return "redirect:/calendar";
        }
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 15.
     * Description : 일정수정 폼
     */
    @GetMapping("/modifyEvent")
    public String modifyEvent(Model model, int calNum) {
        
        List<String> eventOne = calendarService.selectEventOne(calNum);
        // 일정분류 조회
        List<Map<String, Object>> eventTarget = calendarService.selectEventTarget();
        
        model.addAttribute("eventOne", eventOne);
        model.addAttribute("eventTarget", eventTarget);
        
        return "calendar/modifyEvent";
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 15.
     * Description : 일정수정 액션
     */
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
