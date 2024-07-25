package com.ga.gaent.dto;

import lombok.Data;

@Data
public class AtdDTO {
    int msgNum;
    
    String empCode;
    
    String inTime;
    
    String outTime;
    
    String year;
    String month;
    String day;
    
    String dailyWorkTime;
    String weeklyWorkTime;
    String monthlyWorkTime;
}
