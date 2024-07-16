package com.ga.gaent.dto;

import org.springframework.web.multipart.MultipartFile;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileReqDTO {
    // 해당 타입 확장자만 가능
    private static final String[] ALLOWED_TYPES = { "image", "text", "application/pdf"};
    
    private MultipartFile gaFile;
    
    public void validateFileType() {
        if(!isValidFileType(this.gaFile.getContentType())) {
            throw new RuntimeException ("Invalid file type: " + this.gaFile.getContentType());
        }
    }
    
    private boolean isValidFileType(String fileType) {
        for (String allowedType : ALLOWED_TYPES) {
            if (fileType.startsWith(allowedType)) {
                return true;
            }
        }
        return false;
    }
}
