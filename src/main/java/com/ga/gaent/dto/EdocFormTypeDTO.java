package com.ga.gaent.dto;

import lombok.Data;

@Data
public class EdocFormTypeDTO {
    
    private String edocType;
    private int edocNum;
    
    // 기안서
    private String propStartDate;
    private String propEndDate;
    private String propTitle;
    private String propContent;
    
    // 휴가신청서
    private String vacStartDate;
    private String vacEndDate;
    private String vacType;
    private String vacReason;
    
    // 지출결의서
    private String projectTitle;
    private String projectContent;
    private String projectEstimate;
    
    // 경조사 지출 결의서
    private String eventType;
    private String eventDate;
    private String eventPlace;
    private String eventExpense;
    
    // 보고서
    private String reportType;
    private String reportContent;

}
