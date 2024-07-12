package com.ga.gaent.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginRequestDTO {

    // 로그인을 위한 이메일(아이디)
    @NotBlank(message = "공백을 입력하셨습니다.")
    private String email;
    
    // 로그인을 위한 비밀번호
    @NotBlank(message = "공백을 입력하셨습니다.")
    private String password;
    
    // 비밀번호 재설정을 위한 비밀번호 체크
    @NotBlank(message = "공백을 입력하셨습니다.")
    private String passwordCheck;
    
    public void validatePasswordCheck() {
        if(!this.password.equals(this.passwordCheck)) {
            throw new RuntimeException("패스워드가 일치하지 않습니다.");
        }
    }
    
    // 아이디, 비밀번호를 찾기 위한 이름
    @NotBlank(message = "공백을 입력하셨습니다.")
    private String name;
    
    // 아이디, 비밀번호를 찾기 위한 연락처
    @NotBlank(message = "공백을 입력하셨습니다.")
    private String phone;
}
