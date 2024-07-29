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
                            <label>안읽은 쪽지함</label>
                            <span id="unreadMessageCnt"></span>개 / ${pg.lastRow}개
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap d-flex flex-column align-items-center justify-content-between text-center">
                        <c:choose>
                            <c:when test="${!empty msg}">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th class="msg-sender">보낸이</th>
                                            <th class="msg-content">내용</th>
                                            <th class="msg-content">시간</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                        <c:forEach var="m" items="${msg}">
                                            <tr>
                                                <td><div>${m.senderName}</div></td>
                                                <td class="text-end">
                                                    <c:set var="title" value="${m.msgTitle}"/>
                                                    <div>${fn:substring(title, 0, 12)}...</div>
                                                </td>
                                                <td class="">
                                                    <c:set var="date" value="${m.sendTime}"/>
                                                    <div class="text-light msg-time ms-2">${fn:substring(date, 0, 8)}</div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!-- 페이징시작 -->
                                <div class="">
                                    <jsp:include page="/WEB-INF/view/home/home-paging.jsp"></jsp:include>
                                </div>
                                <!-- 페이징끝 -->
                            </c:when>
                            <c:otherwise>
                                <table class="table table-hover mb-4">
                                    <thead>
                                        <tr>
                                            <th class="msg-sender">보낸이</th>
                                            <th class="msg-content">내용</th>
                                            <th class="msg-content">시간</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                    </tbody>
                                </table>
                                <!-- 페이징시작 -->
                                <div class="">
                                    <jsp:include page="/WEB-INF/view/home/home-paging.jsp"></jsp:include>
                                </div>
                                <!-- 페이징끝 -->
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                ureadMessage();
            });
            
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
        </script>
    </body>
</html>
