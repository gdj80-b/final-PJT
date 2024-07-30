<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>캘린더 - GAEnt.</title>
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <!-- Bootstrap 스크립트 추가 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
  
  <style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 12px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    
    padding-left: 1em;
    padding-right: 1em;
  }
  
  
  .fc-view-harness {
  	background-color: #ffffff;
  }
  
  /* 추가한 calendar 크기 조정 스타일 */
	#calendar {
	    max-height: 600px;
	    margin: 0 auto;
	}
    
  /* 요일 헤더 색상 변경 */
  .fc-col-header-cell {
    background-color: #9b9dfa; /* 배경색 변경 */
    color: #fff; /* 텍스트 색상 */
  }
</style>
</head>
<body>
	<!-- 헤더 -->
	<div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/calendar/cal-sub-sidebar.jsp"></jsp:include>
      </div>
    
<div id="workspace-area" class="subsidebar-from-workspace">
	<!-- calendar 태그 -->
    <div id='calendar'></div>
  
  <!-- 부트스트랩 modal 부분 시작 -->
    <!-- 일정 상세 모달 -->
    <div class="modal fade" id="eventModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="eventModalTitle">일정상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div id="eventDetails">
            		<!-- 여기에 일정 상세 정보를 동적으로 채웁니다. -->
          		</div>
              </div>
              <div class="modal-footer">
              	<button type="button" class="btn btn-primary" id="modifyEventBtn">수정</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
  
  <!-- 일정클릭 후 일정등록 폼 모달 -->
  <div class="modal fade" id="addEventModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addEventModalTitle">일정등록</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="/gaent/calendar/addEvent" method="post" id="addEventForm">
		      <div class="modal-body">
				<!-- 작성자 --> 
			    <div class="card mb-4">
			      <div class="card-body">
			      	<div class="mb-3">
			          <input type="hidden" name="calWriter" value="${loginInfo.empCode}">
			          <label for="calType" class="form-label">일정타입</label>
			          <select name="calType" id="calType" class="form-select">
			          	<c:forEach var="event" items="${eventType}">
			            	<option value="${event.calType}">${event.calTypeName}</option>
					    </c:forEach>
			          </select>
			        </div>
			        <div class="mb-3">
			          <label for="calTitle" class="form-label">제목</label>
			          <input name="calTitle" id="calTitle" class="form-control" type="text" placeholder="제목을 입력해주세요." required="required">
			        </div>
			        <div class="mb-3">
			          <label for="calContent" class="form-label">내용</label>
			          <input name="calContent" id="calContent" class="form-control" type="text" placeholder="내용을 입력해주세요." required="required">
			        </div>
			        <div class="mb-3">
			          <label for="calStartDate" class="form-label">시작시간</label>
			          <input name="calStartDate" class="form-control" type="datetime-local" id="calStartDate" required="required">
			        </div>
			        <div class="mb-3">
			          <label for="calEndDate" class="form-label">종료시간</label>
			          <input name="calEndDate" class="form-control" type="datetime-local" id="calEndDate" required="required">
			        </div>
					<div class="mb-3">
			          <label for="calTargetType" class="form-label">일정분류</label>
			          <select name="calTargetType" id="calTargetType" class="form-select">
			            <option value="${loginInfo.empCode}">개인</option>
			            <c:forEach var="target" items="${eventTarget}">
					    	<option value="${target.teamCode}">${target.teamName}</option>
					    </c:forEach>
			          </select>
			      </div>
			    </div>
			  </div>
		    </div>
          <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" id="saveEventBtn">등록</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	      </form>
        </div>
      </div>
    </div>
        
        <!-- 수정 모달 -->
<div class="modal fade" id="modifyEventModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modifyEventModalTitle">일정수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="modifyEventForm">
                    <!-- 일정 수정을 위한 폼이 여기에 들어갑니다. -->
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- 부트스트랩 modal 부분 끝 -->
    </div>
</body>
<script>
	//JSP에서 서버측 변수를 JavaScript 변수로 전달
	var empCode = '${loginInfo.empCode}';
	var teamCode = '${loginInfo.teamCode}'; // teamCode를 적절히 설정해주세요

	//calendar element 취득
    var calendarEl = document.getElementById('calendar');
    var request = $.ajax({
      url: "/gaent/calendar/event",
      method: "get",
      data: {
          empCode: empCode, // JSP에서 전달받은 empCode를 추가
          teamCode: teamCode // JSP에서 전달받은 teamCode를 추가
      }
    });
    request.done(function(data){
	  // full-calendar 생성하기
      window.calendar = new FullCalendar.Calendar(calendarEl, {
   	    height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        customButtons:{
        	addEventButton:{
        		text:"일정등록",
        		click : function(){
        			window.location.href = '/gaent/calendar/addEvent';
        		}
        	}
        },
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today addEventButton',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        fixedWeekCount: false,
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
          },
          eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
          },
          eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
            console.log(obj);
          },
          
          select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
            
            $('#addEventModal').modal('show');
          
         	// 클릭한 이벤트의 시작 날짜와 시간을 가져온다.
            var eventStartDate = arg.start;

            // 현재 시간을 가져온다.
            var currentDate = new Date();

            // 현재 시간에서 9시간 전의 시간을 구한다.
            var adjustedStartDate = new Date(currentDate.getTime() + (9 * 60 * 60 * 1000));

            // 시작일 입력 필드에 클릭한 이벤트의 날짜를 설정한다.
            adjustedStartDate.setDate(eventStartDate.getDate() + 1);
            adjustedStartDate.setMonth(eventStartDate.getMonth());
            adjustedStartDate.setFullYear(eventStartDate.getFullYear());

            // 날짜를 ISO 문자열로 변환하고 필요한 포맷(년-월-일 시간:분)으로 자른다.
            var formattedStartDate = adjustedStartDate.toISOString().slice(0, 16);

            // 입력 필드에 설정한다.
            $('input[name="calStartDate"]').val(formattedStartDate);
            
            $('#saveEventBtn').on('click', function() {
                
             	// 폼 제출을 방지
                event.preventDefault();
             
             	// 입력 값 가져오기
                var title = $('input[name="calTitle"]').val().trim();
                var content = $('input[name="calContent"]').val().trim();
                var startDate = $('input[name="calStartDate"]').val().trim();
                var endDate = $('input[name="calEndDate"]').val().trim();
                
             	// Validation logic 추가
                if (title === '') {
                    alert('제목이 입력되지 않았습니다.');
                    return;
                }

                if (content === '') {
                    alert('내용이 입력되지 않았습니다.');
                    return;
                }
                
                if (endDate === '') {
                    alert('일정 종료일이 입력되지 않았습니다.');
                    return;
                }
                
                var startDateTime = new Date(startDate);
                var endDateTime = new Date(endDate);
                
                // 일정비교
                if (endDateTime <= startDateTime) {
                    alert('일정 종료일은 시작일 이후여야 합니다');
                    return false;
                }
                
                
                var eventObj = {
                        calWriter: $('input[name="calWriter"]:checked').val(), // 작성자 정보는 직접 설정하거나 다른 방식으로 가져올 수 있음
                        calType: $('input[name="calType"]:checked').val(),
                        calTitle: $('input[name="calTitle"]').val(),
                        calContent: $('input[name="calContent"]').val(),
                        calStartDate: $('input[name="calStartDate"]').val(),
                        calEndDate: $('input[name="calEndDate"]').val(),
                        calTargetType: $('input[name="calTargetType"]:checked').val()
                    };

                    // 서버로 데이터 전송
                    $.ajax({
                        url: '/gaent/calendar/addEvent',
                        method: 'post',
                        contentType: 'application/json',
                        data: JSON.stringify(eventObj),
                        success: function(response) {
                            console.log('일정 추가 성공:', response);
                            // 성공 처리 로직
                        },
                        error: function(xhr, status, error) {
                            console.error('일정 추가 실패:', error);
                            // 실패 처리 로직
                        }
                    });
                
            // 폼 초기화 및 모달 닫기
            $('#addEventModal').modal('hide');

            // 캘린더 선택 해제
            calendar.unselect();
            
            });
          },
          
          // 이벤트 
        events: data,
          // 클릭한 이벤트의 URL로 이동
        eventClick: function(info) {

            $.ajax({
                url: '/gaent/calendar/eventOne',
                method: 'get',
                data: {
                  calNum: info.event.id
                },
                success: function(response) {
                  $('#eventDetails').html(response);
                  $('#eventModal').modal('show');
                }
              });
            
         // 이벤트 상세 모달에서 수정 버튼 클릭 시 처리
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
                        calNum: info.event.id
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
        }
      });
      calendar.render();		
    });
  </script>
</html>