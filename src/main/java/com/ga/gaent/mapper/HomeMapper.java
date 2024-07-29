package com.ga.gaent.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.MyPageRequestDTO;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface HomeMapper {

    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 마이페이지 내 정보 조회
     */
    public EmpVO selectMyPageInfo(String empCode);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 마이페이지 내 정보 수정
     */
    public int updateMyPageInfo(MyPageRequestDTO myPageRequestDTO);
}
