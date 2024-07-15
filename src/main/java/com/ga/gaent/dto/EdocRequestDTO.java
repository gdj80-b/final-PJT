package com.ga.gaent.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EdocRequestDTO {

    private String edocType;
    private String edocWriter;
    private String fileName;
    private String edocTitle;
    private String[] approver;
    private String[] apprOrder;
    private String propStartDate;
    private String propEndDate;
    private String propTitle;
    private String propContent;
}
