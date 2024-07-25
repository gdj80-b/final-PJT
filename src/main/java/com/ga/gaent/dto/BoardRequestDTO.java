package com.ga.gaent.dto;

import lombok.Data;

@Data
public class BoardRequestDTO {

    private String empCode;
    private String articleType;
    private String articleTitle;
    private String articleContent;
    private String fileName;
}
