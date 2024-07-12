package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.MsgVO;

@Mapper
public interface MsgMapper {
  
  // 받은 쪽지수 
  int msgReceive(String id);
    
  // 쪽지리스트
  List<MsgVO> selectMsgList(Map<String,Object>m);
  
  // 쪽지쓰기
  int sendMsg(MsgVO m);
  
  // 쪽지 영구 삭제
  int eliminateMsg();
  
  // 쪽지상태변경-삭제및복구
  int updateMsgStatus(Map<String,Object>m);
  
  // 쪽지상세 
  MsgVO readMsg(Map<String,Object>m);
}
