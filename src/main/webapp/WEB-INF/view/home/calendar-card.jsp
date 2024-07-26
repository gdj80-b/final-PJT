<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/miniCal.css">
    <title>미니캘린더</title>
    <style>
      .calendar-card {
        width: 100%;
        height: 20rem;
      }
    </style>
  </head>
  <body>
    <div class="card calendar-card">
    <!-- 홈 화면 미니캘린더 시작 -->
    	<div class="calendar">
		<div class="header">
			<button id="prevBtn">
				<i class="fa-solid fa-chevron-left"></i>
			</button>
			<div class="monthYear" id="monthYear"></div>
			<button id="nextBtn">
				<i class="fa-solid fa-chevron-right"></i>
			</button>
		</div>
		<div class="days">
			<div class="day" id="sun">Sun</div>
			<div class="day">Mon</div>
			<div class="day">Tue</div>
			<div class="day">Wed</div>
			<div class="day">Thu</div>
			<div class="day">Fri</div>
			<div class="day" id="sat">Sat</div>
		</div>
		<div class="dates" id="dates"></div>
	</div>
	
	<script src="${pageContext.request.contextPath}/assets/js/miniCal.js"></script>
    <!-- 홈 화면 미니캘린더 끝 -->
    </div>
  </body>
</html>
