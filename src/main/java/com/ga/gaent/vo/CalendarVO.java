package com.ga.gaent.vo;

import lombok.Data;

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
        
        this.calStartDate = calStartDate.replace("T", " ");
        this.calEndDate = calEndDate.replace("T", " ");
    }
}
