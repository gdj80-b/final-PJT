package com.ga.gaent.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.TeamMapper;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class TeamService {
    
    private final String yellow = "\u001B[33m";

    @Autowired
    TeamMapper teamMapper;
    
public List<Map<String, Object>> selectTreeInfo(){
        
        List<Map<String, Object>> list = teamMapper.selectTreeInfo();
        log.debug(yellow + "list : " + list + yellow);
        
        return list;
    }
}
