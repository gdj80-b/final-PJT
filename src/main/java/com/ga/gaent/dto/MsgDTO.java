package com.ga.gaent.dto;

import lombok.Data;

@Data
public class MsgDTO {
    
    int msgNum;
    
    String sender;

    String senderName;
    
    String receiver;
   
    String receiverName;
    
    Long fileName;
    
    String msgTitle;
    
    String msgContent;
    
    String sendTime;
    
    String readTime;
    
    String sendDelStatus;
    
    String receiveDelStatus;
    
}
