package com.ga.gaent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.NoticeDTO;
import com.ga.gaent.mapper.NoticeMapper;
import com.ga.gaent.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class NoticeService {
    @Autowired NoticeMapper noticeMapper;
    
    public List<NoticeVO> getNoticeList(int currentPage, int rowPerPage, String search, String category){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("rowPerPage", rowPerPage);
        paramMap.put("beginRow", (currentPage - 1) * rowPerPage);
        paramMap.put("search", search);
        paramMap.put("category", category);
        
        List<NoticeVO> list = noticeMapper.selectNoticeList(paramMap);
        return list;
    }
    
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

    public void addNotice(NoticeDTO noticeDTO) {
        
    }
}

