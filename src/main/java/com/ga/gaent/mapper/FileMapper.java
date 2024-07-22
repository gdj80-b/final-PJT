package com.ga.gaent.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.FileVO;

@Mapper
public interface FileMapper {

    /* import com.ga.gaent.vo.FileVO를 import해야함 */
    int insertMsgFile(FileVO file);
    
    /* 직원 프로필 이미지 등록 */
    int insertProfile(FileVO file);
    
    /* 직원 프로필 이미지 수정 */
    int updateProfile(FileVO file);
    
    /* 직원 프로필 이미지 삭제 */
    int deleteProfile(String profile);
}
