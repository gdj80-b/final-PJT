package com.ga.gaent.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.HRMapper;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.TeamVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class HRService {

    private final String yellow = "\u001B[33m";

    @Autowired private HRMapper hrMapper;

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 조직도 정보 조회
     */
    public List<Map<String, Object>> selectTreeInfo() {

        List<Map<String, Object>> list = hrMapper.selectTreeInfo();
        // log.debug(yellow + "list : " + list + yellow);

        return list;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 19.
     * Description : 직원 리스트 조회
     */
    public List<Map<String, Object>> selectEmpList(String empCode, int currentPage, int rowPerPage) {

        int startRow = (currentPage - 1) * rowPerPage;

        Map<String, Object> map = new HashMap<>();
        map.put("empCode", empCode);
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);

        List<Map<String, Object>> empList = hrMapper.selectEmpList(map);
        // log.debug(TeamColor.PURPLE_BG + "empList: " + empList + TeamColor.RESET);

        return empList;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 19.
     * Description : 직원 리스트 조회
     */
    public EmpVO selectEmpDetail(String empCode) {

        EmpVO empDetail = hrMapper.selectEmpDetail(empCode);
        // log.debug(TeamColor.PURPLE_BG + "empDetail: " + empDetail + TeamColor.RESET);
        
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
        // log.debug(TeamColor.PURPLE_BG + "age: " + age + TeamColor.RESET);
        // log.debug(TeamColor.PURPLE_BG + "birth: " + birth + TeamColor.RESET);
        
        empDetail.setAge(age);
        empDetail.setBirth(birth);
        
        return empDetail;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 20.
     * Description : 직원 정보 수정
     */
    public int updateEmp(String empCode, EmpVO empVO) {
        int result = hrMapper.updateEmp(empCode, empVO);
        return result;
    }

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 등록
     */
    public int insertTeam(TeamVO team) {

        int insertTeam = hrMapper.insertTeam(team);

        if (insertTeam == 1) {
            log.debug(yellow + "부서 등록 성공" + yellow);
        } else {
            log.debug(yellow + "부서 등록 실패" + yellow);
        }

        return insertTeam;
    }

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 수정
     */
    public int updateTeam(TeamVO team) {

        int updateTeam = hrMapper.updateTeam(team);

        if (updateTeam == 1) {
            log.debug(yellow + "부서 수정 성공" + yellow);
        } else {
            log.debug(yellow + "부서 수정 실패" + yellow);
        }

        return updateTeam;
    }

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 삭제
     */
    public int deleteTeam(int teamCode) {

        int deleteTeam = hrMapper.deleteTeam(teamCode);

        if (deleteTeam == 1) {
            log.debug(yellow + "부서 삭제 성공" + yellow);
        } else {
            log.debug(yellow + "부서 삭제 실패" + yellow);
        }

        return deleteTeam;
    }

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 리스트 조회
     */
    public List<TeamVO> selectTeamList(int currentPage, int rowPerPage) {

        int startRow = (currentPage - 1) * rowPerPage;

        Map<String, Integer> map = new HashMap<>();
        map.put("startRow", startRow);
        map.put("rowPerPage", rowPerPage);

        List<TeamVO> teamList = hrMapper.selectTeamList(map);
        log.debug(yellow + "teamList : " + teamList + yellow);

        return teamList;
    }

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 리스트 카운트
     */
    public int selectTeamCount() {

        int teamCount = hrMapper.selectTeamCount();
        log.debug(yellow + "teamCount : " + teamCount + yellow);

        return teamCount;
    }

    /*
     * @author : 김형호
     * @since : 2024. 07. 00.
     * Description : 부서 등록 부서코드 유효성 검사
     */
    public int checkTeamCode(String teamCode) {

        int result = 0;

        int checkTeamCode = hrMapper.checkTeamCode(teamCode);
        log.debug(yellow + "checkTeamCode : " + checkTeamCode + yellow);

        if (checkTeamCode > 0) {
            result = 1;
        }

        log.debug(yellow + "result : " + result + yellow);

        return result;
    }
}
