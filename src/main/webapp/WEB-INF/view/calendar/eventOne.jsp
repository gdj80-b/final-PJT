<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정상세 - GAEnt.</title>
</head>
<body>
	<c:forEach var="vo" items="${eventOne}">
		<form action="/gaent/calendar/modifyEvent" method="post">
			<input type="hidden" name="calNum" value="${vo.calNum}">
			<table border=1>
				<tr>
					<th>일정타입</th>
					<td>
						<c:choose>
							<c:when test="${vo.calType eq 'public'}">
								<select name="calType">
								    <option value="public" selected="selected">개인(공개)</option>
								    <option value="private">개인(제한)</option>
								    <option value="tpublic">팀(공개)</option>
								    <option value="tprivate">팀(제한)</option>
								    <option value="corp">전사(전체)</option>
								    <option value="artist">아티스트(전체)</option>
								</select>
							</c:when>
							<c:when test="${vo.calType eq 'private'}">
								<select name="calType">
								    <option value="public">개인(공개)</option>
								    <option value="private" selected="selected">개인(제한)</option>
								    <option value="tpublic">팀(공개)</option>
								    <option value="tprivate">팀(제한)</option>
								    <option value="corp">전사(전체)</option>
								    <option value="artist">아티스트(전체)</option>
								</select>
							</c:when>
							<c:when test="${vo.calType eq 'tpublic'}">
								<select name="calType">
								    <option value="public">개인(공개)</option>
								    <option value="private">개인(제한)</option>
								    <option value="tpublic" selected="selected">팀(공개)</option>
								    <option value="tprivate">팀(제한)</option>
								    <option value="corp">전사(전체)</option>
								    <option value="artist">아티스트(전체)</option>
								</select>
							</c:when>
							<c:when test="${vo.calType eq 'tprivate'}">
								<select name="calType">
								    <option value="public">개인(공개)</option>
								    <option value="private">개인(제한)</option>
								    <option value="tpublic">팀(공개)</option>
								    <option value="tprivate" selected="selected">팀(제한)</option>
								    <option value="corp">전사(전체)</option>
								    <option value="artist">아티스트(전체)</option>
								</select>
							</c:when>
							<c:when test="${vo.calType eq 'corp'}">
								<select name="calType">
								    <option value="public">개인(공개)</option>
								    <option value="private">개인(제한)</option>
								    <option value="tpublic">팀(공개)</option>
								    <option value="tprivate">팀(제한)</option>
								    <option value="corp" selected="selected">전사(전체)</option>
								    <option value="artist">아티스트(전체)</option>
								</select>
							</c:when>
							<c:when test="${vo.calType eq 'artist'}">
								<select name="calType">
								    <option value="public">개인(공개)</option>
								    <option value="private">개인(제한)</option>
								    <option value="tpublic">팀(공개)</option>
								    <option value="tprivate">팀(제한)</option>
								    <option value="corp">전사(전체)</option>
								    <option value="artist" selected="selected">아티스트(전체)</option>
								</select>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>일정분류</th>
					<td>
						<c:choose>
							<c:when test="${vo.calTargetType eq '20110100'}">
								<select name="calTargetType">
								    <option value="20110100" selected="selected">개인</option>
								    <option value="110">인사팀</option>
								    <option value="210">경영팀</option>
								    <option value="220">회계팀</option>
								    <option value="310">기획팀</option>
								    <option value="320">제작팀</option>
								    <option value="410">홍보팀</option>
								    <option value="420">영업팀</option>
								    <option value="510">매니지먼트팀</option>
								    <option value="520">스타일팀</option>
								    <option value="corp">전사</option>
								    <option value="artist">아티스트</option>
								</select>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${vo.calWriter}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="calTitle" value="${vo.calTitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="calContent" value="${vo.calContent}"></td>
				</tr>
				<tr>
					<th>일정시작일</th>
					<td><input type="datetime-local" name="calStartDate" value="${vo.calStartDate}"></td>
				</tr>
				<tr>
					<th>일정종료일</th>
					<td><input type="datetime-local" name="calEndDate" value="${vo.calEndDate}"></td>
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
		<br>
	<button type="submit" class="btn btn-primary">일정수정</button>
	<a class="btn btn-danger" href="/gaent/calendar/removeEvent?calNum=${vo.calNum}">일정삭제</a>
	</form>
	</c:forEach>
</body>
</html>