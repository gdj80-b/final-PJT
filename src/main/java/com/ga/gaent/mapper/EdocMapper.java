package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.EdocFormTypeDTO;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.vo.EdocFormTypeVO;
import com.ga.gaent.vo.EdocVO;
import com.ga.gaent.vo.EmpVO;

@Mapper
public interface EdocMapper {

    
    /*
     * @author : 정건희
     * @since : 2024. 07. 16.
     * Description : 결재 대기 문서 조회
     */
    List<Map<String, String>> selectApprList(Map<String, Object> map);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 23.
     * Description : 결재 문서 페이징
     */
    int apprListCnt(Map<String, Object>m);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 양식 호출
     */
    List<EdocFormTypeVO> selectEdocType();
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 결재선 리스트 호출
     */
    List<EmpVO> selectApprover();
    
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 전자결재 문서 상세 조회
     */
    Map<String, Object> selectEdocDetail(Map<String, Object> m);
        
    
    // 기안서 디테일
    Map<String,Object>selectDraftDetail(int edocNum);
    // 휴가 디테일
    Map<String,Object>selectVactionDetail(int edocNum);
    // 지출결의서 디테일
    Map<String,Object>selectProjectDetail(int edocNum);
    // 경조사 디테일
    Map<String,Object>selectEventDetail(int edocNum);
    // 보고서 디테일
    Map<String,Object>selectReportDetail(int edocNum);
      
    
    
    // 본인이 작성한 문서
    List<EdocVO>selectMyEdocSubmitList(Map<String,Object>m);
    
    String findKorName(String empCode);
}
