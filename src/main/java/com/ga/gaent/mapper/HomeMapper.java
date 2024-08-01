package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.MsgDTO;
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
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 30.
     * Description : 홈(메인) 공지사항 조회
     */
    List<Map<String, Object>> selectNoticeListAtHome(Map<String, Object> map);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 30.
     * Description : 홈(메인) 쪽지함 조회
     */
    List<MsgDTO> selectMessageListAtHome(Map<String, Object> map);
}
