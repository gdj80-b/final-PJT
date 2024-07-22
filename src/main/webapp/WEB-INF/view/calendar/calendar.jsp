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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
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
  
  
</style>
</head>
<body>
	<!-- 헤더 -->
	<div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    
<div id="workspace-area" class="subsidebar-from-workspace">
	<!-- calendar 태그 -->
    <div id='calendar'></div>
  
  <!-- 부트스트랩 modal 부분 시작 -->
    <!-- 일정 상세 모달 -->
  <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="eventModalTitle">일정 상세</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div id="eventDetails">
            <!-- 여기에 일정 상세 정보를 동적으로 채웁니다. -->
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 일정클릭 후 일정등록 폼 모달 -->
<div class="modal fade" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="addEventModalTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addEventModalTitle">일정 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/gaent/calendar/addEvent" method="post" id="addEventForm">
      <div class="modal-body">
		<!-- 작성자 --> 
		<input type="hidden" name="calWriter" value="">
	    일정타입 : <select name="calType">
					    <option value="public">개인(공개)</option>
					    <option value="private">개인(제한)</option>
					    <option value="tpublic">팀(공개)</option>
					    <option value="tprivate">팀(제한)</option>
					    <option value="corp">전사(전체)</option>
					    <option value="artist">아티스트(전체)</option>
					</select>
					<br />
	    제목 : <input type="text" name="calTitle" /><br />
        내용 : <input type="text" name="calContent" /><br />
        시작시간 : <input type="datetime-local" name="calStartDate" /> <br />
        종료시간 : <input type="datetime-local" name="calEndDate" /><br />
        일정분류 : <select name="calTargetType">
					    <option value="emp">개인</option>
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
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="saveEventBtn">등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
      </form>
    </div>
  </div>
</div>
    <!-- 부트스트랩 modal 부분 끝 -->
    </div>
</body>
<script>
	//calendar element 취득
    var calendarEl = document.getElementById('calendar');
    var request = $.ajax({
      url: "/gaent/calendar/event",
      method: "get",
    });
    request.done(function(data){
	  // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
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
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
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
            
            $('#saveEventBtn').on('click', function() {
                
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
                method: 'GET',
                data: {
                  calNum: info.event.id
                },
                success: function(response) {
                  $('#eventDetails').html(response);
                  $('#eventModal').modal('show');
                }
              });
        }
      });
      calendar.render();		
    });
  </script>
</html>