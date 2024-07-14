package com.ga.gaent.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.EdocMapper;
import com.ga.gaent.vo.EdocFormTypeVO;
import com.ga.gaent.vo.EmpVO;

@Transactional
@Service
public class EdocService {

    @Autowired EdocMapper edocMapper;
    
    public List<EdocFormTypeVO> selectEdocType() {
        return edocMapper.selectEdocType();
    }
    
    public List<EmpVO> selectApprover() {
        return edocMapper.selectApprover();
    }
}
