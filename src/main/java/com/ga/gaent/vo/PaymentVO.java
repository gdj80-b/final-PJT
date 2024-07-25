package com.ga.gaent.vo;

import lombok.Data;

@Data
public class PaymentVO {
    
    private int orderNum;
    private String prodCode;
    private String empCode;
    private String payType;
    private int payPrice;
    private String payTime;
}
