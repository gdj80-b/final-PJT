package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.EmpVO;
import com.ga.gaent.vo.TeamVO;

@Mapper
public interface InquiryMapper {

    // 직원 리스트 정보 조회
    List<EmpVO> selectEmpList(Map<String, Object> map);
    
    // 직원 리스트 카운트
    int selectEmpCount(String searchEmp);
    
    // 그룹 리스트 정보 조회
    List<TeamVO> selectTeamList(Map<String, Integer> map);
    
    // 그룹 리스트 카운트
    int selectTeamCount();
    
    // 피라미드 조직도 정보 조회
    public List<Map<String, Object>> selectGroupInfo();
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 27.
     * Description : 직원 상세 조회
     */
    public EmpVO selectEmpDetail(String empCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 부서 상세 조회
     */
    public List<Map<String, Object>> selectDeptDetail(String teamCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 부서 총원 조회
     */
    public int selectDeptTotal(String teamCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 관련부서 조회
     */
    public List<Map<String, Object>> selectDeptTeam(String teamCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 상세 조회
     */
    public List<Map<String, Object>> selectTeamDetail(String teamCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 멤버 정보 조회
     */
    public List<Map<String, Object>> selectMemberDetail(Map<String, Object> map);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 멤버 총 인원 조회
     */
    public int selectMemberCount(String teamCode);
    
    /*
     * @author : 김형호
     * @since : 2024. 07. 28.
     * Description : 팀 정보 모달 조회
     */
    public List<Map<String, Object>> selectTeamModal(String teamCode);
}
