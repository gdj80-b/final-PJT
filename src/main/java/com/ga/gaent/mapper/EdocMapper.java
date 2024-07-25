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
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 데이터 입력
     */
    int insertEdoc(EdocRequestDTO edocRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 첨부파일 입력
     */
    int insertEdocFile(Map<String, Object> insertFile);
    
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 결재선 데이터 입력
     */
    int insertApprover(Map<String, Object> edocMap);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 16.
     * Description : 결재 대기 문서 조회
     */
    List<Map<String, String>> selectToDo(Map<String, Object> todoMap);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 16.
     * Description : 전자결재 문서 상세 조회
     */
    Map<String, Object> selectEdocDetail(int edocNum);
    
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 기안서 데이터 입력
     */
    int insertEdocDraft(EdocFormTypeDTO edocFormTypeDTO);
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 17.
     * Description : 전자결재 기안서 데이터 입력
     */
    // 휴가신청서
    int insertEdocVacation(EdocFormTypeDTO edocFormTypeDTO);
    // 지출결의서
    int insertEdocProject(EdocFormTypeDTO edocFormTypeDTO);
    // 경조사 지출 결의서
    int insertEdocEvent(EdocFormTypeDTO edocFormTypeDTO);
    // 차량이용신청서
    int insertEdocCar(EdocFormTypeDTO edocFormTypeDTO);
    // 보고서
    int insertEdocReport(EdocFormTypeDTO edocFormTypeDTO);
    
    // 결재선에서 상태수정 (edoc approval)
    int updateEdocApprovalStatus(Map<String,Object>m);
    // edoc테이블에서의 상태수정
    int updateEdocStatus(Map<String,Object>m);
    
    
    List<EdocVO>selectMyEdocSubmitList(Map<String,Object>m);
}
