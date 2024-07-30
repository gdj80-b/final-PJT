<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/attendance-card.css" />
    </head>
    <body>
        <div class="attendance-card-in-subsidebar">
            <div class="card text-center">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="card-header">
                        <h4 class="card-title">근태관리</h4>
                    </div>
                    <div class="time-wrapper d-flex flex-column align-items-center mb-3">
                        <div id="date" class="card-text attendance-year-month"></div>
                        <div id="time" class="card-text time-display"></div>
                    </div>
                    <div class="details text-start d-flex flex-column w-100">
                        <div class="d-flex align-items-center justify-content-between">
                            <label>출근시간 :</label>
                            <span id="checkInTime" class="attendance-time-gray"></span>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <label>퇴근시간 :</label>
                            <span id="checkOutTime" class="attendance-time-gray"></span>
                        </div>
                        <div class="d-flex flex-column align-items-start mt-3">
                            <div>
                                <label>주간 누적 근무시간 :</label>
                            </div>
                            <div>
                                <span id="weeklyWorkTime" class="attendance-time-gray"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-2 mb-4">
                    <button id="checkInBtn" class="btn btn-outline-primary btn-sm me-3">출근하기</button>
                    <button id="checkOutBtn" class="btn btn-outline-danger btn-sm">퇴근하기</button>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                // 페이지 로드 시 초기 설정
                setClock(); // 시계 설정
                setInterval(setClock, 1000); // 1초마다 시계 업데이트
                commuteCheck(); // 출퇴근 상태 확인
                
                // 출근하기 버튼 클릭 이벤트 핸들러
                $('#checkInBtn').click(function() {
                    showConfirmationModal('출근 확인', '출근');
                });
                
                // 퇴근하기 버튼 클릭 이벤트 핸들러
                $('#checkOutBtn').click(function() {
                    showConfirmationModal('퇴근 확인', '퇴근');
                });
                
                // 모달 확인 버튼 클릭 이벤트 핸들러
                $('#confirmActionBtn').click(function() {
                    let action = $('#actionText').text();
                    if (action === '출근') {
                        attend();
                    } else if (action === '퇴근') {
                        checkOut();
                    }
                });
            });
            
            // 확인 모달을 표시하는 함수
            function showConfirmationModal(title, action) {
                let currentTime = $('#time').text();
                $('#confirmationModalLabel').text(title);
                $('#currentTime').text(currentTime);
                $('#actionText').text(action);
                $('#confirmationModal').modal('show');
            }
            
            // 출퇴근 상태를 확인하는 함수
            function commuteCheck() {
                $.ajax({
                    url : '/gaent/atd/checkAtd', // 데이터를 가져올 URL
                    type : 'GET', // GET 메서드를 사용
                    data : {
                        empCode : '${loginInfo.empCode}'
                    }, // empCode 값을 문자열로 전달
                    dataType : 'json', // 데이터 타입은 JSON
                    success : function(data) {
                        // 요청이 성공하면 실행
                        // console.log('출퇴근: ', data);
                        $('#weeklyWorkTime').text(data.weeklyWorkTime); // 주간누적근무시간 표시
                        if (data.inTime == null) {
                            // 출근을 아직 안한 상태
                            $('#checkOutBtn').prop('disabled', true); // 퇴근 버튼 비활성화
                            $('#checkInBtn').prop('disabled', false); // 출근 버튼 활성화
                        } else if (data.outTime == null) {
                            // 출근만 한 상태
                            $('#checkOutBtn').prop('disabled', false); // 퇴근 버튼 활성화
                            $('#checkInBtn').prop('disabled', true); // 출근 버튼 비활성화
                            // $("#checkInBtn").prop("btn-dark", true); // 출근 버튼 비활성화
                            $('#checkInTime').text(data.inTime); // 출근 시간 표시
                        } else {
                            // 이미 출근 및 퇴근을 모두 완료한 상태
                            $('#checkOutBtn').prop('disabled', true); // 퇴근 버튼 비활성화
                            $('#checkInBtn').prop('disabled', true); // 출근 버튼 비활성화
                            $('#checkInTime').text(data.inTime); // 출근 시간 표시
                            $('#checkOutTime').text(data.outTime); // 퇴근 시간 표시
                        }
                    },
                    error : function(jqXHR, textStatus, errorThrown) {
                        // 요청이 실패하면 실행
                        console.error('에러 발생: ', textStatus, errorThrown); // 에러 메시지 출력
                        alert('출퇴근 상태를 확인하는 중 에러가 발생했습니다.'); // 에러 메시지 출력
                    },
                });
            }
            
            let inputDateTime = null;
            
            // 현재 시간을 설정하는 함수
            function setClock() {
                let dateInfo = new Date();
                let hour = modifyNumber(dateInfo.getHours());
                let min = modifyNumber(dateInfo.getMinutes());
                let sec = modifyNumber(dateInfo.getSeconds());
                let year = dateInfo.getFullYear();
                let month = dateInfo.getMonth() + 1; // monthIndex를 반환해주기 때문에 1을 더해준다.
                let date = dateInfo.getDate();
                inputDateTime = dateInfo.toISOString().slice(0, 19).replace('T', ' '); // YYYY-MM-DD HH:MM:SS 형식
                // 시간 및 날짜 표시 업데이트
                $('#time').text(hour + ':' + min + ':' + sec);
                $('#date').text(year + '년 ' + month + '월 ' + date + '일');
                return inputDateTime;
            }
        
            // 출근을 처리하는 함수
            function attend() {
                $.ajax({
                    url : '/gaent/atd/atdIn', // 데이터를 가져올 URL
                    type : 'GET', // GET 메서드를 사용
                    data : {
                        empCode : '${loginInfo.empCode}', // empCode 값을 문자열로 전달
                        inputDateTime : inputDateTime,
                    },
                    dataType : 'json',
                    success : function(attendTime) {
                        // alert("출근 처리가 완료되었습니다.");
                        $('#confirmationModal').modal('hide'); // 모달 닫기
                        commuteCheck(); // 출근 후 버튼 상태 업데이트
                    },
                    error : function(jqXHR, textStatus, errorThrown) {
                        // 요청이 실패하면 실행
                        console.error('에러 발생: ', textStatus, errorThrown); // 에러 메시지 출력
                        alert('출근 처리 중 에러가 발생했습니다.'); // 에러 메시지 출력
                    },
                });
            }
            
            // 퇴근을 처리하는 함수
            function checkOut() {
                $.ajax({
                    url : '/gaent/atd/atdOut', // 데이터를 가져올 URL
                    type : 'GET', // GET 메서드를 사용
                    data : {
                        empCode : '${loginInfo.empCode}'
                    }, // empCode 값을 문자열로 전달
                    dataType : 'json',
                    success : function(getOffTime) {
                        // alert("퇴근 처리가 완료되었습니다.");
                        $('#confirmationModal').modal('hide'); // 모달 닫기
                        commuteCheck(); // 퇴근 후 버튼 상태 업데이트
                    },
                    error : function(jqXHR, textStatus, errorThrown) {
                        // 요청이 실패하면 실행
                        console.error('에러 발생: ', textStatus, errorThrown); // 에러 메시지 출력
                        alert('퇴근 처리 중 에러가 발생했습니다.'); // 에러 메시지 출력
                    },
                });
            }
            
            // 숫자가 한 자리일 경우 앞에 0을 추가하는 함수
            function modifyNumber(time) {
                return parseInt(time) < 10 ? '0' + time : time;
            }
        </script>
    </body>
</html>
