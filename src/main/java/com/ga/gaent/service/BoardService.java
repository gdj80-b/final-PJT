package com.ga.gaent.service;

import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.ga.gaent.dto.BoardRequestDTO;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.mapper.BoardMapper;
import com.ga.gaent.mapper.FileMapper;
import com.ga.gaent.util.FileExtension;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.FileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class BoardService {

    @Autowired private BoardMapper boardMapper;
    
    @Autowired private FileMapper fileMapper;
    
    @Autowired private FileExtension fileExtension;
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글 작성하기
     */
    public String insertBoard(BoardRequestDTO boardRequestDTO, FileReqDTO fileReqDTO) {
        
        MultipartFile mf = fileReqDTO.getGaFile();
        
        if(!fileReqDTO.getGaFile().isEmpty()) {
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
            
            boardRequestDTO.setFileName(newFileName);
            log.debug(TeamColor.PURPLE_BG + "BoardService newFileName: " + newFileName + TeamColor.RESET);
            
            int row = fileMapper.insertBoardFile(gaFile);
            log.debug(TeamColor.PURPLE_BG + "BoardService row: " + row + TeamColor.RESET);
            
            String articleType = boardRequestDTO.getArticleType();
            int result = -1;
            
            if(articleType.equals("자유게시판")) {
                result = boardMapper.insertBoard(boardRequestDTO);
                log.debug(TeamColor.PURPLE_BG + "BoardService board: " + result + TeamColor.RESET);
            } else {
                result = boardMapper.insertNotice(boardRequestDTO);
                log.debug(TeamColor.PURPLE_BG + "BoardService notice: " + result + TeamColor.RESET);
            }
            
            if (row != 1 && result != 1) {
                throw new RuntimeException("게시글 작성에 실패했습니다.");
            }
            return newFileName;
        }
        
        return "empty";
    }
}
