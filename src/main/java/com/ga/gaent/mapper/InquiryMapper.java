package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.TeamVO;

@Mapper
public interface InquiryMapper {

    // 직원 리스트 정보 조회
    List<EmpVO> selectEmpList(Map<String, Integer> map);
    
    // 직원 리스트 카운트
    int selectEmpCount();
    
    // 그룹 리스트 정보 조회
    List<TeamVO> selectTeamList(Map<String, Integer> map);
    
    // 그룹 리스트 카운트
    int selectTeamCount();
    
    // 피라미드 조직도 정보 조회
    public List<Map<String, Object>> selectGroupInfo();
}
