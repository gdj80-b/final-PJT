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
public class NewsRequestDTO {
    
    @NotBlank(message = "검색어를 입력해주세요.")
    @Size(max = 10, message = "검색어는 10자 이내로 입력해 주세요.")
    private String naverSearch;
}
