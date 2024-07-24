package com.ga.gaent.service;

import static org.hamcrest.CoreMatchers.nullValue;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.ga.gaent.util.Paging;
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
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 메인 호출
     */
    public List<Map<String, Object>> selectCommunityToMain() {
        return boardMapper.selectCommunityToMain();
    }
    
    public List<Map<String, Object>> selectNoticeToMain() {
        return boardMapper.selectNoticeToMain();
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 리스트 호출, 게시글 총 갯수
     */
    public List<Map<String, Object>> selectCommunityList(int nowPage, int rowPerPage) {
        
        int startRow = (nowPage - 1) * rowPerPage;
        return boardMapper.selectCommunityList(startRow, rowPerPage);
    }
    
    public List<Map<String, Object>> selectNoticeList(int nowPage, int rowPerPage) {
        
        int startRow = (nowPage - 1) * rowPerPage;
        return boardMapper.selectNoticeList(startRow, rowPerPage);
    }
    
    public Map<String, Object> selectCommunityListPaging(int nowPage) {
        
        Map<String, Object> pagingMap = new HashMap<>();
        
        int totalRow = boardMapper.selectCommunityListTotal();
        
        Paging page = new Paging();
        pagingMap = page.Paging(nowPage, totalRow);
        
        return pagingMap;
    }
    
    public Map<String, Object> selectNoticeListPaging(int nowPage) {
        
        Map<String, Object> pagingMap = new HashMap<>();
        
        int totalRow = boardMapper.selectNoticeListTotal();
        
        Paging page = new Paging();
        pagingMap = page.Paging(nowPage, totalRow);
        
        return pagingMap;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 상세 조회
     */
    public Map<String, Object> selectCommunityDetail(int boardNum) {
        return boardMapper.selectCommunityDetail(boardNum);
    }
    
    public Map<String, Object> selectNoticeDetail(int boardNum) {
        return boardMapper.selectNoticeDetail(boardNum);
    }
}
