package com.ga.gaent.util;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;
import lombok.extern.slf4j.Slf4j;

public class PagingAtHome {

    public Map<String, Object> Paging(int currentPage, int totalRow) {

        // int currentPage = 1;
        
        // 현재 페이지 번호
        // 홈에서 보여주는 기본 레코드 수
        int rowPerPage = 5;

        // 매개값으로 넘어온 수를 페이지 당 기본 레코드 수로 바꿈 

        // 리스트에서 보여줄 페이지 개수
        int pageSize = 5;

        // 아래 부터 입력받는 데이터를 통해 계산
        // 시작 레코드 번호
        int firstRow;

        // 마지막 레코드 번호
        int lastRow;

        // 총 페이지 개수
        int totalPage;

        // 시작 페이지 번호
        int firstPage;

        // 마지막 페이지 번호
        int lastPage;

        totalPage = (totalRow - 1) / rowPerPage + 1;
        firstRow = (currentPage - 1) * rowPerPage + 1;
        lastRow = firstRow + rowPerPage - 1;
        
        if(lastRow >= totalRow) {
            lastRow = totalRow;
        }

        firstPage = ((currentPage - 1) / pageSize) * pageSize + 1;

        lastPage = firstPage + pageSize + 1;
        lastPage = firstPage + pageSize - 1;
        if(lastPage > totalPage) {
            lastPage = totalPage;
        }

        Map<String, Object> pagingMap = new HashMap<>();
        pagingMap.put("currentPage", currentPage);
        pagingMap.put("rowPerPage", rowPerPage);
        pagingMap.put("pageSize", pageSize);
        pagingMap.put("firstRow", firstRow);
        pagingMap.put("lastRow", lastRow);
        pagingMap.put("totalRow", totalRow);
        pagingMap.put("totalPage", totalPage);
        pagingMap.put("firstPage", firstPage);
        pagingMap.put("lastPage", lastPage);

        return pagingMap;

    }
}


