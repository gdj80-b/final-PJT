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
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 전자결재 문서 공통 사항 상세 조회
     */
    Map<String, Object> selectEdocDetail(Map<String, Object> m);

    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 기안서 상세 조회
     */
    Map<String,Object> selectDraftDetail(int edocNum);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 휴가신청서 상세 조회
     */
    Map<String,Object> selectVactionDetail(int edocNum);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 프로젝트 지출 경비서 상세 조회
     */
    Map<String,Object> selectProjectDetail(int edocNum);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 경조사 지출 결의서 상세 조회
     */
    Map<String,Object> selectEventDetail(int edocNum);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 보고서 상세 조회
     */
    Map<String,Object> selectReportDetail(int edocNum);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 본인이 작성한 전자문서 (대기,승인,반려)이력 조회
     */
    List<EdocVO> selectMyEdocSubmitList(Map<String,Object> map);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 본인이 작성한 전자문서 (대기,승인,반려)이력 조회
     */
    int edocSubmitListCnt(Map<String,Object> map);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : empCode에 해당하는 한글 이름 조회
     */
    String findKorName(String empCode);
}
