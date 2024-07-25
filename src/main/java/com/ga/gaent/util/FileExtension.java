package com.ga.gaent.util;

import org.springframework.stereotype.Component;

@Component
public class FileExtension {

    /*
     * @author : 조인환
     * @since : 2024. 07. 16.
     * Description : 파일 확장자 추출
     */
    public String getFileExtension(String filename) {
        int lastIndex = filename.lastIndexOf('.');
        if (lastIndex == -1) {
            return "";
        }
        return filename.substring(lastIndex);
    }
}
