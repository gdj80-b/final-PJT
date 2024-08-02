package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamAtdMapper {
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 팀 출근 이력 리스트 조회
     */
    List<Map<String, Object>>selectTeamAtdStatus(Map<String,Object>m); 
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 30. 
     * Description : 주간별 팀 출근 현황 횟수 조회
     */
    Map<String, Object>selectTeamAtdStatusCount(Map<String, Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 31. 
     * Description : 주간별 팀 개인 출근 현황 횟수 조회
     */
    List<Map<String, Object>>selectPersonalAtdStatus(Map<String,Object>m); 
}
