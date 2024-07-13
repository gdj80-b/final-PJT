package com.ga.gaent.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.LoginRequestDTO;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface LoginMapper {

    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 로그인
     */
    EmpVO selectLoginCheck(LoginRequestDTO loginRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 아이디 찾기
     */
    EmpVO selectEmpId(LoginRequestDTO loginRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 비밀번호 찾기
     */
    EmpVO selectEmpPw(LoginRequestDTO loginRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 12.
     * Description : 비밀번호 재설정
     */
    int updateEmpPw(LoginRequestDTO loginRequestDTO);
}
