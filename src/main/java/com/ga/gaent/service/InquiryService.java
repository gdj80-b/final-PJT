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
    public List<EmpVO> selectEmpList(int currentPage, int rowPerPage, String searchEmp){
        
        int startRow = (currentPage - 1) * rowPerPage;
        
        Map<String, Object> map = new HashMap<>();
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);
        map.put("searchEmp", searchEmp);
        log.debug(yellow + "empListMap : " + map + yellow);
        
        List<EmpVO> empList = inquiryMapper.selectEmpList(map);
        log.debug(yellow + "empList : " + empList + yellow);
        
        return empList;
    }
    
    // 직원 리스트 카운트
    public int selectEmpCount(String searchEmp) {
        
        int empCount = inquiryMapper.selectEmpCount(searchEmp);
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
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 부서 상세 조회
     */
    public List<Map<String, Object>> selectDeptDetail(String teamCode){
        
        List<Map<String, Object>> deptDetail = inquiryMapper.selectDeptDetail(teamCode);
        log.debug(yellow + "deptDetail : " + deptDetail + yellow);
        
        return deptDetail;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 부서 총원 조회
     */
    public int selectDeptTotal(String teamCode) {
        
        int deptTotal = inquiryMapper.selectDeptTotal(teamCode);
        log.debug(yellow + "deptTotal : " + deptTotal + yellow);
        
        return deptTotal;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 관련부서 조회
     */
    public List<Map<String, Object>> selectDeptTeam(String teamCode){
        
        List<Map<String, Object>> deptTeam = inquiryMapper.selectDeptTeam(teamCode);
        log.debug(yellow + "deptTeam : " + deptTeam + yellow);
        
        return deptTeam;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 상세 조회
     */
    public List<Map<String, Object>> selectTeamDetail(String teamCode){
        
        List<Map<String, Object>> teamDetail = inquiryMapper.selectTeamDetail(teamCode);
        log.debug(yellow + "teamDetail : " + teamDetail + yellow);
        
        return teamDetail;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 멤버 정보 조회
     */
    public List<Map<String, Object>> selectMemberDetail(String teamCode, int currentPage, int rowPerPage){
        
        int startRow = (currentPage - 1) * rowPerPage;
        
        Map<String, Object> map = new HashMap<>();
        map.put("teamCode", teamCode);
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);
        
        List<Map<String, Object>> memberDetail = inquiryMapper.selectMemberDetail(map);
        log.debug(yellow + "memberDetail : " + memberDetail + yellow);
        log.debug(yellow + "map : " + map + yellow);
        
        return memberDetail;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 멤버 총 인원 조회
     */
    public int selectMemberCount(String teamCode) {
        
        int memberCount = inquiryMapper.selectMemberCount(teamCode);
        log.debug(yellow + "memberCount : " + memberCount + yellow);
        
        return memberCount;
    }
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 정보 모달 조회
     */
    public List<Map<String, Object>> selectTeamModal(String teamCode){
        
        List<Map<String, Object>> teamModal = inquiryMapper.selectTeamModal(teamCode);
        log.debug(yellow + "teamModal : " + teamModal + yellow);
        
        return teamModal;
    }
}