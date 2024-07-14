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
        .inbox-container {
            width: 100%;
            margin: 0 auto;
            margin-top: 20px;
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
<%--             tgYear: ${c.tgYear}년 / tgMonth : ${c.tgMonth}월 / tgDay: ${c.tgDay}일 / tgYoil: ${c.tgYoil}요일 --%>
<%--     <br> tgWeek: ${c.tgWeek}번째주 / tgFullWeek : ${c.tgFullWeek}번째주 / 마지막일 tgLastDate: ${c.tgLastDate}일 --%>
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
                        
                        <c:if test="${currentWeek != week}">
                            <div>
                                <div>
                                    <table>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                
                        <c:if test="${currentWeek != week}">
                            <c:set var="currentWeek" value="${week}" />
                            <button class="btn btn-secondary mb-2" type="button" data-bs-toggle="collapse"  data-bs-target="#week${currentWeek}Collapse"
                                aria-expanded="false" aria-controls="week${currentWeek}Collapse">${currentWeek}</button>
                            <br>
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
                                <c:forEach var="vo" items="${list}">
                                    <c:if test="${vo.year == c.tgYear && vo.month == c.tgMonth && vo.day == day}">
                                        ${vo.inTime}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            
        });
    </script>
</body>
</html>
