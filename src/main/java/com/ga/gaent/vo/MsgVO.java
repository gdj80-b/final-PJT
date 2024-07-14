package com.ga.gaent.vo;

import lombok.Data;

@Data
public class MsgVO {
    
    int msgNum;
    String sender;
    String senderName;
    String receiver;
    String receiverName;
    Long msgFileName;
    String msgTitle;
    String msgContent;
    String sendTime;
    String readTime;
    String sendDelStatus;
    String receiveDelStatus;
    
}
