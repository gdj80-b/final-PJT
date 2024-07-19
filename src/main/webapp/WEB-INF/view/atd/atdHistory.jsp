<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>근태내역</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <style>
        .sunday {
             color: red;
        }
        .{
        .juchaBtn{
            padding:0px;
            margin:0px;
        }
        .juCha-underline{
            margin:0px;
        }
        .card.collapsed {
            height: auto;
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
    <div id="workspace-area" class="subsidebar-from-workspace ">
    <div class="" style="height: 50rem; max-height: 800px !important; overflow-y: auto !important; transition: height 0.5s ease;">
    <div>
        <div class="card">
            <h2 class="card-title" style="margin:50px 0px 0px 30px">근태내역</h2>
<%--             tgYear: ${c.tgYear}년 (원하는 연도 ) / tgMonth : ${c.tgMonth}월 (원하는 월 )/ tgDay: ${c.tgDay}일 (원하는 일 )/ tgYoil: ${c.tgYoil}요일 (해당일의 요일 )--%>
<%--     <br> tgWeek: ${c.tgWeek}번째주 (원하는 일이 달에 몇번째 주인지 )/ tgFullWeek : ${c.tgFullWeek}번째주 (원하는 일이 연에 몇번째 주인지 )/ 마지막일 tgLastDate: ${c.tgLastDate}일 (원하는 일의 달의 마지막일 )--%>
<%--     <br> preBlank: ${c.preBlank} / totalDiv: ${c.totalDiv} / afterBlank: ${c.afterBlank}      --%>
           
                <div class="card-body" style="height:; positions: relative;">                    
                    <div style="text-align:center">
                        <a href="/gaent/atd?year=${c.prevYear}&month=${c.prevMonth}">이전달</a>
                        ${c.tgYear}년 ${c.tgMonth}월
                        <a href="/gaent/atd?year=${c.nextYear}&month=${c.nextMonth}">다음달</a>
                    </div>
                    
                    <div  class="card-body" style="padding:0em 12em;">
                        <div style=" border:1px solid; ">  
                            <div style="display:flex;justify-content: center; ">
                                <div style="margin:0 1em; font-size:small;">금일 근무 시간</div>
                                <div style="margin:0 1em; font-size:small;">이번주 누적</div>
                                <div style="margin:0 1em 0 5em; font-size:small;">이번달 누적</div>
                            </div>
                            <div style="display:flex;justify-content: center; ">
                                <div>가</div>
                                <div>나</div>
                                <div>다</div>
                            </div>
                        </div>                        
                    </div>
                    
                    <c:set var="currentWeek" value="1"/>
                    <c:set var="previousWeek" value="1"/>
                
                    <c:forEach var="day" begin="1" end="${c.tgLastDate}">
                        <c:set var="dayOfWeekIndex" value="${(day + c.preBlank - 2) % 7}" /><!-- 요일 계산-->
                        <c:set var="week" value="${fn:substringBefore((day + c.preBlank - 2) / 7 + 1, '.')}주차"/><!-- 주차 계산 -->
                        <!-- 주가 변경되었는지 확인하고 테이블을 생성 -->
                        <c:if test="${currentWeek != week}">
                            <div>
                                <div>
                                    <table>
                                        <tr>
                                            <td><td>
                                        </tr>                                    
                                    </table>
                                </div>
                            </div>
                        </c:if>
                        <!-- 주가 변경되었으면, 주 버튼과 테이블 생성 -->
                        <c:if test="${currentWeek != week}">
                            <c:set var="currentWeek" value="${week}" />
                            <button class="btn juchaBtn" type="button" data-bs-toggle="collapse"  data-bs-target="#week${currentWeek}Collapse"
                                aria-expanded="false" aria-controls="week${currentWeek}Collapse">▼&nbsp;${currentWeek}</button>
                            <hr class="juCha-underline">
                            <div class="collapse" id="week${currentWeek}Collapse">
                                <div class="card card-body">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>날짜</th>
                                            <th>출근시간</th>
                                            <th>퇴근시간</th>
                                        </tr>
                        </c:if>
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${dayOfWeekIndex == 6}">
                                        <span class="sunday">Day ${day} (${c.dayOfWeek[dayOfWeekIndex]})</span>
                                    </c:when>
                                    <c:otherwise>
                                        Day ${day} (${c.dayOfWeek[dayOfWeekIndex]})
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <!-- 출근 시간을 출력 -->
                                <c:forEach var="vo" items="${list}">
                                    <c:if test="${vo.year == c.tgYear && vo.month == c.tgMonth && vo.day == day}">
                                        ${vo.inTime}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <!-- 퇴근 시간을 출력 -->
                                <c:forEach var="vo" items="${list}">
                                    <c:if test="${vo.year == c.tgYear && vo.month == c.tgMonth && vo.day == day}">
                                        ${vo.outTime}
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>
                        <c:if test="${day == c.tgLastDate}">
                            </table>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                    </div>
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
