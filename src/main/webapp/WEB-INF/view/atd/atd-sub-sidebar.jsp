<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<style>
    .atd-regi {
/*         display: flex; */
/*         justify-content: center; */
/*         align-items: center; */
/*         height: 60vh; */
/*         width: 40vw; */
/*         background-color: #f0f0f0; */
        height: 400px;
/*         margin: 0; */
    }
    .card-container-atd {
        width: 255px;
        color:black;
        
    }
    .card-atd {
/*         background-color: #FBF8A7;   */
        border-radius: 5px;
/*         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); */
    }
    .atd-setting-letter {
        font-size:26px;
        margin: 10px 0px 5px 5px;
        font-weight: 400;
    }
    
    .card-text {
        font-size: 14px;
    }
    .atd-year-month {
       margin: 8px 1px 6px 4px; 
    }
    
    .time-display {
        margin: 8px 1px 6px 4px; 
        font-size: 35px;
        font-weight: bold;
        color: purple;
    }
    .details {
/*         margin-top: 40px; */
        margin-top: 20px;
        text-align: left;
    }
    .details div {
        display: flex;
        justify-content: space-between;
/*         margin: 10px 5px; */
        margin: 5px 2px;
        font-size:12px;
    }
    .btn-container {
        display: flex;
        justify-content: space-around;
    }
    .atd-time-gray {
       color:black;
    }
</style>
<body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
        <div class="menu-inner-shadow"></div>
        <div style="width:200px;">
<%--              <jsp:include page="/WEB-INF/view/atd/atd-Regi.jsp"></jsp:include> --%>
            <div class="card-container-atd">
                <div class="card card-atd">
                    <div class="card-body">
                        <div class="atd-setting-letter">근태관리</div>
                        <div id="date" class="card-text atd-year-month"></div>
                        <div id="time" class="card-text time-display"></div>                        
                          <div class="details">
                              <div>
                                  <span>출근시간</span>              
                                  <span id="checkInTime" class="atd-time-gray"></span>
                              </div>
                              <div>
                                  <span>퇴근시간</span>              
                                  <span id="checkOutTime" class="atd-time-gray"></span>
                              </div>
                              <div>
                                  <span>주간 누적 근무시간</span>              
                                  <span id="weeklyWorkTime" class="atd-time-gray"></span>
                              </div>
                          </div>
                    </div> 
                    <div class="btn-container">
                      <button id="checkInBtn" class="btn btn-outline-primary btn-sm">출근하기</button>
                      <button id="checkOutBtn" class="btn btn-outline-danger btn-sm">퇴근하기</button>
                    </div><br>
                </div>
            </div>
        </div>
        <ul class="menu-inner py-3">
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'atdHistory')}">active</c:if>">
                <a href="/gaent/atd/atdHistory" class="menu-link"> 
                    <span>근태관리</span>
                </a>
            </li>
        </ul>
    </aside>
    
    <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmationModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    현재시간은 '<span id="currentTime"></span>' 입니다. <span id="actionText"></span>하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="confirmActionBtn">확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function() { 
        // 페이지 로드 시 초기 설정
        setClock(); // 시계 설정
        setInterval(setClock, 1000); // 1초마다 시계 업데이트
        commuteCheck(); // 출퇴근 상태 확인
    
        // 출근하기 버튼 클릭 이벤트 핸들러
        $("#checkInBtn").click(function() {
            showConfirmationModal("출근 확인", "출근");
        });
    
        // 퇴근하기 버튼 클릭 이벤트 핸들러
        $("#checkOutBtn").click(function() {
            showConfirmationModal("퇴근 확인", "퇴근");
        });
    
        // 모달 확인 버튼 클릭 이벤트 핸들러
        $("#confirmActionBtn").click(function() {  
            let action = $("#actionText").text();
            if(action === "출근") {
                attend();
            } else if(action === "퇴근") {
                checkOut();
            }          
        }); 
    });
    
    // 확인 모달을 표시하는 함수
    function showConfirmationModal(title, action) {
        let currentTime = $("#time").text();
        $("#confirmationModalLabel").text(title);
        $("#currentTime").text(currentTime);
        $("#actionText").text(action);
        $("#confirmationModal").modal('show');
    }
    
    // 출퇴근 상태를 확인하는 함수
    function commuteCheck() {
        $.ajax({
            url: "/gaent/atd/checkAtd", // 데이터를 가져올 URL
            type: "GET", // GET 메서드를 사용
            data: {'empCode': '${loginInfo.empCode}'}, // id 값을 문자열로 전달
            dataType: "json", // 데이터 타입은 JSON
            success: function(data) { // 요청이 성공하면 실행
                console.log('출퇴근확인: ', data);
                $("#weeklyWorkTime").text(data.weeklyWorkTime); // 주간누적근무시간 표시
                if(data.inTime == null) { // 출근을 아직 안한 상태
                    $("#checkOutBtn").prop("disabled", true); // 퇴근 버튼 비활성화
                    $("#checkInBtn").prop("disabled", false); // 출근 버튼 활성화
                    
                } else if(data.outTime == null) { // 출근만 한 상태 
                    $("#checkOutBtn").prop("disabled", false); // 퇴근 버튼 활성화
                    $("#checkInBtn").prop("disabled", true); // 출근 버튼 비활성화
                    // $("#checkInBtn").prop("btn-dark", true); // 출근 버튼 비활성화
                    $("#checkInTime").text(data.inTime); // 출근 시간 표시
                } else { // 이미 출근 및 퇴근을 모두 완료한 상태
                    $("#checkOutBtn").prop("disabled", true); // 퇴근 버튼 비활성화
                    $("#checkInBtn").prop("disabled", true); // 출근 버튼 비활성화
                    $("#checkInTime").text(data.inTime); // 출근 시간 표시
                    $("#checkOutTime").text(data.outTime); // 퇴근 시간 표시
                }
            },
            error: function(jqXHR, textStatus, errorThrown) { // 요청이 실패하면 실행
                console.error("에러 발생: ", textStatus, errorThrown); // 에러 메시지 출력
                alert("출퇴근 상태를 확인하는 중 에러가 발생했습니다."); // 에러 메시지 출력
            }
        });
    }
    
    // 출근을 처리하는 함수
    function attend() {
        $.ajax({
            url: "/gaent/atd/atdIn", // 데이터를 가져올 URL
            type: "GET", // GET 메서드를 사용
            data: {'empCode': '${loginInfo.empCode}'}, // empCode 값을 문자열로 전달
            dataType: "json", 
            success: function(attendTime) { 
                // alert("출근 처리가 완료되었습니다.");
                $('#confirmationModal').modal('hide'); // 모달 닫기
                commuteCheck(); // 출근 후 버튼 상태 업데이트
            },
            error: function(jqXHR, textStatus, errorThrown) { // 요청이 실패하면 실행
                console.error("에러 발생: ", textStatus, errorThrown); // 에러 메시지 출력
                alert("출근 처리 중 에러가 발생했습니다."); // 에러 메시지 출력
            }
        });   
    }
    
    // 퇴근을 처리하는 함수
    function checkOut() {
        $.ajax({
            url: "/gaent/atd/atdOut", // 데이터를 가져올 URL
            type: "GET", // GET 메서드를 사용
            data: {'empCode': '${loginInfo.empCode}'}, // empCode 값을 문자열로 전달
            dataType: "json", 
            success: function(getOffTime) { 
                // alert("퇴근 처리가 완료되었습니다.");
                $('#confirmationModal').modal('hide'); // 모달 닫기
                commuteCheck(); // 퇴근 후 버튼 상태 업데이트
            },
            error: function(jqXHR, textStatus, errorThrown) { // 요청이 실패하면 실행
                console.error("에러 발생: ", textStatus, errorThrown); // 에러 메시지 출력
                alert("퇴근 처리 중 에러가 발생했습니다."); // 에러 메시지 출력
            }
        });   
    }
    
    // 현재 시간을 설정하는 함수
    function setClock() {
        let dateInfo = new Date();
        let hour = modifyNumber(dateInfo.getHours());
        let min = modifyNumber(dateInfo.getMinutes());
        let sec = modifyNumber(dateInfo.getSeconds());
        let year = dateInfo.getFullYear();
        let month = dateInfo.getMonth() + 1; // monthIndex를 반환해주기 때문에 1을 더해준다.
        let date = dateInfo.getDate();
        
        // 시간 및 날짜 표시 업데이트
        $("#time").text(hour + ":" + min + ":" + sec);
        $("#date").text(year + "년 " + month + "월 " + date + "일");
    }
    
    // 숫자가 한 자리일 경우 앞에 0을 추가하는 함수
    function modifyNumber(time) {
        return (parseInt(time) < 10) ? "0" + time : time;
    }
</script>
