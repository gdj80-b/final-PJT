package com.ga.gaent.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.EdocFormTypeDTO;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.mapper.EdocProcessMapper;
import com.ga.gaent.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class EdocProcessService {
    @Autowired EdocProcessMapper edocProcessMapper;
    
    
    /*
     * @author : 정건희, 조인환
     * @since : 2024. 07. 15.
     * Description : 전자결재(전자결재 문서, 문서양식, 결재선) 데이터 입력
     */
    public int insertEdoc(
            EdocRequestDTO edocRequestDTO,
            EdocFormTypeDTO edocFormTypeDTO) {
        
        // 공통으로 들어가는 전자결재 문서
        int edocResult = edocProcessMapper.insertEdoc(edocRequestDTO);
        
        Integer edocNum = edocRequestDTO.getEdocNum();
        edocRequestDTO.setEdocNum(edocNum);
        edocFormTypeDTO.setEdocNum(edocNum);
        
        String[] approvers = edocRequestDTO.getApprover();
        String[] apprOrders = edocRequestDTO.getApprOrder();
        
        int approvalResult = -1;
        
        for(int i = 0; i < approvers.length; i++) {
            Map<String, Object> edocMap = new HashMap<>();
            edocMap.put("edocNum", edocNum);
            edocMap.put("approver", approvers[i]);
            edocMap.put("apprOrder", apprOrders[i]);
            // 공통으로 들어가는 결재선
            approvalResult = edocProcessMapper.insertApprover(edocMap);
        }
        
        String edocType = edocFormTypeDTO.getEdocType();
        
        int insertEdocForm = -1;
        if(edocType.equals("0")){
            System.out.println("기안서 제출");
            insertEdocForm = edocProcessMapper.insertEdocDraft(edocFormTypeDTO);
        }else if(edocType.equals("1")){
            System.out.println("휴가신청서 제출");
            insertEdocForm = edocProcessMapper.insertEdocVacation(edocFormTypeDTO);
        }else if(edocType.equals("2")){
            System.out.println("지출결의서 제출");
            insertEdocForm = edocProcessMapper.insertEdocProject(edocFormTypeDTO);
        }else if(edocType.equals("3")){
            System.out.println("경조사지출결의서 제출");
            insertEdocForm = edocProcessMapper.insertEdocEvent(edocFormTypeDTO);
        }else if(edocType.equals("4")){
            System.out.println("보고서 제출");
            insertEdocForm = edocProcessMapper.insertEdocReport(edocFormTypeDTO);
        }
        
        
        if(edocResult != 1 || insertEdocForm != 1) {
            throw new RuntimeException("전자결재 입력을 실패했습니다.");
        }
        
        return 1;
    }
    
    

    
    /*
     * @author : 정건희
     * @since : 2024. 07. 15.
     * Description : 전자결재 첨부파일 데이터 입력
     */
    public int insertEdocFile(EdocRequestDTO edocRequestDTO) {
        
        String originalFileName = edocRequestDTO.getFileName().getOriginalFilename();
        String fileName = (UUID.randomUUID().toString()).replace("-", "");
        String fileType = edocRequestDTO.getFileName().getContentType();
        /* String file = fileName + fileType; */
        double fileSize = edocRequestDTO.getFileName().getSize();
        
        Map<String, Object> insertFile = new HashMap<>();
        
        insertFile.put("originalFileName", originalFileName);
        insertFile.put("fileName", fileName);
        insertFile.put("fileType", fileType);
        insertFile.put("fileSize", fileSize);
        
        return edocProcessMapper.insertEdocFile(insertFile);
    }
    

    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 결재 상태 승인,반려 처리
     */ 
    public int updateEdocProcess(int empCode,String edocNum,String apprReason, int request) {
        
        String requestEnum =  String.valueOf(request);
        Map<String,Object>map = new HashMap<>();
        map.put("empCode", empCode);
        map.put("edocNum", edocNum);
        map.put("apprReason", apprReason);
        map.put("request", requestEnum);
        
        if(request < 0) {
            map.put("apprStatus", "-1" );
        }else if(request > 0){
            map.put("apprStatus", "1" );
        }
        
        // 승인을 처리하려 할 때 작동
        // 결재자가 승인 처리를 하면 첫 번째 if문으로 넘어감
        // 결재자가 반려 처리를 하면 첫 번째 if else로 넘어감
        
        // select로 edoc의 상태를 확인
        String status = edocProcessMapper.checkEdocStatus(edocNum);        
        log.debug(TeamColor.YELLOW + "status : " + status + TeamColor.RESET);
        
        // 이미 누군가가 승인처리를 했으면 그다음 결재자는 최종결재자이므로 donDate를 삽입          
        if(status.equals("1")||status.equals("2") ){ // 두번째 if문
            // 승인으로 업데이트
            int s3 = edocProcessMapper.updateEdocStatusSecond(map);
            log.debug(TeamColor.YELLOW + "두번째 결재" + s3 + TeamColor.RESET);
        }else {
            int s2 = edocProcessMapper.updateEdocStatusFirst(map);
            log.debug(TeamColor.YELLOW + "첫번째 결제" + s2 + TeamColor.RESET);
        }
       
        
        
        int s1 = edocProcessMapper.updateEdocApprovalStatus(map); // 결재선테이블
        log.debug(TeamColor.YELLOW + "결재선" + s1 + TeamColor.RESET);
        
        
        return 1;
    }
    
    
    
}
