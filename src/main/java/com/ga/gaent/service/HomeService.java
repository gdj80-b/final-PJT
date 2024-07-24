package com.ga.gaent.service;

import java.util.Calendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.HomeMapper;
import com.ga.gaent.vo.EmpVO;

@Transactional
@Service
public class HomeService {
    
    @Autowired HomeMapper homeMapper;

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
}
