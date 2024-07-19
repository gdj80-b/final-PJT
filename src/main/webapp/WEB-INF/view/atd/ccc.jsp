<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <style>
        .sunday {
             color: red;
        }
        .inbox-container {
            width: 100%;
            margin: 0 auto;
            margin-top: 20px;
        }
        .{
        .jucha
          padding:0px;
          marggin:0px;
        }
        .juCha-underline{
            margin:0px;
        }
    </style>
</head>
<body>
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/atd/atd-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="card">
            <h2 class="card-title" style="margin:50px 0px 0px 30px">근태내역</h2>       
<%--             tgYear: ${c.tgYear}년 (원하는 연도 ) / tgMonth : ${c.tgMonth}월 (원하는 월 )/ tgDay: ${c.tgDay}일 (원하는 일 )/ tgYoil: ${c.tgYoil}요일 (해당일의 요일 )--%>
<%--     <br> tgWeek: ${c.tgWeek}번째주 (원하는 일이 달에 몇번째 주인지 )/ tgFullWeek : ${c.tgFullWeek}번째주 (원하는 일이 연에 몇번째 주인지 )/ 마지막일 tgLastDate: ${c.tgLastDate}일 (원하는 일의 달의 마지막일 )--%>
<%--     <br> preBlank: ${c.preBlank} / totalDiv: ${c.totalDiv} / afterBlank: ${c.afterBlank}      --%>
            <div class="card-body inbox-container">
                <div class="care-body" style="height:600px; position: relative;">
                    <div>
                        <a href="/gaent/atd/atdCalendar?year=${c.prevYear}&month=${c.prevMonth}">이전달</a>
                        ${c.tgYear}년 ${c.tgMonth}월
                        <a href="/gaent/atd/atdCalendar?year=${c.nextYear}&month=${c.nextMonth}">다음달</a>
                    </div>
                    <a href="/test/login/">메인페이지</a>
                    <c:set var="currentWeek" value="1"/>
                    <c:set var="previousWeek" value="1"/>
                
                    <c:forEach var="day" begin="1" end="${c.tgLastDate}">
                        <c:set var="dayOfWeekIndex" value="${(day + c.preBlank - 2) % 7}" />
                        <c:set var="week" value="${fn:substringBefore((day + c.preBlank - 2) / 7 + 1, '.')}주차"/>
                    
                    </c:forEach>
                    
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            
        });
    </script>
</body>
</html>
