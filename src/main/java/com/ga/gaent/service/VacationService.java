package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.VacationDTO;
import com.ga.gaent.mapper.CalendarMapper;
import com.ga.gaent.mapper.VacationMapper;
import com.ga.gaent.util.Paging;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class VacationService {
    @Autowired VacationMapper vacationMapper;
    @Autowired CalendarMapper calendarMapper;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 휴가내역 상세보기
     */
    public Map<String,Object>selectMyVacStatus(String empCode){
        
        return vacationMapper.selectMyVacStatus(empCode);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 휴가이력 조회
     */
    public List<VacationDTO>selectMyVacList(String empCode){
        
        Map<String, Object>m = new HashMap<>();
        m.put("empCode", empCode);
        
        return vacationMapper.selectMyVacList(m);
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 휴가이력 페이징
     */
    public Map<String, Object> getPagingIdx(String empCode, int currentPage) {
        
        
        Map<String, Object> m = new HashMap<>();
        m.put("empCode", empCode);
        
        // total페이지를 구함
        int totalRow = vacationMapper.myVacCnt(m);
        
        // 페이징을 위한 요소들을 담아옴
        Paging v = new Paging();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);
        
        
        return pagingMap; 
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 27.
     * Description : 매일 자정 5분전에 오늘 새로 결재 승인된 휴가가 있을 경우 개인 일정으로 등록한 후 개인 연차에서 차감되는 매서드
     */
    @Scheduled(cron = "0 55 23 * * *")
    public void checkApprovedVacation(){
        
        List<Map<String, Object>>list = vacationMapper.checkApprovedVacation();
        
        // 새로 승인된 문서가 있을 경우
        if(list != null) {
            
            // 리스트 안 map요소들을 반복
            for (Map<String, Object> map : list) {
                CalendarVO vo = new CalendarVO();
                
                // 일정 등록
                String calWriter = (String) map.get("empCode");
                String calTitle = (String) map.get("calTitle");
                String calContent = (String) map.get("calContent");
                String calStartDate = (String) map.get("calStartDate");
                String calEndDate = (String) map.get("calEndDate");
                
                vo.setCalWriter(calWriter);
                vo.setCalType("personal");
                vo.setCalTargetType(calWriter);
                vo.setCalTitle(calTitle);
                vo.setCalContent(calContent);
                vo.setCalStartDate(calStartDate);
                vo.setCalEndDate(calEndDate);
                
                int success =  calendarMapper.insertEvent(vo);
                log.debug(TeamColor.RED + "일정 등록 결과: " + success + TeamColor.RESET);                
                /*------------------------------- */
                
                // 연차 차감
                Integer vacPeriod = (Integer) map.get("vacPeriod");
                double useLeave = vacPeriod;
                if(calTitle.contains("반차")) {
                    useLeave = 0.5;
                }                
                log.debug(TeamColor.RED + "차감할 휴가 일 수: " + useLeave + TeamColor.RESET);
                Map<String, Object>deducMap = new HashMap<>();
                deducMap.put("empCode", calWriter);
                deducMap.put("useLeave", useLeave);
                
                int duductSuccess = vacationMapper.deductVacation(deducMap);
                log.debug(TeamColor.RED + "휴가 차감 결과: " + duductSuccess + TeamColor.RESET);
                
            }
        }
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 27.
     * Description : 매해 1월 1일 1분에 직워에 따른 휴가 초기화 매서드
     */
    @Scheduled(cron = "1 0 0 1 1 *")
    public void resetVacation() {
        int HappyNewYear = vacationMapper.resetVacation();
        log.debug(TeamColor.RED + "휴가 초기화 결과: " + HappyNewYear + TeamColor.RESET);
        log.debug(TeamColor.YELLOW_BG + "!!!Happy New Year!!! " + TeamColor.RESET); 
        
    }
    
}
