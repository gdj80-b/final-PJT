package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.MsgDTO;

@Mapper
public interface MsgMapper {
  
  // 쪽지수 
  int msgCnt(Map<String,Object>m);
    
  // 쪽지리스트
  List<MsgDTO> selectMsgList(Map<String,Object>m);
  
  // 쪽지쓰기
  int sendMsg(MsgDTO m);
  
 
  
  // 쪽지상태변경-삭제및복구
  int updateMsgStatus(Map<String,Object>m);
  
  // 쪽지상세 
  MsgDTO msgDetail(Map<String,Object>m);
  
  // 쪽지읽기
  int readMsg(Map<String,Object>m);
  
  // 쪽지 열람 권한 조회
  String checkMsgOpen(Map<String,Object>m);
  
  // 안읽은 쪽지수
  int msgNotReadCnt(String empCode);
  
  // 쪽지 영구 삭제
  int eliminateMsg();
  // 쪽지테이블에서삭제
  int eliminateMsgFile();
}
