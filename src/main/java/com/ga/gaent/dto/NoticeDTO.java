package com.ga.gaent.dto;

import lombok.Data;

@Data
public class NoticeDTO {
    private int noticeNum;
    private String noticeWriter;
    private String fileName;
    private String noticeCategory;
    private String noticeTitle;
    private String noticeContent;
    private String noticeCreateDate;
    private String noticeUpdateDate;
    private int noticeCount;
}
