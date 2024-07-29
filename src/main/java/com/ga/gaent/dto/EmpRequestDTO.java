package com.ga.gaent.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmpRequestDTO {

    @NotBlank(message = "사원번호를 입력해주세요.")
    @Size(max = 8, message = "사원번호는 최대 8자리 입니다.")
    private String empCode;
    
    @NotBlank(message = "부서를 선택해주세요.")
    private String teamCode;
    
    @NotBlank(message = "부서를 선택해주세요.")
    private String rankCode;
    
    private String profile;
    
    @NotBlank(message = "사원계정을 입력해주세요.")
    @Email(message = "이메일의 형식이 유효하지 않습니다.")
    private String empId;
    
    @NotBlank(message = "비밀번호를 입력해주세요.")
    @Size(min = 4, message = "비밀번호는 최소 4자리 입니다.")
    private String empPw;
    
    @NotBlank(message = "한글 이름을 입력해주세요.")
    @Size(min = 2, message = "성과 이름 최소 2글자를 입력해주세요.")
    private String korName;
    
    @NotBlank(message = "영문 이름을 입력해주세요.")
    private String firstEngName;
    
    @NotBlank(message = "영문 성을 입력해주세요.")
    private String lastEngName;
    
    private String engName;
    
    @NotBlank(message = "주민등록번호 앞 6자리를 입력해주세요.")
    @Size(min = 6, message = "6자리를 입력해주세요.")
    private String firstRegNo;
    
    @NotBlank(message = "주민등록번호 뒤 7자리를 입력해주세요.")
    @Size(min = 7, message = "7자리를 입력해주세요.")
    private String lastRegNo;
    
    private String regNo;
    
    @NotBlank(message = "성별을 선택해주세요.")
    private String gender;
    
    @NotBlank(message = "연락처를 입력해주세요.")
    private String phone;
    
    @NotBlank(message = "비상연락처의 관계를 선택해주세요.")
    private String emergencyPhoneRelation;

    @NotBlank(message = "비상연락처를 입력해주세요.")
    private String emergencyPhone;
    
    private String postCode;
    private String address;
    
    @NotBlank(message = "주소를 입력해주세요.")
    private String detailAddress;
    
    private int leave;
    private String ext;
    
    @NotBlank(message = "고용일을 입력해주세요.")
    private String hireDate;
    
    private String modifier;
    private String updateFileName;
}
