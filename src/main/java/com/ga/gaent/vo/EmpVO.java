package com.ga.gaent.vo;

import java.util.Calendar;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpVO {

    private String empCode;
    private String teamCode;
    private String teamName;
    private String parentTeamCode;
    private String rankCode;
    private String profile;
    private String empId;
    private String empPw;
    private String korName;
    private String engName;
    private String regNo;
    private int age;
    
    void calAge() {
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int birth = Integer.parseInt(this.regNo.substring(0, 1));
        this.age = year - birth;
    }
    
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
}
