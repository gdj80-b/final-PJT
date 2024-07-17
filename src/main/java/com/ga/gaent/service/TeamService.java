package com.ga.gaent.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.TeamMapper;
import com.ga.gaent.vo.TeamVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class TeamService {
    
    private final String yellow = "\u001B[33m";

    @Autowired
    TeamMapper teamMapper;
    
    // 조직도 정보 조회
    public List<Map<String, Object>> selectTreeInfo(){
            
            List<Map<String, Object>> list = teamMapper.selectTreeInfo();
            log.debug(yellow + "list : " + list + yellow);
            
            return list;
        }
    
    // 부서 등록
    public int insertTeam(TeamVO team) {
        
        int insertTeam = teamMapper.insertTeam(team);
        if(insertTeam == 1) {
            log.debug("팀 등록 성공");
        }else {
            log.debug("팀 등록 실패");
        }
        return insertTeam;
    }
    
    // 부서 삭제
    public int deleteTeam(int teamCode) {
        
        int deleteTeam = teamMapper.deleteTeam(teamCode);
        if(deleteTeam == 1) {
            log.debug("부서 삭제 성공");
        }else {
            log.debug("부서 삭제 실패");
        }
        return deleteTeam;
    }
}
