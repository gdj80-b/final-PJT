package com.ga.gaent.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import com.ga.gaent.mapper.InquiryMapper;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.TeamVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class InquiryService {
    
    private final String yellow = "\u001B[33m";
    
    @Autowired
    InquiryMapper inquiryMapper;
    
    // 직원 리스트 정보 조회
    public List<EmpVO> selectEmpList(int currentPage, int rowPerPage){
        
        int startRow = (currentPage - 1) * rowPerPage;
        
        Map<String, Integer> map = new HashMap<>();
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);
        
        List<EmpVO> empList = inquiryMapper.selectEmpList(map);
        log.debug(yellow + "empList : " + empList + yellow);
        
        return empList;
    }
    
    // 직원 리스트 카운트
    public int selectEmpCount() {
        
        int empCount = inquiryMapper.selectEmpCount();
        log.debug(yellow + "empCount : " + empCount + yellow);
        
        return empCount;
    }
    
    // 그룹 리스트 정보 조회
    public List<TeamVO> selectTeamList(int currentPage, int rowPerPage){
       
        int startRow = (currentPage - 1) * rowPerPage;
        
        Map<String, Integer> map = new HashMap<>();
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);
        
        List<TeamVO> teamList = inquiryMapper.selectTeamList(map);
        log.debug(yellow + "teamList : " + teamList + yellow);
        
        return teamList;
    }
    
    // 그룹 리스트 카운트
    public int selectTeamCount() {
        
        int teamCount = inquiryMapper.selectTeamCount();
        log.debug(yellow + "teamCount : " + teamCount + yellow);
        
        return teamCount;
    }
    
    // 피라미드 조직도 정보 조회
    public List<Map<String, Object>> selectGroupInfo(){
        
        List<Map<String, Object>> groupInfo = inquiryMapper.selectGroupInfo();
        log.debug(yellow + "groupInfo : " + groupInfo + yellow);
        
        return groupInfo;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 27.
     * Description : 직원 상세 조회
     */
    public EmpVO selectEmpDetail(String empCode, Model model) {

        EmpVO empDetail = inquiryMapper.selectEmpDetail(empCode);
        log.debug(yellow + "empDetail: " + empDetail + yellow);
        
        String regNo = empDetail.getRegNo();
        Calendar cal = Calendar.getInstance();
        
        int year = cal.get(Calendar.YEAR);
        int age = 0;
        String birth = "";
        String birthYear = "";
        
        if((regNo.substring(6, 7)).equals("1") || (regNo.substring(6, 7)).equals("2")) {
            birthYear = "19" + regNo.substring(0, 2);
        } else {
            birthYear = "20" + regNo.substring(0, 2);
        }
        
        birth = regNo.substring(0, 6);
        
        age = year - Integer.parseInt(birthYear);
        
        log.debug(yellow + "age: " + age + yellow);
        log.debug(yellow + "birth: " + birth + yellow);
        
        /* 나이와 생년월일 계산 */
        empDetail.setAge(age);
        empDetail.setBirth(birth);
        
        String engName = empDetail.getEngName();
        int idx = engName.indexOf(".");
        
        String lastEngName = engName.substring(0, idx);
        String firstEngName = engName.substring(idx + 1, engName.length());
        
        empDetail.setEngName(lastEngName + " " + firstEngName);
        
        log.debug(yellow + "lastEngName: " + lastEngName + yellow);
        log.debug(yellow + "firstEngName: " + firstEngName + yellow);
        
        String firstRegNo = (empDetail.getRegNo()).substring(0, 6);
        String lastRegNo = (empDetail.getRegNo()).substring(6, 13);
        
        log.debug(yellow + "firstRegNo: " + firstRegNo + yellow);
        log.debug(yellow + "lastRegNo: " + lastRegNo + yellow);
        
        /* 영어이름, 주민등록번호 */
        model.addAttribute("lastEngName", lastEngName);
        model.addAttribute("firstEngName", firstEngName);
        
        model.addAttribute("firstRegNo", firstRegNo);
        model.addAttribute("lastRegNo", lastRegNo);
        
        return empDetail;
    }
}