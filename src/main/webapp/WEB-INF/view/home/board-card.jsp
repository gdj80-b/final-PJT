<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board-card.css" />
    </head>
    <body>
        <div class="notice-card">
            <div class="card notice">
                <div class="card-body">
                    <div class="card-header d-flex align-items-center">
                        <i class="bx bx-conversation fs-4 me-2"></i>
                        <h4 class="card-title">공지사항</h4>
                    </div>
                    <div class="table-responsive text-nowrap d-flex flex-column align-items-center">
                        <table class="table table-hover text-center">
                            <thead>
                                <tr>
                                    <th class="category">항목</th>
                                    <th class="title">제목</th>
                                    <th class="writer">작성자</th>
                                </tr>
                            </thead>
                            <tbody id="noticeTableBody" class="table-border-bottom-0"></tbody>
                        </table>
                        <div class="mt-2">
                            <nav aria-label="Page navigation" style="">
                                <ul class="pagination">
                                    <li id="boardPrev" class="page-item prev">
                                        <button id="boardPrevBtn" class="page-link"><i class="tf-icon bx bx-chevron-left"></i></button>
                                    </li>
                                    <li id="boardNowPage" class="page-item">
                                    </li>
                                    <li id="boardNext" class="page-item next">
                                        <button id="boardNextBtn" class="page-link"><i class="tf-icon bx bx-chevron-right"></i></button>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        // 첫 번째, 마지막 페이지 초기값
        let firstPage = 1;
        let totalPage = 0;
        
        $(document).ready(function() {
            
            // 현재 페이지 초기값
            let page = 1;
            
            // 공지사항 조회
            getHomeNotice(page);
            
            // 공지사항 글 총 갯수 조회
            getNoticeCnt();
            
            // 현재 페이지
            updatePageBoard(page);
            
            // 이전 버튼
            $('#boardPrevBtn').click(function() {
                if(page > firstPage) {
                    page--;
                    updatePage(page);
                }
            });
            
            // 다음 버튼
            $('#boardNextBtn').click(function() {
                if(page < totalPage) {
                    page++;
                    updatePage(page);
                }
            });
        });
        
        function updatePage(newPage) {
            page = newPage;
            getHomeNotice(newPage);
            getNoticeCnt(newPage);
            updatePageBoard(newPage);
        }
        
        function updatePageBoard(page) {
            $('#boardNowPage').html('<a class="page-link">' + page + '</a>');
            $('#boardPrevBtn').toggleClass('disabled', page <= firstPage);
            $('#boardNextBtn').toggleClass('disabled', page >= totalPage);
        }
        
        function getHomeNotice(page) {
            $.ajax({
                url: '/gaent/home/notice?currentPage=' + page,
                type: 'GET',
                success: function(data) {
                    console.log(data);
                    const tableBody = $('#noticeTableBody');
                    tableBody.empty(); // 기존 데이터를 지웁니다.
                    
                    data.slice(0, 5).forEach((el) => {
                        const row = $('<tr>').css('cursor', 'pointer').on('click', function() {
                            location.href = `/gaent/board/notice/boardDetail?boardNum=` + el.noticeNum;
                        });
    
                        const categoryCell = $('<td>').append(
                            $('<div>').addClass('text-light board-category').text('항목')
                        );
    
                        const titleCell = $('<td>').addClass('text-start').append(
                            $('<div>').addClass('board-title').text(el.noticeTitle)
                        );
    
                        const writerCell = $('<td>').append(
                            $('<div>').addClass('text-light board-writer').text(el.noticeWriter)
                        );
    
                        row.append(categoryCell, titleCell, writerCell);
                        tableBody.append(row);
                    });
                },
                error: function(e) {
                    console.log(e);
                    alert('공지사항 내용을 불러오는데 실패했습니다.');
                }
            });
        }
        
        function getNoticeCnt(page) {
            $.ajax({
                url: '/gaent/home/notice/page',
                type: 'GET',
                data: page,
                success: function(data) {
                    console.log(data);
                    totalPage = data.totalPage;
                },
                error: function(e) {
                    console.log(e);
                    alert('error');
                }
            });
        }
    </script>
</html>