package com.ga.gaent.dto;

import org.springframework.web.multipart.MultipartFile;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EdocRequestDTO {

    private int edocNum;

    private String edocType;
    private String edocWriter;
    private MultipartFile fileName;
    private String[] approver;
    private String[] apprOrder;

}


