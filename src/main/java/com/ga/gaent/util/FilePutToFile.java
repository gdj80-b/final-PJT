package com.ga.gaent.util;

import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import com.ga.gaent.vo.FileVO;

@Component
public class FilePutToFile {
    
    @Autowired FileExtension fileExtension;

    public FileVO filePutToFile(MultipartFile multipartFile) {
        
        MultipartFile mf = multipartFile;
        
        String originalFilename = mf.getOriginalFilename();
        String fileType = mf.getContentType().toLowerCase();
        long fileSize = mf.getSize();
        String prefix = UUID.randomUUID().toString().replace("-", "");
        String suffix = fileExtension.getFileExtension(originalFilename);
        String newFileName = prefix + suffix;
        
        FileVO gaFile = new FileVO();
        gaFile.setOriginalName(originalFilename);
        gaFile.setFileType(fileType);
        gaFile.setFileSize(fileSize);
        gaFile.setFileName(newFileName);
        
        return gaFile;
    }
}
