package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.vo.AtdVO;

@Mapper
public interface AtdMapper {
    
    // 출최근 확인
    AtdDTO checkAtdStatus(String empCode);
    
    // 출근등록
    int atdIn(String empCode);
    // 퇴근등록
    int atdOut(String empCode);
    
    // 출퇴근이력
    List<AtdDTO> selectAtdHistory(String empCode);
    
    // 일간 근무시간
    Integer dailyWorkMinutes(String empCode);
    // 주간 근무시간
    Integer weeklyWorkMinutes(String empCode);
    // 월간 근무시간
    Integer monthlyWorkMinutes(String empCode);
}
