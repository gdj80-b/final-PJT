package com.ga.gaent.vo;

import lombok.Data;

@Data
public class FileVO {
    private String fileName;
    private String originalName;
    private String fileType;
    private long fileSize;
    private String createDate;
    
    // 업데이트에 필요한 파일이름
    private String updateFileName;
}
