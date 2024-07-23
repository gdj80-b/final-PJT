package com.ga.gaent.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import com.ga.gaent.dto.EmpRequestDTO;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.mapper.FileMapper;
import com.ga.gaent.mapper.HRMapper;
import com.ga.gaent.util.FileExtension;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.FileVO;
import com.ga.gaent.vo.TeamVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class HRService {

    private final String yellow = "\u001B[33m";

    @Autowired private HRMapper hrMapper;
    
    @Autowired private FileMapper fileMapper;
    
    @Autowired private FileExtension fileExtension;

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
     * @since : 2024. 07. 22.
     * Description : 직원 상세 조회
     */
    public EmpVO selectEmpDetail(String empCode, Model model) {

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
        
        /* 나이와 생년월일 계산 */
        empDetail.setAge(age);
        empDetail.setBirth(birth);
        
        String engName = empDetail.getEngName();
        int idx = engName.indexOf(".");
        
        String lastEngName = engName.substring(0, idx);
        String firstEngName = engName.substring(idx + 1, engName.length());
        
        empDetail.setEngName(lastEngName + " " + firstEngName);
        
        // log.debug(TeamColor.PURPLE_BG + "lastEngName: " + lastEngName + TeamColor.RESET);
        // log.debug(TeamColor.BLUE_BG + "firstEngName: " + firstEngName + TeamColor.RESET);
        
        String firstRegNo = (empDetail.getRegNo()).substring(0, 6);
        String lastRegNo = (empDetail.getRegNo()).substring(6, 13);
        
        // log.debug(TeamColor.PURPLE_BG + "firstRegNo: " + firstRegNo + TeamColor.RESET);
        // log.debug(TeamColor.BLUE_BG + "lastRegNo: " + lastRegNo + TeamColor.RESET);
        
        /* 영어이름, 주민등록번호 */
        model.addAttribute("lastEngName", lastEngName);
        model.addAttribute("firstEngName", firstEngName);
        
        model.addAttribute("firstRegNo", firstRegNo);
        model.addAttribute("lastRegNo", lastRegNo);
        
        return empDetail;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 22.
     * Description : 직원 등록
     */
    public String insertEmp(EmpRequestDTO empRequestDTO, FileReqDTO fileReqDTO) {
        
        String LastEngName = empRequestDTO.getLastEngName();
        String FirstEngName = empRequestDTO.getFirstEngName();
        
        String firstRegNo = empRequestDTO.getFirstRegNo();
        String lastRegNo = empRequestDTO.getLastRegNo();
        
        empRequestDTO.setEngName(LastEngName + "." + FirstEngName);
        empRequestDTO.setRegNo(firstRegNo + lastRegNo);
        
        MultipartFile mf = fileReqDTO.getGaFile();
        
        if(!fileReqDTO.getGaFile().isEmpty()) {
            String originalFilename = mf.getOriginalFilename();
            String fileType = mf.getContentType().toLowerCase();
            long fileSize = mf.getSize();
            String prefix = UUID.randomUUID().toString().replace("-", "");
            String suffix = fileExtension.getFileExtension(originalFilename);
            String newFileName = prefix + suffix;
            
            FileVO gaFile = new FileVO();
            gaFile.setOriginalName(originalFilename);
            gaFile.setFileType(fileType);
            gaFile.setFileSize(fileSize);
            gaFile.setFileName(newFileName);
            
            empRequestDTO.setProfile(newFileName);
            log.debug(TeamColor.PURPLE_BG + "HRService - newFileName: " + newFileName + TeamColor.RESET);
            
            int row = fileMapper.insertProfile(gaFile);
            log.debug(TeamColor.PURPLE_BG + "HRService - row: " + row + TeamColor.RESET);
            int result = hrMapper.insertEmp(empRequestDTO);
            log.debug(TeamColor.PURPLE_BG + "HRService - result: " + result + TeamColor.RESET);
            
            if (row != 1 && result != 1) {
                throw new RuntimeException("직원 등록에 실패했습니다.");
            }
            return newFileName;
        }
        
        return "empty";
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 22.
     * Description : 직원 정보 수정
     */
    public String updateEmp(EmpRequestDTO empRequestDTO, FileReqDTO fileReqDTO) {
        
        String LastEngName = empRequestDTO.getLastEngName();
        String FirstEngName = empRequestDTO.getFirstEngName();
        
        String firstRegNo = empRequestDTO.getFirstRegNo();
        String lastRegNo = empRequestDTO.getLastRegNo();
        
        empRequestDTO.setEngName(LastEngName + "." + FirstEngName);
        empRequestDTO.setRegNo(firstRegNo + lastRegNo);
        
        MultipartFile mf = fileReqDTO.getGaFile();
        
        if(!fileReqDTO.getGaFile().isEmpty()) {
            String originalFilename = mf.getOriginalFilename();
            String fileType = mf.getContentType().toLowerCase();
            long fileSize = mf.getSize();
            String prefix = UUID.randomUUID().toString().replace("-", "");
            String suffix = fileExtension.getFileExtension(originalFilename);
            String newFileName = prefix + suffix;
            String updateFileName = empRequestDTO.getUpdateFileName();
            
            FileVO gaFile = new FileVO();
            gaFile.setOriginalName(originalFilename);
            gaFile.setFileType(fileType);
            gaFile.setFileSize(fileSize);
            gaFile.setFileName(newFileName);
            gaFile.setUpdateFileName(updateFileName);
            
            empRequestDTO.setProfile(newFileName);
            log.debug(TeamColor.PURPLE_BG + "HRService - newFileName: " + newFileName + TeamColor.RESET);
            log.debug(TeamColor.PURPLE_BG + "HRService - updateFileName: " + updateFileName + TeamColor.RESET);
            
            int row = fileMapper.updateProfile(gaFile);
            log.debug(TeamColor.PURPLE_BG + "HRService - row: " + row + TeamColor.RESET);
            int result = hrMapper.updateEmp(empRequestDTO);
            log.debug(TeamColor.PURPLE_BG + "HRService - result: " + result + TeamColor.RESET);
            
            if (row != 1 && result != 1) {
                throw new RuntimeException("직원 수정에 실패했습니다.");
            }
            return newFileName;
        }
        
        return "empty";
    }
    
    /*
     * @author : 정건
     * @since : 2024. 07. 22.
     * Description : 직원 삭제
     */
    public int deleteEmp(String empCode, String profile) {

        int deleteEmp = hrMapper.deleteEmp(empCode);
        int deleteEmpProfile = fileMapper.deleteProfile(profile);

        if (deleteEmp == 1 && deleteEmpProfile == 1) {
            log.debug(yellow + "부서 삭제 성공" + yellow);
            return 1;
        } else {
            log.debug(yellow + "부서 삭제 실패" + yellow);
            return 0;
        }
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
