package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.NoticeMapper;
import com.ga.gaent.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class NoticeService {
    @Autowired NoticeMapper noticeMapper;
    
    // 전체리스트 조회
    public List<NoticeVO> getNoticeList(int currentPage, int rowPerPage, String search, String category){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("rowPerPage", rowPerPage);
        paramMap.put("beginRow", (currentPage - 1) * rowPerPage);
        paramMap.put("search", search);
        paramMap.put("category", category);
        
        List<NoticeVO> list = noticeMapper.selectNoticeList(paramMap);
        return list;
    }
    // 총 페이지 수, 검색
    public int getLastPage(int rowPerPage, String search, String category) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", search);
        paramMap.put("category", category);
        int cnt = noticeMapper.selectNoticeCount(paramMap);
        int lastPage = cnt / rowPerPage;
        if (cnt % rowPerPage != 0) {
            lastPage += 1;
        }
        return lastPage; 
    }
    // 공지사항 등록
    public int insertNotice(NoticeVO notice) {
        int addNotice = noticeMapper.insertNotice(notice);
        
        if(addNotice == 1) {
            log.debug("공지사항 등록 성공");
        } else {
            log.debug("공지사항 등록 실패");
        }
        return addNotice;
        
    }
    
    // 공지사항 삭제
    public int deleteNotice(int noticeNum) {
        int deleteNotice = noticeMapper.deleteNotice(noticeNum);
        
        if(deleteNotice == 1) {
            log.debug("공지사항 삭제 성공");
        } else {
            log.debug("공지사항 삭제 실패");
        }
        return deleteNotice;
    }
    
    // 공지사항 수정
    public int updateNotice(NoticeVO notice) {
        int updateNotice = noticeMapper.updateNotice(notice);
        
        if(updateNotice ==1) {
            log.debug("공지사항 등록 성공");
        } else {
            log.debug("공지사항 등록 실패");
        }
        return updateNotice;
    }
    
    // 공지사항 전체항목 출력, 페이징, 검색
    public Map<String, Object> selectNoticeList(int currentPage, int rowPerPage, String search, String category) {
        List<NoticeVO> list = getNoticeList(currentPage, rowPerPage, search, category);
        int lastPage = getLastPage(rowPerPage, search, category);
        
        Map<String, Object> m = new HashMap<>();
        m.put("list", list);
        m.put("currentPage", currentPage);
        m.put("lastPage", lastPage);
        m.put("search", search);
        m.put("category", category);

        return m;
    }
    
    // 공지사항 상세보기
    public List<Map<String, Object>> selectNoticeOne(int noticeNum) {
        List<Map<String, Object>> noticeOne = noticeMapper.selectNoticeOne(noticeNum);
        // 조회수
        noticeMapper.noticeCount(noticeNum);
        return noticeOne;
    }
  
}

