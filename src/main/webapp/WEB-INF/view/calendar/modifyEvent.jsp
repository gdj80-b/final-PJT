<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정상세</title>
</head>
<body>
	<table border=1>
		<c:forEach var="vo" items="${eventOne}">
			<tr>
				<th>일정타입</th>
				<td>${vo.calType}</td>
			</tr>
			<tr>
				<th>일정공개범위</th>
				<td>${vo.calTargetType}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.calWriter}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${vo.calTitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${vo.calContent}</td>
			</tr>
			<tr>
				<th>일정시작일</th>
				<td>${vo.calStartDate}</td>
			</tr>
			<tr>
				<th>일정종료일</th>
				<td>${vo.calEndDate}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${vo.calCreateDate}</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${vo.calUpdateDate}</td>
			</tr>
	</table>
	
	<a href="/gaent/calendar/modifyEvent">일정수정</a>
	<a href="/gaent/calendar/removeEvent?calNum=${vo.calNum}">일정삭제</a>
	</c:forEach>
</body>
</html>