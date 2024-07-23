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
    
    // 일정조회
    List<Map<String, Object>> selectEventList();
    
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
