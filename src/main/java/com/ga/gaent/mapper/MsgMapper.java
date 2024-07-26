package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.MsgDTO;

@Mapper
public interface MsgMapper {
  
  // 쪽지수 
  int msgCnt(Map<String,Object>m);
    
  /*
   * @author : 조인환
   * @since : 2024. 07. 12.
   * Description : 모든 쪽지 리스트 호출
   */
  List<MsgDTO> selectMsgList(Map<String,Object>m);
  
  /*
   * @author : 조인환
   * @since : 2024. 07. 13.
   * Description : 쪽지 전송
   */
  int sendMsg(MsgDTO m); 
  
  /*
   * @author : 조인환
   * @since : 2024. 07. 13.
   * Description : 쪽지 상태 변경(삭제 및 복구)
   */
  int updateMsgStatus(Map<String,Object>m);
  
  /*
   * @author : 조인환
   * @since : 2024. 07. 15
   * Description : 쪽지 상세보기
   */
  MsgDTO msgDetail(Map<String,Object>m);
  
  /*
   * @author : 조인환
   * @since : 2024. 07. 13.
   * Description : 메시지 읽기 처리
   */
  int readMsg(Map<String,Object>m);
  
  /*
   * @author : 조인환
   * @since : 2024. 07. 15.
   * Description : 메시지 열럼 권한 조회
   */
  String checkMsgOpen(Map<String,Object>m);
  
  /*
   * @author : 조인환
   * @since : 2024. 07. 14.
   * Description : 안읽은 메시지 수 확인
   */
  int msgNotReadCnt(String empCode);
  
  /* 
   * @author : 조인환
   * @since : 2024. 07. 17.
   * Description : 스케줄러를 이용해 메시지 삭제
   */
  int eliminateMsg();
  
  /* 
   * @author : 조인환
   * @since : 2024. 07. 17.
   * Description : 스케줄러를 이용해 메시지 파일 삭제
   */
  int eliminateMsgFile();
  
  /* 
   * @author : 조인환
   * @since : 2024. 07. 26.
   * Description : 쪽지 보낼때 사원 검색
   */
  List<Map<String,Object>>searchEmpCode(String empName);
}
