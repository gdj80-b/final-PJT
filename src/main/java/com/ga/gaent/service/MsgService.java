package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.dto.MsgDTO;
import com.ga.gaent.mapper.FileMapper;
import com.ga.gaent.mapper.MsgMapper;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.FileVO;
import com.ga.gaent.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MsgService {
    
    final String YELLOW = "\u001B[33m\n";
    final String RED = "\u001B[31m\n";
    final String RESET = "\u001B[0m\n";
    
    @Autowired
    MsgMapper msgMapper;
    @Autowired
    FileMapper fileMapper;

    // 쪽지리스트
    public List<MsgDTO> getMsgList(String empCode, int request, int currentPage, String searchMsg) {

        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        m.put("startRow", (currentPage - 1) * 10); // 10은 rowPerPage
        m.put("searchMsg", searchMsg);

        return msgMapper.selectMsgList(m);
    }

    // 페이징을 위한 쪽지 수
    public Map<String, Object> getPagingIdx(String empCode, int request, int currentPage, String searchMsg) {

        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        m.put("searchMsg", searchMsg);


        int totalRow = msgMapper.msgCnt(m); // 전체 row수
        log.debug(TeamColor.RED + "result: " + totalRow + TeamColor.RESET);

        PagingVO v = new PagingVO();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);


        return pagingMap;
    }


    // 쪽지 보내기
    /*
     * @author : 조인환, 정건희
     * 
     * @since : 2024. 07. 16. Description : 결재대기문서 리스트 조회
     */
    public String sendMsg(MsgDTO m, FileReqDTO fileReqDTO) {
        
        MultipartFile mf = fileReqDTO.getGaFile();
        
        if (!fileReqDTO.getGaFile().isEmpty()) {
            log.debug(RED + "파일이 있습니다!" + RESET);
            String originalFilename = mf.getOriginalFilename();
            String fileType = mf.getContentType().toLowerCase();
            long fileSize = mf.getSize();
            String prefix = UUID.randomUUID().toString().replace("-", "");
            String suffix = getFileExtension(originalFilename);
            String newFileName = prefix + suffix;
            
            FileVO gaFile = new FileVO();
            gaFile.setOriginalName(originalFilename);
            gaFile.setFileType(fileType);
            gaFile.setFileSize(fileSize);
            gaFile.setFileName(newFileName);
            
            m.setMsgFileName(newFileName);
            
            int row = fileMapper.insertMsgFile(gaFile);
            
            if (row != 1) {
                throw new RuntimeException("데이터베이스 입려을 실패하였습니다.");
            }
            
            return newFileName;
        }


        int success = msgMapper.sendMsg(m);
        log.debug(TeamColor.RED + "Service입력성공여부: " + success + TeamColor.RESET);

        if (success != 1) {
            throw new RuntimeException("데이터베이스 입려을 실패하였습니다.");
        }

        if (m.getSender().equals(m.getReceiver())) {
            Map<String, Object> v = new HashMap<>();
            v.put("empCode", m.getSender());
            v.put("msgNum", m.getMsgNum());
            log.debug(TeamColor.RED + "내게쓰기 읽기처리" + TeamColor.RESET);
            msgMapper.readMsg(v);
        }

        return "empty";
    }

    // 쪽지 삭제,복구 처리
    public int modifyMsgState(Map<String, Object> m) {
        int success = msgMapper.updateMsgStatus(m);
        // int success = 1;
        log.debug(TeamColor.RED + "Service삭제성공여부: " + success + TeamColor.RESET);
        return success;
    }

    // 쪽지 상세
    public MsgDTO msgDetail(String msgNum, String empCode) {
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("msgNum", msgNum);

        if (msgMapper.checkMsgOpen(m) == null) { // 수신&발신자가 아니면 못봄
            return null;
        }
        int readMsg = msgMapper.readMsg(m);

        return msgMapper.msgDetail(m);
    }

    // 쪽지 읽기처리
    public int readMsg(String empCode, String msgNum) {
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("msgNum", msgNum);

        if (msgMapper.checkMsgOpen(m) == null) {
            // return 0;
        }

        return msgMapper.readMsg(m);
    }

    // 안읽은 쪽지수
    public int msgNotReadCnt(String empCode) {
        return msgMapper.msgNotReadCnt(empCode);
    }

    private String getFileExtension(String filename) {
        int lastIndex = filename.lastIndexOf('.');
        if (lastIndex == -1) {
            return "";
        }
        return filename.substring(lastIndex);
    }
}
