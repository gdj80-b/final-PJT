package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ga.gaent.vo.CalendarVO;

@Mapper
public interface CalendarMapper {
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정등록
     */
    int insertEvent(CalendarVO calendar);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 전체 일정조회
     */
    List<Map<String, Object>> selectAllEvents(Map<String, Object> map);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정상세
     */
    List<String> selectEventOne(int calNum);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 14.
     * Description : 일정삭제
     */
    int deleteEvent(int calNum);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 15.
     * Description : 일정수정
     */
    int updateEvent(CalendarVO calendar);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 23.
     * Description : 일정타입 조회
     */
    List<Map<String, Object>> selectEventType();
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 23.
     * Description : 일정분류 조회
     */
    List<Map<String, Object>> selectEventTarget();
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 26.
     * Description : 개인 일정조회
     */
    List<Map<String, Object>> selectPersonalEvents(String empCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 26.
     * Description : 팀 일정조회
     */
    List<Map<String, Object>> selectTeamEvents(String teamCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 26.
     * Description : 전사 일정조회
     */
    List<Map<String, Object>> selectCompanyEvents();
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 26.
     * Description : 아티스트 일정조회
     */
    List<Map<String, Object>> selectArtistEvents();
}
