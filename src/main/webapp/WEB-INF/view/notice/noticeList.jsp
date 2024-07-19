<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h1>공지사항</h1>
    <div id="category-buttons">
        <button data-category="T">사내공지</button>
        <button data-category="C">식단표</button>
        <button data-category="M">QnA</button>
    </div>
    <div>
        <input type="text" id="search-input" placeholder="검색어 입력">
        <button id="search-button">검색</button>
    </div>
    <ul id="notice-list">
        <c:forEach var="notice" items="${notices}">
            <li>${notice.noticeTitle} - ${notice.noticeContent}</li>
        </c:forEach>
    </ul>
    
   <c:if test="${currentPage > 1}">
        <a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage - 1}&search=${search}">이전</a>
    </c:if>
    <c:if test="${currentPage < lastPage}">
    <c:choose>
        <c:when test="${empty search}">
            <a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage + 1}">다음</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage + 1}&search=${search}">다음</a>
        </c:otherwise>
    </c:choose>
</c:if>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</html>