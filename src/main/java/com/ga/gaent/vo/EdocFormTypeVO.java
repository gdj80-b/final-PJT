package com.ga.gaent.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EdocFormTypeVO {

    private String edocType;
    private String edocFormTitle;
    private String edocFormDesc;
    private String edocFormCreateDate;
    private String edocFormUpdateDate;
}
