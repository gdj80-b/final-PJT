package com.ga.gaent.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface HomeMapper {

    public EmpVO selectMyPageInfo(String empCode);
}
