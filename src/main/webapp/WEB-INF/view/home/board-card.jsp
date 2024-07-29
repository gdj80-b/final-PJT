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
                    <div class="card-header">
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
                        <!-- 페이징시작 -->
                        <div class="mt-2">
                            <jsp:include page="/WEB-INF/view/home/home-notice-paging.jsp"></jsp:include>
                        </div>
                        <!-- 페이징끝 -->
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function() {
            getHomeNotice();
            // getNoticeCnt();
        });
        
        function getHomeNotice() {
            $.ajax({
                url: '/gaent/home/notice',
                type: 'GET',
                success: function(data) {
                    // console.log(data);
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
                    alert('공지사항 내용을 불러오는데 실패했습니다.');
                }
            });
        }
        
        function getNoticeCnt() {
            $.ajax({
                url: "/gaent/home/message/page", // 데이터를 가져올 URL
                type: "GET", // GET 메서드를 사용
                success: function(data) { // 요청이 성공하면 실행
                    console.log(data);
                    // 서버에서 반환된 JSON 데이터에서 값을 읽어와서 msgAlert 요소에 표시
                    $("#messageCnt").text(data.lastRow);
                },
                error: function() { // 요청이 실패하면 실행
                    alert("error"); // 에러 메시지 출력
                }
            });
        }
    </script>
</html>
