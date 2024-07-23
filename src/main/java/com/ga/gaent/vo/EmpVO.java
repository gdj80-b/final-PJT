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
    private String empId;
    private String empPw;
    private String korName;
    private String engName;
    private String regNo;
    private String birth;
    private int age;
    private String gender;
    private String phone;
    private String emergencyPhoneRelation;
    private String emergencyPhone;
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
    
    // 직원 정보 리스트 조회에 필요한 컬럼
    private String rankName;
    private String teamName;
    private String parentTeamCode;
    private String parentTeamName;
}
