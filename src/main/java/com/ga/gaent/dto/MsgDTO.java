package com.ga.gaent.dto;

import lombok.Data;

@Data
public class MsgDTO {
    
    private int msgNum;
    private String sender;
    private String senderName;
    private String receiver;
    private String receiverName;
    private String msgFileName;
    private String msgOriginalFileName;
    private String msgTitle;
    private String msgContent;
    private String sendTime;
    private String readTime;
    private String sendDelStatus;
    private String receiveDelStatus;
    
}
