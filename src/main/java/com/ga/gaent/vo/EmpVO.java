package com.ga.gaent.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpVO {

    private String empCode;
    private String teamCode;
    private String rankCode;
    private String profile;
    private String email;
    private String korName;
    private String engName;
    private String regNo;
    private String gender;
    private String phone;
    private String emergencyPhoneRelation;
    private String emergencyphone;
    private String postCode;
    private String address;
    private String detailAddress;
    private int totalLeave;
    private int useLeave;
    private String ext;
    private String hireDate;
    private String resignDate;
    private String updateDate;
    private String finalModifier;
}
