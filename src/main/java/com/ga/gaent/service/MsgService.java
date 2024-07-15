package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.MsgMapper;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.MsgVO;
import com.ga.gaent.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MsgService {
    @Autowired MsgMapper msgMapper;
    
    // 쪽지리스트
    public List<MsgVO> getMsgList(String empCode, int request, int currentPage, String searchMsg ){     
        
        Map<String,Object>m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        m.put("startRow", (currentPage-1)*10); // 10은 rowPerPage
        m.put("searchMsg", searchMsg);
        
        return msgMapper.selectMsgList(m);
    }
    
    // 페이징을 위한 쪽지 수 
    public Map<String,Object> getPagingIdx( String empCode, int request, int currentPage, String searchMsg){
        
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        m.put("searchMsg", searchMsg);
        
        
        int totalRow = msgMapper.msgCnt(m);  // 전체 row수
        log.debug(TeamColor.RED + "result: " + totalRow + TeamColor.RESET );
        
        PagingVO v = new PagingVO();
        Map<String,Object> pagingMap = v.Paging(currentPage ,totalRow );
        
        
        return pagingMap;
    }
    
        
    // 쪽지 보내기
    public int sendMsg(MsgVO m) {
        
        int success = msgMapper.sendMsg(m);
        log.debug(TeamColor.RED + "Service입력성공여부: " + success + TeamColor.RESET );
        
        if(m.getSender().equals(m.getReceiver())) {
            Map<String,Object>v = new HashMap<>();
            v.put("empCode", m.getSender() );
            v.put("msgNum",m.getMsgNum());
            log.debug(TeamColor.RED + "내게쓰기 읽기처리" + TeamColor.RESET );
            msgMapper.readMsg(v);
        }
        return success;
    }
    
    // 쪽지 삭제,복구 처리
    public int modifyMsgState(Map<String,Object>m) {
        int success = msgMapper.updateMsgStatus(m);
        // int success = 1;
        log.debug(TeamColor.RED + "Service삭제성공여부: " + success + TeamColor.RESET );
        return success;
    }
    
    // 쪽지 상세
    public MsgVO msgDetail(String msgNum, String empCode) {
        Map<String,Object>m = new HashMap<>();
        m.put("empCode",empCode);
        m.put("msgNum",msgNum);
        
        if(msgMapper.checkMsgOpen(m) == null) { // 수신&발신자가 아니면 못봄
            return null;
        }        
        int readMsg = msgMapper.readMsg(m);
        
        return msgMapper.msgDetail(m);
    }
    
    // 쪽지 읽기처리
    public int readMsg(String empCode, String msgNum) {
        Map<String,Object>m = new HashMap<>();
        m.put("empCode",empCode);
        m.put("msgNum",msgNum);
        
        if(msgMapper.checkMsgOpen(m) == null) {
            // return 0;
        }
        
        return msgMapper.readMsg(m);
    }
    
    // 안읽은 쪽지수
    public int msgNotReadCnt(String empCode) {
        return msgMapper.msgNotReadCnt(empCode);
    }
}
