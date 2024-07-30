package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.BoardRequestDTO;
import com.ga.gaent.dto.BoardResponseDTO;

@Mapper
public interface BoardMapper {

    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판) 작성하기
     */
    int insertBoard(BoardRequestDTO boardRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(공지사항) 작성하기
     */
    int insertNotice(BoardRequestDTO boardRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 메인 호출
     */
    List<Map<String, Object>> selectCommunityAtMain();
    List<Map<String, Object>> selectNoticeAtMain();
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 리스트 호출, 게시글 총 갯수
     */
    List<Map<String, Object>> selectCommunityList(int startRow, int rowPerPage);
    int selectCommunityListCnt();
    
    List<Map<String, Object>> selectNoticeList(int startRow, int rowPerPage);
    int selectNoticeListCnt();
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 상세 조회
     */
    Map<String, Object> selectCommunityDetail(int boardNum);
    Map<String, Object> selectNoticeDetail(int boardNum);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판, 공지사항) 상세 조회
     */
    int updateCommunityContent(Map<String, Object> paramMap);
    int updateNoticeContent(Map<String, Object> paramMap);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 25.
     * Description : 게시글(자유게시판, 공지사항) 삭제
     */
    int deleteCommunityContent(int boardNum);
    int deleteNoticeContent(int boardNum);
}
