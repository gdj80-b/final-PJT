package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.VacationDTO;

@Mapper
public interface VacationMapper {
    
    // 내 휴가상태
    public Map<String,Object>selectMyVacStatus(String empCode);
    
    // 휴가내역
    List<VacationDTO>selectMyVacList(Map<String, Object>m);
    
    // 휴가내역 페이징
    int myVacCnt(Map<String,Object>m);
}
