package com.ga.gaent.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface LoginMapper {

    EmpVO selectLoginCheck(Map<String, String> loginInfo);
}
