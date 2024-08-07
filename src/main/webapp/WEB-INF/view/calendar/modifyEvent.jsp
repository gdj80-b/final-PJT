<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정수정 - GAEnt.</title>
<style>
.footer-btn {
	text-align: right;
}

.del-confirm {
    text-align: center;
}
</style>
<!-- Bootstrap CSS 및 JS 링크 추가 필요 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:forEach var="vo" items="${eventOne}">
		<form action="/gaent/calendar/modifyEvent" method="post">
			<div class="card mb-4">
		    	<div class="card-body">
		      		<div class="mb-3">
		        		<input type="hidden" name="calNum" value="${vo.calNum}">
		        		<label for="calType" class="form-label">일정타입</label>
	        			<div>
					        <c:choose>
				                <c:when test="${vo.calType eq 'personal'}">
									<input type="hidden" name="calType" value="personal">개인일정
								</c:when>
								<c:when test="${vo.calType eq 'team'}">
									<input type="hidden" name="calType" value="team">팀 일정
								</c:when>
								<c:when test="${vo.calType eq 'company'}">
									<input type="hidden" name="calType" value="company">전사일정
								</c:when>
								<c:when test="${vo.calType eq 'artist'}">
									<input type="hidden" name="calType" value="artist">아티스트 일정
								</c:when>
							</c:choose>
						</div><br>
					<div class="mb-3">
			        	<label for="calTargetType" class="form-label">일정분류</label>
		        		<div>
					        <c:choose>
								<c:when test="${vo.calTargetType eq loginInfo.empCode}">
								    <input type="hidden" name="calTargetType" value="${loginInfo.empCode}">개인
								</c:when>
								<c:when test="${vo.calTargetType eq 900}">
								    <input type="hidden" name="calTargetType" value="${loginInfo.empCode}">아티스트
								</c:when>
								<c:when test="${vo.calTargetType eq vo.teamCode}">
								    <input type="hidden" name="calTargetType" value="${vo.teamCode}">${vo.teamName}
								</c:when>
							</c:choose>
						</div>
			      	</div>
			        	<input name="calWriter" id="calWriter" class="form-control" type="hidden" value="${loginInfo.empCode}">
				        <div class="mb-3">
				        	<label for="calTitle" class="form-label">제목</label>
				        	<input name="calTitle" id="calTitle" class="form-control" type="text" placeholder="내용을 입력해주세요." value="${vo.calTitle}" required="required">
				        </div>
				        <div class="mb-3">
				        	<label for="calContent" class="form-label">내용</label>
				        	<input name="calContent" id="calContent" class="form-control" type="text" placeholder="내용을 입력해주세요." value="${vo.calContent}" required="required">
				        </div>
				        <div class="mb-3">
				        	<label for="calStartDate" class="form-label">일정시작일</label>
				        	<input name="calStartDate" class="form-control" type="datetime-local" id="calStartDate" value="${vo.calStartDate}" required="required">
				        </div>
				        <div class="mb-3">
				        	<label for="calEndDate" class="form-label">일정종료일</label>
				        	<input name="calEndDate" class="form-control" type="datetime-local" id="calEndDate" value="${vo.calEndDate}" required="required">
				        </div>
		    		</div>
				</div>
				<div class="footer-btn">
					<c:choose>
						<c:when test="${loginInfo.rankCode == 1}">
							<c:choose>
								<c:when test="${vo.calType eq 'personal' or vo.calType eq 'company' or vo.calType eq 'artist'}">
									<button type="button" class="btn btn-danger" onclick="confirmDelete('${vo.calNum}')">삭제</button>
									<button type="submit" class="btn btn-primary">수정</button>
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${loginInfo.rankCode == 2 or loginInfo.rankCode == 3}">
							<button type="button" class="btn btn-danger" onclick="confirmDelete('${vo.calNum}')">삭제</button>
							<button type="submit" class="btn btn-primary">수정</button>
						</c:when>
						<c:when test="${loginInfo.rankCode == 4}">
							<c:choose>
								<c:when test="${vo.calType eq 'personal' or vo.calType eq 'team'}">
									<button type="button" class="btn btn-danger" onclick="confirmDelete('${vo.calNum}')">삭제</button>
									<button type="submit" class="btn btn-primary">수정</button>
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${loginInfo.rankCode == 5}">
							<c:choose>
								<c:when test="${vo.calType eq 'personal'}">
									<button type="button" class="btn btn-danger" onclick="confirmDelete('${vo.calNum}')">삭제</button>
									<button type="submit" class="btn btn-primary">수정</button>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
					<a href="/gaent/calendar" class="btn btn-secondary">닫기</a>
				</div>
			</div>
		</form>
	</c:forEach>

	<script>
		function confirmDelete(calNum) {
		    if (confirm('일정을 삭제하시겠습니까?')) {
		        // 삭제 요청을 위해 링크로 이동
		        window.location.href = '/gaent/calendar/removeEvent?calNum=' + calNum;
		    }
		}
	</script>
</body>
</html>