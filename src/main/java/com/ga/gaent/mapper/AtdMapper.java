package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.vo.AtdVO;

@Mapper
public interface AtdMapper {
    
    // 출최근 확인
    AtdVO checkAtdStatus(String empCode);
    
    // 출근등록
    int atdIn(String empCode);
    // 퇴근등록
    int atdOut(String empCode);
    
    // 출퇴근이력
    List<AtdDTO> selectAtdHistory(String empCode);
}
