package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.TeamVO;

@Mapper
public interface TeamMapper {
    
    // 조직도 정보
    public List<Map<String, Object>> selectTreeInfo();
    
    // 부서 등록
    public int insertTeam(TeamVO team);
    
    // 부서 삭제
    public int deleteTeam(int teamCode);
    
    // 부서 리스트 조회
    public List<TeamVO> selectTeamList(Map<String, Integer> map);
    
    // 부서 리스트 카운트
    public int selectTeamCount();
}
