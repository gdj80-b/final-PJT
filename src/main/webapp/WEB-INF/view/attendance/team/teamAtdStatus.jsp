<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>부서근태내역</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <style>
        .yoilDay{
        
        width:11rem;
        }
       
       .ckIn{
        color: 	#4169E1 ;
       }
       
       .ckOut{
        color:#FF69B4;
       }
        
    </style>
</head>
<body>
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/attendance/team/team-atd-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace ">
        <div class="" style="height: 50rem; max-height: 800px !important; overflow-y: auto !important; transition: height 0.5s ease;">
            <div>

                <h2 class="card-title mt-2 ms-2">부서근태현황</h2>
                <div class="card p-3" style="height: auto; overflow: inherit;">
                    <div style="text-align: center">
                        <h4>
                            <a href="/gaent/team/atd?teamCode=${t}&week=${c.fullWeek-1}">◀</a> 
                                ${c.year}년 ${c.fullWeek}번째 주 
                            <a onclick="nextBtn()">▶</a>
                        </h4>
                    </div>
                    <div class="justify-content-center ">
                        <table border="1" class="table w-75" style="text-align: center; margin: 0 auto; border-radius: 30px; width: auto;">
                            <tr>
                                <td class="w-25 justify-content-end">출근</td>
                                <td class="w-25 justify-content-end">지각</td>
                                <td class="w-25 justify-content-end">조퇴</td>
                                <td class="w-25 justify-content-end">결근</td>
                            </tr>
                            <tr>
                                <td><span class="pe-3" id="attendanceCount"></span></td>
                                <td><span class="pe-3" id="lateCount"></span></td>
                                <td><span class="pe-3" id="earlyLeaveCount"></span></td>
                                <td><span class="pe-3" id="absenceCount"></span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="card mt-4 pt-2" style="height: auto; overflow: inherit;"> 
                    <div class="d-flex align-items-center justify-content-center pe-2">
                        <div class="" style="align-items: center; text-align:center">
                            <table class="table w-100">
                                <tr>
                                    <th>이름</th>
                                    <th class="yoilDay">월<br><span>${list[0].atdDate}</span></th>
                                    <th class="yoilDay">화<br><span>${list[1].atdDate}</span></th>
                                    <th class="yoilDay">수<br><span>${list[2].atdDate}</span></th>
                                    <th class="yoilDay">목<br><span>${list[3].atdDate}</span></th>
                                    <th class="yoilDay">금<br><span>${list[4].atdDate}</span></th> 
                                </tr>
                                
                                <c:set var="name" value="a"></c:set>
                                <c:set var="badge" value=""></c:set>
                                
                                
                                <c:forEach var="m" items="${list}">
                                     <c:choose>
                                        <c:when test="${m.atdStatus == '출근'}">
                                            <c:set var="badge" value='<span class="badge bg-label-success fs-6">출근</span>' />
                                        </c:when>
                                        <c:when test="${m.atdStatus == '지각'}">
                                            <c:set var="badge" value='<span class="badge bg-label-info fs-6">지각</span>' />
                                        </c:when>
                                        <c:when test="${m.atdStatus == '조퇴'}">
                                            <c:set var="badge" value='<span class="badge bg-label-warning fs-6">조퇴</span>' />
                                        </c:when>
                                        <c:when test="${m.atdStatus == '결근'}">
                                            <c:set var="badge" value='<span class="badge bg-label-danger fs-6">결근</span>' />
                                        </c:when>
                                    </c:choose>
                                
                                
                                
                                    <c:if test="${name = 'a' || name != m.empName }">
                                     <tr>
                                        <td>${m.empName}</td>
                                    </c:if>
                                        <c:set var="name" value="${m.empName}" />
                                        
                                        
                                    <c:choose>
                                        <c:when test="${m.yoil == '1' }">
                                            <td>${badge}<br><span class="ckIn"> ${m.inTime} </span> <br><span class="ckOut"> ${m.outTime}</span> </td>
                                        </c:when>
                                        <c:when test="${m.yoil == '2' }">
                                            <td>${badge}<br><span class="ckIn"> ${m.inTime} </span> <br><span class="ckOut"> ${m.outTime}</span> </td>
                                        </c:when>
                                        <c:when test="${m.yoil == '3' }">
                                            <td>${badge}<br><span class="ckIn"> ${m.inTime} </span> <br><span class="ckOut"> ${m.outTime}</span> </td>
                                        </c:when>
                                        <c:when test="${m.yoil == '4' }">
                                            <td>${badge}<br><span class="ckIn"> ${m.inTime} </span> <br><span class="ckOut"> ${m.outTime}</span> </td>
                                        </c:when>
                                        <c:when test="${m.yoil == '5' }">
                                            <td>${badge}<br><span class="ckIn"> ${m.inTime} </span> <br><span class="ckOut"> ${m.outTime}</span> </td>
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
<script>
$(document).ready(function() {
    atdTeamStatusCnt();
});


function  atdTeamStatusCnt(){
    $.ajax({
        url: "/gaent/team/atdTeamStatus", // 데이터를 가져올 URL
        type: "POST", // GET 메서드를 사용
        data: {"week" : ${c.fullWeek},
				"year" : ${c.year}
        } ,
        dataType: "json", 
        success: function(data) {
            $("#absenceCount").text("결근: " + data.absenceCount + "회");
            $("#lateCount").text("지각: " +data.lateCount+ "회");
            $("#earlyLeaveCount").text("조퇴: " +data.earlyLeaveCount+ "회");
            $("#attendanceCount").text("출근: " +data.attendanceCount+ "회"); 
        },
        error: function() { 
            alert("상태확인레어"); // 에러 메시지 출력
        }
    });
}


function nextBtn(){
	console.log(${c.fullWeek} + '&' + ${c.nowWeek});
	
	if(${c.nowWeek == c.fullWeek}){
    	alert('데이터가 없습니다');
	}else{
   	 	window.location.href ="/gaent/team/atd?teamCode=${t}&week=${c.fullWeek+1}";
	}
    
}

</script>
</body>
</html>
