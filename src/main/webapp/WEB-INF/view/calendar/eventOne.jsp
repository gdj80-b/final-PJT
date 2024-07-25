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
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">부서명</label>
                <br />
                <c:choose>
					<c:when test="${vo.calType eq 'public'}">
						개인(공개)
					</c:when>
					<c:when test="${vo.calType eq 'private'}">
						개인(제한)
					</c:when>
					<c:when test="${vo.calType eq 'tpublic'}">
						팀(공개)
					</c:when>
					<c:when test="${vo.calType eq 'tprivate'}">
						팀(제한)
					</c:when>
					<c:when test="${vo.calType eq 'corp'}">
						전사(전체)
					</c:when>
					<c:when test="${vo.calType eq 'artist'}">
						아티스트(전체)
					</c:when>
				</c:choose>
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">작성자</label><br />
                ${vo.calWriter}
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">제목</label><br />
                ${vo.calTitle}
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">내용</label><br />
                ${vo.calContent}
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">일정시작일</label><br />
                ${vo.calStartDate}
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">일정종료일</label><br />
                ${vo.calEndDate}
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">일정분류</label><br />
                <c:choose>
					<c:when test="${vo.calTargetType eq loginInfo.empCode}">
					    개인
					</c:when>
					<c:when test="${vo.calTargetType eq 110}">
					    인사팀
					</c:when>
					<c:when test="${vo.calTargetType eq 210}">
					    경영팀
					</c:when>
					<c:when test="${vo.calTargetType eq 220}">
					    회계팀
					</c:when>
					<c:when test="${vo.calTargetType eq 310}">
					    기획팀
					</c:when>
					<c:when test="${vo.calTargetType eq 320}">
					    제작팀
					</c:when>
					<c:when test="${vo.calTargetType eq 410}">
					    홍보팀
					</c:when>
					<c:when test="${vo.calTargetType eq 420}">
					    영업팀
					</c:when>
					<c:when test="${vo.calTargetType eq 510}">
					    매니지먼트팀
					</c:when>
					<c:when test="${vo.calTargetType eq 520}">
					    스타일팀
					</c:when>
					<c:when test="${vo.calTargetType eq 10}">
					    전사
					</c:when>
					<c:when test="${vo.calTargetType eq 900}">
					    아티스트
					</c:when>
				</c:choose>
              </div>
            </div>
		</form>
	</c:forEach>
</body>
</html>