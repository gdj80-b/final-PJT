package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.VacationDTO;
import com.ga.gaent.vo.CalendarVO;

@Mapper
public interface VacationMapper {
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 휴가내역 상세보기
     */
    public Map<String,Object>selectMyVacStatus(String empCode);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 휴가이력 조회
     */
    List<VacationDTO>selectMyVacList(Map<String, Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 19.
     * Description : 휴가이력 페이징
     */
    int myVacCnt(Map<String,Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 27.
     * Description : 금일 승인된 휴가 내역 조회
     */
    List<Map<String,Object>>checkApprovedVacation();
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 27.
     * Description : Calendar테이블에 휴가 등록
     */
    int registerVacation(CalendarVO m);
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 27.
     * Description : 보유 휴가 차감
     */
    int deductVacation(Map<String, Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 27.
     * Description : 매해 1월 1일 1분에 직워에 따른 휴가 초기화
     */
    int resetVacation();
    
}
