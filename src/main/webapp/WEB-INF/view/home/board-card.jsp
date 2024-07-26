<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board-card.css" />
</head>
<body>
    <div class="notice-card">
        <div class="card">
            <div class="card-body">
                <div class="card-header">
                    <h4 class="card-title">공지사항</h4>
                </div>
                <div class="table-responsive text-nowrap d-flex flex-column align-items-center">
                    <table class="table table-hover text-center">
                        <thead>
                            <tr>
                                <th class="board-category">항목</th>
                                <th class="board-title">제목</th>
                                <th class="board-writer">작성자</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                            <c:forEach var="n" items="${noticeListToHome}">
                                <tr onclick="location.href='/gaent/board/notice/boardDetail?boardNum=${n.noticeNum}'">
                                    <td><span class="fw-medium">항목</span></td>
                                    <td class="text-start"><span class="fw-medium">${n.noticeTitle}</span></td>
                                    <td><span class="fw-medium">${n.noticeWriter}</span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- 페이징시작 -->
                    <div class="mt-4">
                        <jsp:include page="/WEB-INF/view/board/board-paging.jsp"></jsp:include>
                    </div>
                    <!-- 페이징끝 -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>
