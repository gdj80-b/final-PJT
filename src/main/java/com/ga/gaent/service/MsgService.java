package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.dto.MsgDTO;
import com.ga.gaent.mapper.FileMapper;
import com.ga.gaent.mapper.MsgMapper;
import com.ga.gaent.util.Paging;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.FileVO;
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

    /* @author : 조인환
     * @since : 2024. 07. 12.
     * Description : 모든 쪽지 리스트 호출
     */
    public List<MsgDTO> getMsgList(String empCode, int request, int currentPage, String searchMsg) {

        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        m.put("startRow", (currentPage - 1) * 10); // 10은 rowPerPage
        m.put("searchMsg", searchMsg);

        return msgMapper.selectMsgList(m);
    }

    /* @author : 조인환
     * @since : 2024. 07. 14
     * Description : 쪽지리스트 출력 페이징을 위한 매서드
     */
    public Map<String, Object> getPagingIdx(String empCode, int request, int currentPage, String searchMsg) {

        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        m.put("searchMsg", searchMsg);


        int totalRow = msgMapper.msgCnt(m); // 전체 row수
        log.debug(TeamColor.RED + "result: " + totalRow + TeamColor.RESET);

        Paging v = new Paging();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);


        return pagingMap;
    }

    /* @author : 조인환 / 조인환, 정건희
     * @since : 2024. 07. 13. / 2024. 07. 16.(파일전송추가)
     * @Description : 쪽지보내기
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
            int success = msgMapper.sendMsg(m);
            log.debug(TeamColor.RED + "Service메시지전송여부: " + success + TeamColor.RESET);
            return newFileName;
        }


        int success = msgMapper.sendMsg(m);
        log.debug(TeamColor.RED + "Service메시지전송여부: " + success + TeamColor.RESET);

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
    
    // 파일저장
    private String getFileExtension(String filename) {
        int lastIndex = filename.lastIndexOf('.');
        if (lastIndex == -1) {
            return "";
        }
        return filename.substring(lastIndex);
    }

    /* @author : 조인환
     * @since : 2024. 07. 13.
     * Description : Ajax를 이용해 메시지 상태 변경
     */
    public int modifyMsgState(Map<String, Object> m) {
        int success = msgMapper.updateMsgStatus(m);
        // int success = 1;
        log.debug(TeamColor.RED + "Service삭제성공여부: " + success + TeamColor.RESET);
        return success;
    }

    /* @author : 조인환
     * @since : 2024. 07. 15
     * Description : 메시지 상세보기
     */
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

    /* @author : 조인환
     * @since : 2024. 07. 13.
     * Description : Ajax를 이용해 메시지 읽기 처리
     */
    public int readMsg(String empCode, String msgNum) {
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("msgNum", msgNum);

        if (msgMapper.checkMsgOpen(m) == null) {
            // return 0;
        }

        return msgMapper.readMsg(m);
    }

    /* @author : 조인환
     * @since : 2024. 07. 14.
     * Description : Ajax를 이용해 안읽은 메시지 수 확인
     */
    public int msgNotReadCnt(String empCode) {
        return msgMapper.msgNotReadCnt(empCode);
    }    
    
    /* @author : 조인환
     * @since : 2024. 07. 17.
     * Description : 스케줄러를 이용해 메시지 delete
     */
    @Scheduled(cron = "0 12 * * * *")   //매일 12시간마다
    void eliminateMsg() {
        int deleteMsg = msgMapper.eliminateMsg();
        int deleteMsgFile = msgMapper.eliminateMsgFile();
        log.debug(RED + "스케쥴러 이용 msg테이블 삭제처리 행 수 : " + deleteMsg + "msgFile테이블 삭제처리 행 수 : " + deleteMsgFile + RESET );
       
    }
    
 
    
}
