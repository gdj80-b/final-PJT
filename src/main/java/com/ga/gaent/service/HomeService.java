package com.ga.gaent.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.dto.MsgDTO;
import com.ga.gaent.dto.MyPageRequestDTO;
import com.ga.gaent.mapper.BoardMapper;
import com.ga.gaent.mapper.FileMapper;
import com.ga.gaent.mapper.HomeMapper;
import com.ga.gaent.mapper.MsgMapper;
import com.ga.gaent.util.FileExtension;
import com.ga.gaent.util.PagingAtHome;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.FileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class HomeService {
    
    @Autowired private HomeMapper homeMapper;
    
    @Autowired private BoardMapper boardMapper;
    
    @Autowired private MsgMapper msgMapper;
    
    @Autowired private FileMapper fileMapper;
    
    @Autowired private FileExtension fileExtension;

    /*
     * @author : 정건희
     * @since : 2024. 07. 27.
     * Description : 헤더 마이페이지(프로필) 개인정보 조회
     */
    public EmpVO selectMyPageInfo(String empCode) {
        
        EmpVO myPageInfo = homeMapper.selectMyPageInfo(empCode);
        
        String regNo = myPageInfo.getRegNo();
        Calendar cal = Calendar.getInstance();
        
        int year = cal.get(Calendar.YEAR);
        int age = 0;
        String birth = "";
        String birthYear = "";
        
        if((regNo.substring(6, 7)).equals("1") || (regNo.substring(6, 7)).equals("2")) {
            birthYear = "19" + regNo.substring(0, 2);
            birth = birthYear + regNo.substring(2, 6);
        } else {
            birthYear = "20" + regNo.substring(0, 2);
            birth = birthYear + regNo.substring(2, 6);
        }
        
        
        age = year - Integer.parseInt(birthYear);
        
        /* 나이와 생년월일 계산 */
        myPageInfo.setAge(age);
        myPageInfo.setBirth(birth);
        
        String rank = myPageInfo.getRankCode();
        if(rank.equals("1")) {
            myPageInfo.setRankName("대표");
        } else if(rank.equals("0")) {
            myPageInfo.setRankName("아티스트");
        } else if(rank.equals("2")) {
            myPageInfo.setRankName("부장");
        } else if(rank.equals("3")) {
            myPageInfo.setRankName("팀장");
        } else if(rank.equals("4")) {
            myPageInfo.setRankName("대리");
        } else if(rank.equals("5")) {
            myPageInfo.setRankName("사원");
        }
        
        return myPageInfo;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 헤더 마이페이지(프로필) 개인정보 수정
     */
    public String updateMyPage(MyPageRequestDTO myPageRequestDTO, FileReqDTO fileReqDTO) {
        
        MultipartFile mf = fileReqDTO.getGaFile();
        String originalFilename = "";
        String fileType = "";
        long fileSize = 0L;
        String prefix = "";
        String suffix = "";
        String newFileName = "empty";
        String updatePhone = myPageRequestDTO.getMyPagePhone().replace("-", "");
        myPageRequestDTO.setMyPagePhone(updatePhone);
        // log.debug(TeamColor.PURPLE_BG + "HomeService updatePhone: " + updatePhone + TeamColor.RESET);
        
        if(!mf.isEmpty()) {
            originalFilename = mf.getOriginalFilename();
            fileType = mf.getContentType().toLowerCase();
            fileSize = mf.getSize();
            prefix = UUID.randomUUID().toString().replace("-", "");
            suffix = fileExtension.getFileExtension(originalFilename);
            newFileName = prefix + suffix;
            
            FileVO gaFile = new FileVO();
            gaFile.setOriginalName(originalFilename);
            gaFile.setFileType(fileType);
            gaFile.setFileSize(fileSize);
            gaFile.setFileName(newFileName);
            
            myPageRequestDTO.setMyPageProfile(newFileName);
            log.debug(TeamColor.PURPLE_BG + "HomeService newFileName: " + newFileName + TeamColor.RESET);
            
            int row = fileMapper.insertProfile(gaFile);
            log.debug(TeamColor.PURPLE_BG + "HomeService UpdateInfo row: " + row + TeamColor.RESET);
            
            int result = homeMapper.updateMyPageInfo(myPageRequestDTO);
            log.debug(TeamColor.PURPLE_BG + "HomeService UpdateInfo result: " + result + TeamColor.RESET);
            
            if (row != 1 && result != 1) {
                throw new RuntimeException("정보 수정에 실패했습니다.");
            }
            
            return newFileName;
            
        } else {
            
            int result = homeMapper.updateMyPageInfo(myPageRequestDTO);
            log.debug(TeamColor.PURPLE_BG + "myPageRequestDTO: " + myPageRequestDTO + TeamColor.RESET);
            
            if (result != 1) {
                throw new RuntimeException("정보 수정에 실패했습니다.");
            }
            
            return newFileName;
        }
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 홈(메인) 쪽지함 조회
     */
    public List<MsgDTO> selectMessageListAtHome(String empCode, int currentPage) {
        
        Map<String, Object> map = new HashMap<>();
        map.put("empCode", empCode);
        map.put("startRow", (currentPage - 1) * 5);
        
        return homeMapper.selectMessageListAtHome(map);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 홈(메인) 쪽지함 페이지네이션
     */
    public Map<String, Object> selectMessagePagingAtHome(String empCode, int request, int currentPage) {
        
        Map<String, Object> map = new HashMap<>();
        
        map.put("empCode", empCode);
        map.put("request", request);
        
        int totalRow = msgMapper.msgCnt(map);
        
        PagingAtHome pagingAtHome = new PagingAtHome();
        
        Map<String, Object> pagingMap = pagingAtHome.Paging(currentPage, totalRow);
        log.debug(TeamColor.PURPLE_BG + "pagingMap: " + pagingMap + TeamColor.RESET);
        
        return pagingMap;
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 홈(메인) 공지사항 조회
     */
    public List<Map<String, Object>> selectNoticeListAtHome(int currentPage) {
        
        Map<String, Object> map = new HashMap<>();
        map.put("startRow", (currentPage - 1) * 5);
        
        return homeMapper.selectNoticeListAtHome(map);
    }
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 29.
     * Description : 홈(메인) 공지사항 페이지네이션
     */
    public Map<String, Object> selectNoticePagingAtHome(int currentPage) {
        
        int totalRow = boardMapper.selectNoticeListCnt();
        
        PagingAtHome pagingAtHome = new PagingAtHome();
        
        Map<String, Object> pagingMap = pagingAtHome.Paging(currentPage, totalRow);
        log.debug(TeamColor.PURPLE_BG + "pagingMap: " + pagingMap + TeamColor.RESET);
        
        return pagingMap;
    }
}
