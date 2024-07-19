package com.ga.gaent.util.atdCalender;

import java.util.Calendar;
import java.util.Map;
import org.springframework.stereotype.Component;

@Component
public class AtdHistory {
public Map<String,Object> makeCalendar(String year, String month) {
        

        // Get current date if no year or month is provided
        Calendar currentDate = Calendar.getInstance();
        int currentYear = currentDate.get(Calendar.YEAR);
        int currentMonth = currentDate.get(Calendar.MONTH) + 1;

        int intYear = (year != null) ? Integer.parseInt(year) : currentYear;
        int intMonth = (month != null) ? Integer.parseInt(month) : currentMonth;

        if (intMonth > 12) {
            intMonth = 1;
            intYear += 1;
        } else if (intMonth < 1) {
            intMonth = 12;
            intYear -= 1;
        }

        Map<String, Object> target = new AtdCalendar().targetCalendar(String.valueOf(intYear), String.valueOf(intMonth));
        int prevMonth = intMonth - 1;
        int nextMonth = intMonth + 1;
        int prevYear = intYear;
        int nextYear = intYear;

        if (prevMonth < 1) {
            prevMonth = 12;
            prevYear -= 1;
        }
        if (nextMonth > 12) {
            nextMonth = 1;
            nextYear += 1;
        }

        target.put("prevYear", prevYear);
        target.put("prevMonth", prevMonth);
        target.put("nextYear", nextYear);
        target.put("nextMonth", nextMonth);
        
        return target;
    }
}
