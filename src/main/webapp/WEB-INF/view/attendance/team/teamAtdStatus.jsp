<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>부서근태현황 - GAEnt.</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/attendance.css" />
    </head>
    <body>
        <div class="">
            <div id="header-area">
                <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
            </div>
            <div id="sidebar_area">
                <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
                <jsp:include page="/WEB-INF/view/attendance/team/team-atd-sub-sidebar.jsp"></jsp:include>
            </div>
            <div id="workspace-area" class="subsidebar-from-workspace">
                <div>
                    <h2 class="card-title fw-bold mt-2 ms-2">부서근태현황</h2>
                    <div class="card p-3">
                        <div class="text-center">
                            <h4>
                                <a href="/gaent/team/atd?teamCode=${c.teamCode}&year=${c.year}&week=${c.fullWeek-1}">◀</a> 
                                ${c.year}년 ${c.fullWeek}번째 주 
                                <a href="/gaent/team/atd?teamCode=${c.teamCode}&year=${c.year}&week=${c.fullWeek+1}">▶</a>
                            </h4>
                        </div>
                        <div class="d-flex justify-content-center">
                            <table border="1" class="table w-75">
                                <tr>
                                    <td><span class="pe-3" id="attendanceCount"></span></td>
                                    <td><span class="pe-3" id="lateCount"></span></td>
                                    <td><span class="pe-3" id="earlyLeaveCount"></span></td>
                                    <td><span class="pe-3" id="absenceCount"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class=" nav-align-top nav-tabs-shadow mt-3"> 
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-home" aria-controls="navs-top-home" aria-selected="true">부서근태현황</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">차트</button>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-top-home" role="tabpanel">
                                <div class="d-flex align-items-center justify-content-center pe-2">
                                    <div class="text-center">
                                        <table class="table w-100">
                                            <tr>
                                                <th>이름  </th>
                                                <th class="yoilDay">월<br><span>${c.date1}</span></th>
                                                <th class="yoilDay">화<br><span>${c.date2}</span></th>
                                                <th class="yoilDay">수<br><span>${c.date3}</span></th>
                                                <th class="yoilDay">목<br><span>${c.date4}</span></th>
                                                <th class="yoilDay">금<br><span>${c.date5}</span></th> 
                                            </tr>
                                            <c:if test="${empty list}">
                                                <tr>
                                                    <td colspan="6" style="text-align: center; height:10rem;">데이터가 없습니다</td>
                                                </tr>
                                            </c:if>
                                            <c:set var="name" value="a"/>
                                            <c:set var="badge" value=""/>
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
                                                        <td>${m.empName}<br>${m.empRank}</td>
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
                            <div class="tab-pane fade" id="navs-top-profile" role="tabpanel"> 
                                <div class="d-flex justify-content-center">
                                    <canvas id="myChartPie" style="max-width:25rem"></canvas>
                                </div>
                                <br>
                                <div>
                                    <div class="d-flex">
                                        <div class="d-flex justify-content-center w-50">
                                            <canvas id="chart0" style="max-width: 20rem"></canvas>
                                        </div>
                                        <div class="d-flex justify-content-center w-50">
                                            <canvas id="chart1" style="max-width: 20rem"></canvas>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <div class="d-flex justify-content-center w-50">
                                            <canvas id="chart2" style="max-width: 20rem"></canvas>
                                        </div>
                                        <div class="d-flex justify-content-center w-50">
                                            <canvas id="chart3" style="max-width: 20rem"></canvas>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <div class="d-flex justify-content-center w-50">
                                            <canvas id="chart4" style="max-width: 20rem"></canvas>
                                        </div>
                                        <div class="d-flex justify-content-center w-50">
                                            <canvas id="chart5" style="max-width: 20rem"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script>
            const attendanceCount = 'rgba(147, 112, 219, 0.6)';
            const absenceCount = 'rgba(220, 20, 80, 0.8)';
            const earlyLeaveCount = 'rgba(255, 105, 180, 0.6)';
            const lateCount = 'rgba(255, 69, 0, 0.3)';
            const barColors = [lateCount, earlyLeaveCount, absenceCount, attendanceCount];
            const circleColors = [attendanceCount, absenceCount, earlyLeaveCount, lateCount];

            $(document).ready(function() {
                const xValues = [];
                atdTeamStatusCnt(xValues, circleColors); // xValues, yValues를 매개변수로 전달
                atdPersonalStatusCnt();
            });

            function atdTeamStatusCnt(xValues,circleColors) {
                $.ajax({
                    url: "/gaent/team/atdTeamStatus", // 데이터를 가져올 URL
                    type: "POST", // POST 메서드를 사용
                    data: {
                        "teamCode": ${c.teamCode},
                        "week": ${c.fullWeek},
                        "year": ${c.year}
                    },
                    dataType: "json",
                    success: function(data) {
                        $("#absenceCount").text("결근: " + data.absenceCount + "회");
                        $("#lateCount").text("지각: " + data.lateCount + "회");
                        $("#earlyLeaveCount").text("조퇴: " + data.earlyLeaveCount + "회");
                        $("#attendanceCount").text("출근: " + data.attendanceCount + "회");

                        // 데이터 추가
                        xValues.push(data.attendanceCount - data.earlyLeaveCount - data.lateCount);
                        xValues.push(data.absenceCount);
                        xValues.push(data.earlyLeaveCount);
                        xValues.push(data.lateCount);

                        // 차트 초기화
                        new Chart("myChartPie", {
                            type: "pie",
                            data: {
                                labels: ["정상근무", "결근", "조퇴", "지각"], // xValues를 사용할 필요 없음
                                datasets: [{
                                    backgroundColor: circleColors,
                                    data: xValues
                                }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: "팀 전체 근태 현황"
                                }
                            }
                        });
                    },
                    error: function() {
                        alert("상태 확인 에러"); // 에러 메시지 출력
                    }
                });
            }

            function atdPersonalStatusCnt() {
                $.ajax({
                    url: "/gaent/team/atdPersonalStatus",
                    type: "POST",
                    data: {
                        "teamCode": ${c.teamCode},
                        "week": ${c.fullWeek},
                        "year": ${c.year}
                    },
                    dataType: "json",
                    success: function(data) {
                        $("#teamStatus").empty(); // Clear previous charts
                        data.forEach(function(item, index) {
                            const canvasId = 'chart' + index;
                            console.log(canvasId);
                            // Create a canvas element for each chart
                            $('#teamStatus').append(`<canvas id="${canvasId}" width="" height=""></canvas>`);
                            // Prepare data for the chart
                            const chartData = {
                                labels: [ "결근", "조퇴", "지각" , "정상근무"],
                                datasets: [{
                                    label: '',
                                    backgroundColor: barColors,
                                    data: [
                                        item.absenceCount, // 결근
                                        item.earlyLeaveCount, // 조퇴
                                        item.lateCount, // 지각
                                        item.attendanceCount - item.earlyLeaveCount - item.lateCount // 정상근무
                                    ]
                                }]
                            };
                            
                            // Create a new chart
                            new Chart(canvasId, {
                                type: "horizontalBar",
                                data: chartData,
                                options: {
                                    title: {
                                        display: true,
                                        text: '개인 출근 상태 (' + item.empName + ')',
                                    },
                                    scales: {
                                        xAxes: [{
                                            ticks: {
                                                beginAtZero: true,
                                                stepSize: 1,
                                                min: 0, // 가로축의 최소값
                                                max: 5  // 가로축의 최대값
                                            }
                                        }],
                                        yAxes: [{
                                            ticks: {
                                                beginAtZero: true
                                            }
                                        }]
                                    },
                                    legend: {display: false}
                                }
                            });
                        });
                    },
                    error: function() {
                        alert("상태 확인 에러");
                    }
                });
            }
        </script>
    </body>
</html>
