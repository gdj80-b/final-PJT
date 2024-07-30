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
        .yoilDay{
        
        width:10rem;
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
                <div class="card" style="height: auto; overflow: inherit;">
                    <h2 class="card-title" style="margin: 30px 0px 0px 30px">근태내역</h2>

                    <div style="text-align: center">
                        <h4>
<%--                             <a href="/gaent/atd/team/atd?year=${c.prevYear}&month=${c.prevMonth}">◀</a>  --%>
                            <a href="/gaent/atd/team/atd?week=${c.tgFullWeek-1}">◀</a> 
                                   ${c.tgYear}년 ${c.tgFullWeek}번째 주
<%--                             <a href="/gaent/atd/team/atd?year=${c.nextYear}&month=${c.nextMonth}">▶</a> --%>
                            <a href="/gaent/atd/team/atd?week=${c.tgFullWeek+1}">▶</a>
                        </h4>
                    </div>
                    <div class="justify-content-center ">
                        <table border="1" class="table" style="text-align: center; margin: 0 auto; border-radius: 30px; width: auto;">
                            <tr>
                                <td class="w-25 justify-content-end">출근</td>
                                <td class="w-25 justify-content-end">지각</td>
                                <td class="w-25 justify-content-end">조퇴</td>
                                <td class="w-25 justify-content-end">결근</td>
                            </tr>
                            <tr>
                                <td> <span class="pe-3" id="attendanceCount"></span> </td>
                                <td> <span class="pe-3" id="lateCount"></span></td>
                                <td><span class="pe-3" id="earlyLeaveCount"></span> </td>
                                <td> <span class="pe-3" id="absenceCount"></span> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="d-flex align-items-center justify-content-center pe-5">
                        <div class="" style="align-items: center; text-align:center">
                            <table class="table w-100">
                                <tr>
                                    <th>이름</th>
                                            <th class="yoilDay" >월 </th>
                                            <th class="yoilDay">화 </th>
                                            <th class="yoilDay">수 </th>
                                            <th class="yoilDay">목 </th>
                                            <th class="yoilDay">금</th> 
                                            
                                </tr>
                                
                                <c:set var="name" value="a"></c:set>
                                
                                
                                <c:forEach var="m" items="${list}">
                                    <c:if test="${name = 'a' || name != m.empName }">
                                     <tr>
                                        <td>${m.empName}</td>
                                    </c:if>
                                        <c:set var="name" value="${m.empName}"></c:set>
                                    <c:choose>
                                        <c:when test="${m.yoil == '1' }">
                                            <td>${m.atdStatus}<br> ${m.inTime} <br> ${m.outTime}<br>${m.atdDate}</td>
                                        </c:when>
                                        <c:when test="${m.yoil == '2' }">
                                            <td>${m.atdStatus}<br> ${m.inTime} <br> ${m.outTime}<br>${m.atdDate}</td>
                                        </c:when>
                                        <c:when test="${m.yoil == '3' }">
                                            <td>${m.atdStatus}<br> ${m.inTime} <br> ${m.outTime}<br>${m.atdDate}</td>
                                        </c:when>
                                        <c:when test="${m.yoil == '4' }">
                                            <td>${m.atdStatus}<br> ${m.inTime} <br> ${m.outTime}<br>${m.atdDate}</td>
                                        </c:when>
                                        <c:when test="${m.yoil == '5' }">
                                            <td>${m.atdStatus}<br> ${m.inTime} <br> ${m.outTime}<br>${m.atdDate}</td>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
    atdTeamStatusCnt();
});


function  atdTeamStatusCnt(){
    $.ajax({
        url: "/gaent/atd/team/atdTeamStatus", // 데이터를 가져올 URL
        type: "POST", // GET 메서드를 사용
        data: {"week" : ${c.tgFullWeek} },
        dataType: "json", 
        success: function(data) {
            $("#absenceCount").text("결근: " + data.absenceCount + "명");
            $("#lateCount").text("지각: " +data.lateCount+ "명");
            $("#earlyLeaveCount").text("조퇴: " +data.earlyLeaveCount+ "명");
            $("#attendanceCount").text("출근: " +data.attendanceCount+ "명"); 
        },
        error: function() { 
            alert("상태확인레어"); // 에러 메시지 출력
        }
    });
}


</script>
</body>
</html>
