package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
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
}
