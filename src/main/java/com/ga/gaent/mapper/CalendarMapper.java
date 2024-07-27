package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ga.gaent.vo.CalendarVO;

@Mapper
public interface CalendarMapper {

    // 일정등록
    int insertEvent(CalendarVO calendar);
    
    // 전체 일정조회
    List<Map<String, Object>> selectAllEvents(Map<String, Object> map);
    
    // 개인 일정조회
    List<Map<String, Object>> selectPersonalEvents(String empCode);
    
    // 팀 일정조회
    List<Map<String, Object>> selectTeamEvents(String teamCode);
    
    // 전사 일정조회
    List<Map<String, Object>> selectCompanyEvents();
    
    // 아티스트 일정조회
    List<Map<String, Object>> selectArtistEvents();
    
    // 일정상세
    List<String> selectEventOne(int calNum);
    
    // 일정삭제
    int deleteEvent(int calNum);
    
    // 일정수정
    int updateEvent(CalendarVO calendar);
    
    // 일정타입 조회
    List<Map<String, Object>> selectEventType();
    
    // 일정분류 조회
    List<Map<String, Object>> selectEventTarget();
}
