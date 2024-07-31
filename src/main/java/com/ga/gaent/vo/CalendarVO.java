package com.ga.gaent.vo;

import com.ga.gaent.util.TeamColor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class CalendarVO {

    private String calNum;
    private String calWriter;
    private String calType;
    private String calTargetType;
    private String calTitle;
    private String calContent;
    private String calStartDate;
    private String calEndDate;
    private String calCreateDate;
    private String calUpdateDate;
    
    // datetime-local type을 datetime type으로 변환하여 DB에 저장
    public void formatDate(String calStartDate, String calEndDate) {
        log.debug(TeamColor.BLUE_BG + "VO calStartDate: " + calStartDate + TeamColor.RESET);
        log.debug(TeamColor.GREEN_BG + "VO calEndDate: " + calEndDate + TeamColor.RESET);
        this.calStartDate = calStartDate.replace("T", " ");
        this.calEndDate = calEndDate.replace("T", " ");
    }
    
    // 일정분류 조회를 위한 데이터
    private String teamCode;
    private String teamName;
}
