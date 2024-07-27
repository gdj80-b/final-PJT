package com.ga.gaent.vo;

import lombok.Data;

@Data
public class MsgVO {

    private int msgNum;
    private String sender;
    private String receiver;
    private String msgFileName;
    private String msgTitle;
    private String msgContent;
    private String sendTime;
    private String readTime;
    private String sendDelStatus;
    private String receiveDelStatus;
}
