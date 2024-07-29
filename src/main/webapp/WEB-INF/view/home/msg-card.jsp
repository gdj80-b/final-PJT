<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/msg-card.css"/>
    </head>
    <body>
        <div class="msg-card">
            <div class="card msg">
                <div class="card-body">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <i class="bx bxs-inbox fs-4 me-2"></i>
                            <h4>쪽지함</h4>
                        </div>
                        <div class="d-flex">
                            <label>안읽은 쪽지함&nbsp;</label>
                            <span id="unreadMessageCnt"></span>개
                            <span>&nbsp;/&nbsp;</span>
                            <span id="messageCnt"></span>개
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap d-flex flex-column align-items-center justify-content-between text-center">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="sender">보낸이</th>
                                    <th class="content">내용</th>
                                    <th class="time">시간</th>
                                </tr>
                            </thead>
                            <tbody id="messageTableBody" class="table-border-bottom-0"></tbody>
                        </table>
                        <!-- 페이징시작 -->
                        <div class="mt-2">
                            <jsp:include page="/WEB-INF/view/home/home-msg-paging.jsp"></jsp:include>
                        </div>
                        <!-- 페이징끝 -->
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                getHomeMessage();
                ureadMessage();
                getMessageCnt();
            });
            
            function getHomeMessage() {
                $.ajax({
                    url: '/gaent/home/message',
                    type: 'GET',
                    success: function(data) {
                        const tableBody = $('#messageTableBody');
                        tableBody.empty(); // 기존 데이터를 지웁니다.
                        
                        data.slice(0, 5).forEach((el) => {
                            const row = $('<tr>').css('cursor', 'pointer').on('click', function() {
                                location.href = `/gaent/msg/msgDetail/${el.msgNum}`;
                            });

                            const senderCell = $('<td>').append(
                                $('<div>').addClass('text-light msg-sender').text(el.senderName)
                            );

                            const titleCell = $('<td>').addClass('text-end').append(
                                $('<div>').addClass('msg-title').text(el.msgTitle.trim().length > 0 ? (el.msgTitle.trim().length > 12 ? `${el.msgTitle.trim().substring(0, 12)}...` : el.msgTitle.trim()) : '제목 없음')
                            );

                            const dateCell = $('<td>').append(
                                $('<div>').addClass('text-light msg-time ms-2').text(el.sendTime.substring(0, 10))
                            );

                            row.append(senderCell, titleCell, dateCell);
                            tableBody.append(row);
                        });
                    },
                    error: function(e) {
                        alert('쪽지함 내용을 불러오는데 실패했습니다.');
                    }
                });
            }
            
            function ureadMessage() {
                $.ajax({
                    url: "/gaent/unreadMessage", // 데이터를 가져올 URL
                    type: "GET", // GET 메서드를 사용
                    dataType: "json", // 반환 데이터 타입은 int
                    success: function(data) { // 요청이 성공하면 실행
                        // 서버에서 반환된 JSON 데이터에서 값을 읽어와서 msgAlert 요소에 표시
                        $("#unreadMessageCnt").text(data);
                    },
                    error: function() { // 요청이 실패하면 실행
                        alert("error"); // 에러 메시지 출력
                    }
                });
            }
            
            function getMessageCnt() {
                $.ajax({
                    url: "/gaent/home/message/page", // 데이터를 가져올 URL
                    type: "GET", // GET 메서드를 사용
                    success: function(data) { // 요청이 성공하면 실행
                        // console.log(data);
                        // 서버에서 반환된 JSON 데이터에서 값을 읽어와서 msgAlert 요소에 표시
                        $("#messageCnt").text(data.lastRow);
                    },
                    error: function() { // 요청이 실패하면 실행
                        alert("error"); // 에러 메시지 출력
                    }
                });
            }
        </script>
    </body>
</html>
