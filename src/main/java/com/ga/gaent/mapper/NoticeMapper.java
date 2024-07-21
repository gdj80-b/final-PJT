package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ga.gaent.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
    // 공지사항 조회(검색, 페이징)
    List<NoticeVO> selectNoticeList(Map<String, Object> paramMap);
    
    // 공지사항 등록
    int insertNotice(NoticeVO notice);
    
    // 총 공지사항 수
    int selectNoticeCount(Map<String, Object> paramMap);
    
    // 공지사항 수정
    int updateNotice(NoticeVO notice);
    
    // 공지사항 삭제
    int deleteNotice(int noticeNum);
    
    // 공지사항 상세
    List<Map<String, Object>> selectNoticeOne(int noticeNum);
    
    // 조회수
    void noticeCount(int noticeNum);
}
