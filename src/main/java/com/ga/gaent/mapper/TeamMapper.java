package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.TeamVO;

@Mapper
public interface TeamMapper {
    
    // 조직도 정보
    public List<Map<String, Object>> selectTreeInfo();
    
    // 팀 등록
    public int insertTeam(TeamVO team);
}
