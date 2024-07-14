package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.EdocFormTypeVO;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface EdocMapper {

    List<EdocFormTypeVO> selectEdocType();
    List<EmpVO> selectApprover();
}
