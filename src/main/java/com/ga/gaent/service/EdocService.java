package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.EdocRequestDTO;
import com.ga.gaent.mapper.EdocMapper;
import com.ga.gaent.vo.EdocFormTypeVO;
import com.ga.gaent.vo.EmpVO;

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
     * @since : 2024. 07. 15.
     * Description : 전자결재(문서, 기안서, 결재선) 데이터 입력
     */
    public int insertDraft(EdocRequestDTO edocRequestDTO) {
        
        int edocResult = edocMapper.insertEdoc(edocRequestDTO);
        
        Integer edocNum = edocRequestDTO.getEdocNum();
        edocRequestDTO.setEdocNum(edocNum);
        
        String[] approvers = edocRequestDTO.getApprover();
        String[] apprOrders = edocRequestDTO.getApprOrder();
        
        int approvalResult = -1;
        
        for(int i = 0; i < approvers.length; i++) {
            Map<String, Object> edocMap = new HashMap<>();
            edocMap.put("edocNum", edocNum);
            edocMap.put("approver", approvers[i]);
            edocMap.put("apprOrder", apprOrders[i]);
            approvalResult = edocMapper.insertApprover(edocMap);
        }
        
        int draftResult = edocMapper.insertEdocDraft(edocRequestDTO);
        
        if(edocResult != 1 || approvalResult != 1 || draftResult != 1) {
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
        
        return edocMapper.insertEdocFile(insertFile);
    }
}
