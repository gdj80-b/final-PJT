package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface InquiryMapper {

    // 직원 리스트 정보 조회
    List<EmpVO> selectEmpList(Map<String, Integer> map);
    
    // 직원 리스트 카운트
    public int selectEmpCount();
}
