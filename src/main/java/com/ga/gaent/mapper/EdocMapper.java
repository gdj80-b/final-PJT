package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.vo.EdocFormTypeVO;
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
     * Description : 전자결재 기안서 데이터 입력
     */
    int insertEdocDraft(EdocRequestDTO edocRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 결재선 데이터 입력
     */
    int insertApprover(Map<String, Object> edocMap);
}
