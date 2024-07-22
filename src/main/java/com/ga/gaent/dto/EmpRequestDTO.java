package com.ga.gaent.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpRequestDTO {

    private String empCode;
    private String teamCode;
    private String rankCode;
    private String profile;
    private String empId;
    private String empPw;
    private String korName;
    private String firstEngName;
    private String lastEngName;
    private String engName;
    private String firstRegNo;
    private String lastRegNo;
    private String regNo;
    private String gender;
    private String phone;
    private String emergencyPhoneRelation;
    private String emergencyPhone;
    private String postCode;
    private String address;
    private String detailAddress;
    private int leave;
    private String ext;
    private String hireDate;
    private String modifier;
    private String updateFileName;
}
