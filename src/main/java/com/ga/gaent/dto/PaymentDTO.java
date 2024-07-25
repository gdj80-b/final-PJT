package com.ga.gaent.dto;

import lombok.Data;

@Data
public class PaymentDTO {

    private int orderNum;
    private String prodCode;
    private String prodName;
    private String empCode;
    private String payType;
    private int payPrice;
    private String payTime;
}
