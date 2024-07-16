package com.ga.gaent.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.FileVO;

@Mapper
public interface FileMapper {

    //★ import com.ga.gaent.vo.FileVO; 를 import해야함 ★
    int insertMsgFile(FileVO file);
    
}
