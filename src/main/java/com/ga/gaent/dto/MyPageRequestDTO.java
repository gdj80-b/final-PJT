package com.ga.gaent.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyPageRequestDTO {

    private String myPageProfile;
    
    @NotBlank(message = "사원계정을 입력해주세요.")
    @Email(message = "이메일의 형식이 유효하지 않습니다.")
    private String myPageEmpId;
    
    @NotBlank(message = "비밀번호를 입력해주세요.")
    @Size(min = 3, message = "비밀번호는 최소 4자리 입니다.")
    private String myPageEmpPassword;
    
    private String myPagePhone;

    private String myPageEmpCode;
    private String updateFileName;
}
