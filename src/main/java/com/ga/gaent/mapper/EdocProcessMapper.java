package com.ga.gaent.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.EdocFormTypeDTO;
import com.ga.gaent.dto.EdocRequestDTO;

@Mapper
public interface EdocProcessMapper {

    
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
     * @since : 2024. 07. 15.
     * Description : 기안서 데이터 입력
     */
    int insertEdocDraft(EdocFormTypeDTO edocFormTypeDTO);
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 21.
     * Description : 휴가 신청서 데이터 입력
     */
    int insertEdocVacation(EdocFormTypeDTO edocFormTypeDTO);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 21.
     * Description :지출결의서 데이터 입력
     */ 
    int insertEdocProject(EdocFormTypeDTO edocFormTypeDTO);
    
    /*
    * @author : 조인환
    * @since : 2024. 07. 21.
    * Description : 경조사 지출 결의서 데이터 입력
    */ 
    int insertEdocEvent(EdocFormTypeDTO edocFormTypeDTO);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 21.
     * Description : 보고서 데이터 입력
     */ 
    int insertEdocReport(EdocFormTypeDTO edocFormTypeDTO);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 결재선 테이블 상태수정 (edoc approval)
     */
    int updateEdocApprovalStatus(Map<String,Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 첫번째 결재자 edoc테이블 결재 상태 수정
     */ 
    int updateEdocStatusFirst(Map<String,Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 전자결재문서 결재 여부 확인
     */ 
    String checkEdocStatus(String edocNum);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 최종 결재자 edoc테이블 결재 상태 수정
     */ 
    int updateEdocStatusSecond(Map<String,Object>m);
    
}
