package com.ga.gaent.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MsgRequestDTO {
    
    private String sender;
    
    @NotBlank(message = "받는이를 입력하세요.")
    private String receiver;
    
    private String msgFileName;
    
    @NotBlank(message = "제목을 입력하세요.")
    @Size(max = 20, message = "제목은 20자 이내로 입력하세요.")
    private String msgTitle;
    
    @NotBlank(message = "내용을 입력하세요.")
    @Size(max = 200, message = "제목은 200자 이내로 입력하세요.")
    private String msgContent;
}
