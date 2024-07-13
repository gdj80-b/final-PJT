package com.ga.gaent.vo;

import java.util.HashMap;
import java.util.Map;

public class PagingVO {
    
    public Map<String,Object>Paging(int currentPage ,int totalRow){        
        // int currentPage = 1;    // 현재 페이지 번호
        int rowPerPage = 10;    // 페이지 당 레코드 수
        int pageSize = 5;       // 리스트에서 보여줄 페이지 개수
        // totalRow             // 총 레코드 수
        
        // 입력받는 데이터를 통해 계산
        int firstRow;           // 시작 레코드 번호
        int lastRow;            // 마지막 레코드 번호
        int totalPage;          // 총 페이지 개수
        int firstPage;          // 시작 페이지 번호
        int lastPage;           // 마지막 페이지 번호
        
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
        pagingMap.put("currentPage",currentPage);
        pagingMap.put("rowPerPage",rowPerPage);
        pagingMap.put("pageSize",pageSize);
        pagingMap.put("firstRow",firstRow);
        pagingMap.put("lastRow",lastRow);
        pagingMap.put("totalRow",totalRow);
        pagingMap.put("totalPage",totalPage);
        pagingMap.put("firstPage",firstPage);
        pagingMap.put("lastPage",lastPage);
        
        
        
        
        return pagingMap;
        
    }
}
