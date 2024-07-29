package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.AtdDTO;
import com.ga.gaent.vo.AtdVO;

@Mapper
public interface AtdMapper {
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 14. 
     * Description : 개인 출퇴근 여부 조회
     */
    AtdDTO checkAtdStatus(String empCode);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 15. 
     * Description : 출근 등록
     */
    int atdIn(String empCode);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 15. 
     * Description : 퇴근 등록
     */
    int atdOut(String empCode);
    
    
    
    // 출퇴근이력
    List<AtdDTO> selectAtdHistory(Map<String, Object>m);
    
    
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22. 
     * Description : 일간 근무시간 조회
     */
    Integer dailyWorkMinutes(String empCode);
    /*
     * @author : 조인환
     * @since : 2024. 07. 22. 
     * Description : 주간 근무시간 조회
     */
    Integer weeklyWorkMinutes(String empCode);
    /*
     * @author : 조인환
     * @since : 2024. 07. 22. 
     * Description : 월간 근무시간 조회
     */
    Integer monthlyWorkMinutes(String empCode);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 29.
     * Description : 금일 출근하지 않은 직원 조회
     */
    List<String>getNotAtendEmpCode();
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 29.
     * Description : 출퇴근 자동등록
     */
    int autoRegisterAtd(String empCode);
    
    
    Map<String, Object>selectAtdStatusCount(Map<String, Object>m);
}
