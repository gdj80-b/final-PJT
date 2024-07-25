package com.ga.gaent.util;

import java.io.File;
import org.springframework.stereotype.Component;
import com.ga.gaent.dto.FileReqDTO;
import jakarta.annotation.PostConstruct;

@Component
public class FileUploadSetting {
    private static String UPLOAD_DIR;

    /*
     * @author : 조인환
     * @since : 2024. 07. 16.
     * Description : 파일이 저장되는 위치 설정
     */
    @PostConstruct
    public void initDIR() {
        try {

            String projectDir = System.getProperty("user.dir") + "/src/main/resources/static/upload/";

            UPLOAD_DIR = projectDir;
            // System.out.println("쪽지파일저장위치: " + UPLOAD_DIR);

        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize UPLOAD_DIR", e);
        }
    }

    /*
     * @author : 조인환
     * @since : 2024. 07. 16.
     * Description : 실제파일저장
     */
    public int insertFile(String newFileName, FileReqDTO fileReqDTO, String dir) {
        File destinationFile = new File(UPLOAD_DIR + dir + File.separator + newFileName);

        try {
            fileReqDTO.getGaFile().transferTo(destinationFile);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("File transfer failed.", e);
        }

        return 1;
    }

}
