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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MsgService {
    @Autowired MsgMapper msgMapper;
    
    // 쪽지리스트
    public List<MsgVO> getMsgList(String empCode, int request){     
        
        Map<String,Object>m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        
        return msgMapper.selectMsgList(m);
    }
    
    public int sendMsg(MsgVO m) {
        
        int success = msgMapper.sendMsg(m);
        log.debug(TeamColor.RED + "입력성공여부: " + success + TeamColor.RESET );
        return success;
    }
}
