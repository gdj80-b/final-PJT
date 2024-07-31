<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정상세 - GAEnt.</title>
<style>
.footer {
	text-align: right;
}
</style>
</head>
<body>
	<c:forEach var="vo" items="${eventOne}">
		<form action="/gaent/calendar/modifyEvent" method="post">
			<div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">일정타입</label><br />
                	<c:choose>
	                	<c:when test="${vo.calType eq 'personal'}">
							개인일정
						</c:when>
						<c:when test="${vo.calType eq 'team'}">
							팀 일정
						</c:when>
						<c:when test="${vo.calType eq 'company'}">
							전사일정
						</c:when>
						<c:when test="${vo.calType eq 'artist'}">
							아티스트 일정
						</c:when>
					</c:choose>
              </div>
            </div>
            <div class="row">
              <div class="col mb-3">
                <label for="nameSmall" class="form-label">일정분류</label><br />
                <c:choose>
					<c:when test="${vo.calTargetType eq loginInfo.empCode}">
					    개인
					</c:when>
					<c:when test="${vo.calTargetType eq vo.teamCode}">
					    ${vo.teamName}
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
            </div><br><br>
            <div class="footer">
            	<c:choose>
				  <c:when test="${loginInfo.rankCode == 1}">
					  <c:choose>
						  <c:when test="${vo.calType eq 'personal' or vo.calType eq 'company' or vo.calType eq 'artist'}">
							  <button type="button" class="btn btn-primary" id="modifyEventBtn">수정</button>
						  </c:when>
					  </c:choose>
				  </c:when>
				  <c:when test="${loginInfo.rankCode == 2 or loginInfo.rankCode == 3}">
					  <button type="button" class="btn btn-primary" id="modifyEventBtn">수정</button>
				  </c:when>
				  <c:when test="${loginInfo.rankCode == 4}">
					  <c:choose>
						  <c:when test="${vo.calType eq 'personal' or vo.calType eq 'team'}">
							  <button type="button" class="btn btn-primary" id="modifyEventBtn">수정</button>
						  </c:when>
					  </c:choose>
				  </c:when>
				  <c:when test="${loginInfo.rankCode == 5}">
					  <c:choose>
						  <c:when test="${vo.calType eq 'personal'}">
							  <button type="button" class="btn btn-primary" id="modifyEventBtn">수정</button>
						  </c:when>
					  </c:choose>
				  </c:when>
			  </c:choose>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
		</form>
		
		<script>
			//이벤트 상세 모달에서 수정 버튼 클릭 시 처리
			$('#modifyEventBtn').on('click', function() {
			 	// 일정상세 모달 닫기
			    $('#eventModal').modal('hide');
			    
			    // 현재 표시된 이벤트의 calNum 값 가져오기
			    var calNum = $('#eventDetails').find('.calNum').val(); // 예시에서는 .calNum이 해당 값을 가리키는 클래스로 가정합니다.
			
			    // 수정 모달에서 데이터를 동적으로 로드하기 위한 AJAX 요청
			    $.ajax({
			        url: '/gaent/calendar/modifyEvent',
			        method: 'get',
			        data: {
			            calNum: ${vo.calNum}
			        },
			        success: function(response) {
			            $('#modifyEventForm').html(response); // 수정 폼에 데이터 채우기
			            $('#modifyEventModal').modal('show'); // 수정 모달 표시
			        },
			        error: function(xhr, status, error) {
			            console.error('일정 상세 정보 가져오기 실패:', error);
			            // 실패 처리 로직 추가
			        }
			    });
			});
		</script>
	</c:forEach>
</body>
</html>