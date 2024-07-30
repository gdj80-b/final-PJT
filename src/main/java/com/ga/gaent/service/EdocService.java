package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.EdocFormTypeDTO;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.mapper.EdocMapper;
import com.ga.gaent.util.Paging;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EdocFormTypeVO;
import com.ga.gaent.vo.EdocVO;
import com.ga.gaent.vo.EmpVO;
import ch.qos.logback.core.pattern.color.MagentaCompositeConverter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class EdocService {

    @Autowired EdocMapper edocMapper;
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 14.
     * Description : 전자결재 양식 호출
     */
    public List<EdocFormTypeVO> selectEdocType() {
        return edocMapper.selectEdocType();
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 결재선 리스트 호출
     */
    public List<EmpVO> selectApprover() {
        return edocMapper.selectApprover();
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 17.
     * Description : 결재대기문서 리스트 호출(전자결재 홈)
     */
    public List<Map<String, String>> selectToDo(String empCode) {
        
        Map<String, Object> toDoMap = new HashMap<>();
        
        toDoMap.put("empCode", empCode);
        toDoMap.put("request", 0);
        
        return edocMapper.selectApprList(toDoMap);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 16.
     * Description : 결재대기문서 리스트 호출
     */
    public List<Map<String, String>> selectToDo(int currentPage, int rowPerPage, String empCode) {
        
        Map<String, Object> map = new HashMap<>();
        
        map.put("empCode", empCode);
        map.put("startRow", (currentPage - 1) * rowPerPage);
        map.put("request", 0);
        
        return edocMapper.selectApprList(map);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 23.
     * Description : 결재진행문서 리스트 호출
     */
    public List<Map<String, String>> selectUpComing(int currentPage, int rowPerPage, String empCode) {
        
        Map<String, Object> map = new HashMap<>();
        
        map.put("empCode", empCode);
        map.put("startRow", (currentPage - 1) * rowPerPage);
        map.put("request", 1);
        
        return edocMapper.selectApprList(map);
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 23.
     * Description : 결재 내역 문서 리스트 호출
     */
    public List<Map<String, String>> selectApprHistory(int currentPage, int rowPerPage, String empCode) {
        
        Map<String, Object> map = new HashMap<>();
        
        map.put("empCode", empCode);
        map.put("startRow", (currentPage - 1) * rowPerPage);
        map.put("request", 2);
        
        return edocMapper.selectApprList(map);
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 23.
     * Description : 결재문서 리스트 페이징
     */
    public Map<String, Object> getApprPagingIdx(String empCode, int currentPage, int request){
        
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        
        int totalRow = edocMapper.apprListCnt(m);
        
        Paging v = new Paging();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);

        return pagingMap;
    }
    

    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 본인이 작성한 전자문서 (대기,승인,반려)이력 조회
     */ 
    public List<EdocVO>selectMyEdocSubmitList(String empCode, int request){
        Map<String,Object>map = new HashMap<>();
        map.put("empCode", empCode);
        map.put("request", request);
        
        
        List<EdocVO>list = edocMapper.selectMyEdocSubmitList(map);
        
        return list;
    };
    
    public Map<String, Object> getPersonalEdocPagingIdx(String empCode, int currentPage, int request){
        
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        m.put("request", request);
        
        int totalRow = edocMapper.edocSubmitListCnt(m);
        
        Paging v = new Paging();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);

        return pagingMap;
    }
    
    
    
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 전자결재 문서(공통부분) 상세보기
     */
    public Map<String, Object> selectEdocDetail(int edocNum,String empCode) {
        Map<String,Object>map = new HashMap<>();
        map.put("empCode", empCode);
        map.put("edocNum", edocNum);
        
        Map<String,Object>resultMap = edocMapper.selectEdocDetail(map);

        if(resultMap != null) {
        resultMap.put("approverName1",  edocMapper.findKorName((String)resultMap.get("approver1")));
        resultMap.put("approverName2",  edocMapper.findKorName((String)resultMap.get("approver2")));
        }
        
        
        return resultMap;
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 24.
     * Description : 각 전자문서 종류별 세부사항 조회
     */
    public Map<String,Object>selectDraftDetail(int edocNum){
        
        return edocMapper.selectDraftDetail(edocNum);
    }
    public Map<String,Object>selectVactionDetail(int edocNum){
            
        return edocMapper.selectVactionDetail(edocNum);
    }
    public Map<String, Object> selectProjectDetail(int edocNum) {

        return edocMapper.selectProjectDetail(edocNum);
    }
    public Map<String, Object> selectEventDetail(int edocNum) {

        return edocMapper.selectEventDetail(edocNum);
    }
    public Map<String, Object> selectReportDetail(int edocNum) {

        return edocMapper.selectReportDetail(edocNum);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 28.
     * Description : 결재대기문서 갯수 확인
     */ 
    public int waitEdocCnt(String empCode, int request) {
        
        Map<String, Object> paramMap = new HashMap<>();
        
        paramMap.put("empCode", empCode);
        paramMap.put("request", request);
        
        return edocMapper.waitEdocCnt(paramMap);
    }
}
