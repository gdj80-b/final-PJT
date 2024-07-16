package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamMapper {
    
    // 조직도 정보
    public List<Map<String, Object>> selectTreeInfo();
}
