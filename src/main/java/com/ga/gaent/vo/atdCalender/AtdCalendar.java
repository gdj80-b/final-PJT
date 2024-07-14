package com.ga.gaent.vo.atdCalender;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import lombok.Data;

@Data
public class AtdCalendar {
        // 주어진 년도와 월에 대한 달력 정보를 계산하는 메서드
        public Map<String, Object> targetCalendar(String tgYear, String tgMonth) {

        // Calendar 인스턴스를 초기화하고, 대상 년도와 월의 첫째 날로 설정
        Calendar targetDate = Calendar.getInstance();
        targetDate.set(Calendar.YEAR, Integer.parseInt(tgYear)); // 대상 년도 설정
        targetDate.set(Calendar.MONTH, Integer.parseInt(tgMonth) - 1); // 대상 월 설정 (0부터 시작하므로 -1)
        targetDate.set(Calendar.DATE, 1); // 1일로 설정

        // 달의 첫째 날
        int tgDay = targetDate.get(Calendar.DAY_OF_MONTH);
        // 달의 첫째 날의 요일
        int tgYoil = targetDate.get(Calendar.DAY_OF_WEEK);
        // 달의 첫째 주
        int tgWeek = targetDate.get(Calendar.WEEK_OF_MONTH);
        // 연간 몇 번째 주
        int tgFullWeek = targetDate.get(Calendar.WEEK_OF_YEAR);
        // 달의 마지막 날
        int tgLastDate = targetDate.getActualMaximum(Calendar.DATE);
        // 첫 주의 빈 칸 수 (일요일 = 0, 월요일 = 1, ..., 토요일 = 6)
        int preBlank = tgYoil - 1;
        // 마지막 주의 빈 칸 수
        int afterBlank = 0;
        // 요일 배열
        String[] dayOfWeek = { "월", "화", "수", "목", "금", "토","일"};

        // 전체 칸 수가 7로 나누어 떨어지지 않을 경우, 마지막 주의 빈 칸 수 계산
        if ((preBlank + tgLastDate + afterBlank) % 7 != 0) {
            afterBlank = 7 - (preBlank + tgLastDate + afterBlank) % 7;
        }
        // 총 칸 수
        int totalDiv = preBlank + tgLastDate + afterBlank;
                
        // 결과를 담을 Map 생성
        Map<String, Object> c = new HashMap<>();
        c.put("tgYear", tgYear); // 년도
        c.put("tgMonth", targetDate.get(Calendar.MONTH) + 1); // 월 (0부터 시작하므로 +1)
        c.put("tgDay", tgDay); // 일
        c.put("tgYoil", tgYoil); // 요일
        c.put("tgWeek", tgWeek); // 몇 번째 주
        c.put("tgFullWeek", tgFullWeek); // 연간 몇 번째 주
        c.put("tgLastDate", tgLastDate); // 현재 달의 마지막 일
        c.put("preBlank", preBlank); // 첫 주의 빈 칸 수
        c.put("totalDiv", totalDiv); // 총 칸 수
        c.put("afterBlank", afterBlank); // 마지막 주의 빈 칸 수
        c.put("dayOfWeek", dayOfWeek); // 요일 배열        
        
        return c;
    }
}
