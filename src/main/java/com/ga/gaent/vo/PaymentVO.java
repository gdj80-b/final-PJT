package com.ga.gaent.vo;

import lombok.Data;

@Data
public class PaymentVO {
    
    private int orderNum;
    
    private String prodCoe;
    
    private String empCode;
    
    private String payType;
    
    private int payAmount;
    
    private int payPrice;
    
    private String payTimeString;
}
