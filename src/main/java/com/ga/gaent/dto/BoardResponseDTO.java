package com.ga.gaent.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardResponseDTO {

    private int commNum;
    private String commEmpCode;
    private String commWriter;
    private String commFileName;
    private String commTitle;
    private String commContent;
    private String commCreateDate;
    private String commUpdateDate;
    private int commCount;
    
    private int noticeNum;
    private String noticeEmpCode;
    private String noticeWriter;
    private String noticeFileName;
    private String noticeTitle;
    private String noticeContent;
    private String noticeCreateDate;
    private String noticeUpdateDate;
    private int noticeCount;
}
