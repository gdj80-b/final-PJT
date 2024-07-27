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
        .todaynal{
            border:thick;
            color:purple;
        }
        .juchaBtn{
            margin:10px;
        }
        .juCha-underline{
            margin:0px;
        }
        .card.collapsed {
            height: auto;
        }
        
        .vacInfo{
            display: flex;
            flex-direction: column;
            align-items: center;
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
        <jsp:include page="/WEB-INF/view/attendance/atd-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace ">
    <div class="" style="height: 50rem; max-height: 800px !important; overflow-y: auto !important; transition: height 0.5s ease;">
    <div>
        <div class="card" style="height:auto; overflow:inherit; ">
            <h2 class="card-title" style="margin:50px 0px 0px 30px">근태내역</h2>
<%--             tgYear: ${c.tgYear}년 (원하는 연도 ) / tgMonth : ${c.tgMonth}월 (원하는 월 )/ tgDay: ${c.tgDay}일 (원하는 일 )/ tgYoil: ${c.tgYoil}요일 (해당일의 요일 )--%>
<%--     <br> tgWeek: ${c.tgWeek}번째주 (원하는 일이 달에 몇번째 주인지 )/ tgFullWeek : ${c.tgFullWeek}번째주 (원하는 일이 연에 몇번째 주인지 )/ 마지막일 tgLastDate: ${c.tgLastDate}일 (원하는 일의 달의 마지막일 )--%>
<%--     <br> preBlank: ${c.preBlank} / totalDiv: ${c.totalDiv} / afterBlank: ${c.afterBlank}      --%>

                    <div style="text-align: center">
                        <h4>
                            <a href="/gaent/atd?year=${c.prevYear}&month=${c.prevMonth}">◀</a> ${c.tgYear}년 ${c.tgMonth}월 <a href="/gaent/atd?year=${c.nextYear}&month=${c.nextMonth}">▶</a>
                        </h4>
                    </div>
                    <div class="vacInfo" style="padding: 0em 14em;">
                        <table class="table" style="border: 1px solid black;">
                            <tr>
                                <td>금일 근무 시간</td>
                                <td>이번주 누적</td>
                                <td>이번달 누적</td>
                            </tr>
                            <tr>
                                <td><span id="daily"></span></td>
                                <td><span id="weekly"></span></td>
                                <td><span id="monthly"></span></td>
                            </tr>
                        </table>

                    </div>



                    <div class="card-body" style="height:; positions: relative;">                    
                    

                    
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
                        <c:if test="${currentWeek != week && week != '0주차'}">
                            <c:set var="currentWeek" value="${week}" />
                            <button class="juchaBtn btn" type="button" data-bs-toggle="collapse" data-bs-target="#week${currentWeek}Collapse" 
                                    id="${currentWeek}colBtn" aria-expanded="false" aria-controls="week${currentWeek}Collapse" style="padding:0px;">
                                 <span style="font-size:18px;">▼&nbsp;${currentWeek}</span>
                                 </button>
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
                        <!-- 오늘날짜 스타일처리 -->
                        <c:set var="todayDate" value="${day == c.today &&c.tgMonth == c.todayMonth && c.tgYear == c.todayYear ? 'today' : ''}" />                        
                        
                        <tr <c:if test="${todayDate == 'today'}"> style="background-color:rgba(105, 108, 255, 0.3); " </c:if>>
                            <td>
                                <c:choose>
                                    <c:when test="${todayDate == 'today'}">
                                        <span class="todaynal"  >Day ${day} (${c.dayOfWeek[dayOfWeekIndex]})</span>
                                    </c:when>
                                    <c:when test="${dayOfWeekIndex == 6}">
                                        <span class="sunday">Day ${day} (${c.dayOfWeek[dayOfWeekIndex]})</span>
                                    </c:when>
                                    <c:when test="${  week != '0주차' }">
                                        Day ${day} (${c.dayOfWeek[dayOfWeekIndex]})
                                    </c:when>
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
               
        atdStatus();
        
        if( ${ c.tgMonth == c.todayMonth && c.tgYear == c.todayYear} ){

         $("#${c.todayWeek}주차colBtn").click();
        
        }
         
        
    });
    
    function atdStatus(){
        $.ajax({
            url: "/gaent/atd/atdStatus", // 데이터를 가져올 URL
            type: "POST", // GET 메서드를 사용
            dataType: "json", 
            success: function(data) {
                $("#daily").text(data.dailyWorkTime);
                $("#weekly").text(data.weeklyWorkTime);
                $("#monthly").text(data.montlyWorkTime);
               
            },
            error: function() { 
                console.error("에러 발생"); // 에러 메시지 출력
                alert("근무시간 조회중 에러가 발생했습니다."); // 에러 메시지 출력
            }
        }); 
    }

</script>
</body>
</html>
