package com.ga.gaent.dto;

import lombok.Data;

@Data
public class AtdDTO {
    private int msgNum;
    
    private String empCode;
    
    private String inTime;
    
    private String outTime;
    
    private String year;
    private String month;
    private String day;
    
    private String atdStatus; 
    
    private String dailyWorkTime;
    private String weeklyWorkTime;
    private String monthlyWorkTime;
}
