<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<style>
    .button-container {
        display: flex;
        justify-content: center; /* 버튼들을 수평으로 가운데 정렬 */
        align-items: center;     /* 버튼들을 수직으로 가운데 정렬 */
        gap: 5px;               /* 버튼 사이의 간격 설정 */
    }
    
    .btn-Msg-sidebar {
        text-decoration: none;   /* 링크의 기본 밑줄 제거 */
        padding: 10px 20px;      /* 버튼의 패딩 조정 */
        color: white;            /* 버튼의 텍스트 색상 */
        background-color: #28a745; /* 버튼의 배경색 */
        border-radius: 5px;      /* 버튼의 모서리 둥글게 */
        display: inline-block;   /* 버튼이 줄바꿈 없이 나란히 위치하도록 설정 */
    }
    
    .btn-Msg-sidebar:hover {
        background-color: #218838; /* 버튼 호버 시 색상 변경 */
    }
    a{
        display:block;
    }
</style>
<body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
        <div class="menu-inner-shadow"></div>
        <br>
        <h2 style="margin-left:20px">쪽지함</h2>
        <div class="button-container">
            <a href="#" class="btn btn-success btn-lg btn-Msg-sidebar" id="writeMessageBtn">쪽지쓰기</a>
            <a href="#" class="btn btn-success btn-lg btn-Msg-sidebar" id="writeMessageBtn2">내게쓰기</a>
        </div>
        <hr style="border:1px solid black;">
        <ul class="menu-inner py-3">
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgList')}">active</c:if>">
                <a href="/gaent/msg/0" class="menu-link"> 
                    <span class="fs-5 mb-2">전체쪽지함</span>
                </a>
            </li>
            <!-- 받은쪽지함 -->
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgReceive')}">active</c:if>">
                <a href="/gaent/msg/1" class="menu-link"> 
                    <span class="fs-5 mb-2">받은쪽지함</span>
                </a>
            </li>
            <!-- 보낸쪽지함 -->
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgSendList')}">active</c:if>">
                <a href="/gaent/msg/2" class="menu-link">
                    <span class="fs-5 mb-2">보낸쪽지함</span>
                </a>
            </li>
            <!-- 내게쓴쪽지함 -->
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgSelf')}">active</c:if>">
                <a href="/gaent/msg/3" class="menu-link">
                    <span class="fs-5 mb-2">내게쓴쪽지함</span>
                </a>
            </li>
            <!-- 휴지통 -->
	        <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgBin')}">active</c:if>">
                <a href="/gaent/msg/4" class="menu-link">                  
                    <span class="fs-5 mb-2">휴지통</span>
                </a>
	       </li>
        </ul>
    </aside>
        
    <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">                
                    <h3 class="modal-title" id="messageModalLabel">쪽지쓰기</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
	               <!-- 쪽지쓰기 폼 -->                    
                <form id="messageForm" enctype="multipart/form-data">
                    <div class="modal-body">
                        <!-- 숨겨진 필드에 로그인한 사용자의 ID -->
                        <input type="hidden" id="sender" name="sender" value="${loginInfo.empCode}">
                        <div class="mb-3" id="searchEmpDiv" tabindex="-1">
                            <label for="search" class="form-label"><span class="fs-6">---직원검색---</span></label>
                            <input class="form-control" type="search" name="empName" id="searchEmpCode" autocomplete="off" placeholder="입력해주세요..">
                            <select id="resultEmpCode" style="display: none;">
                                <option value="">직원선택</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="receiver" class="form-label">받는이</label>
                            <input type="text" class="form-control" id="receiverName" readonly required >
                            <input type="hidden" class="form-control" id="receiver" name="receiver" required>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="msgTitle" name="msgTitle" required>
                        </div>
                        <div class="mb-3">
                           <label for="file" class="form-label">첨부파일</label>
                           <input type="file" class="form-control" id="file" name="gaFile" accept="image/*"> 
                          
                        </div>
                        <div class="mb-6">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" id="msgContent" name="msgContent" rows="6" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">보내기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        // "쪽지쓰기" 버튼 클릭 시 모달 표시
        $('#writeMessageBtn').click(function(){
            $('#searchEmpDiv').css("display","");
            $('#searchEmpCode').val('').prop('readonly', false); // 검색 필드를 초기화하고 읽기 전용 해제
            $('#resultEmpCode').empty();
            $('#resultEmpCode').css('display', 'none');
            $('#receiverName').val('직원을 검색해주세요');
            $('#receiver').val('').prop('readonly', false); // 받는이 필드를 초기화하고 읽기 전용 해제
            $('#messageModalLabel').text('쪽지쓰기'); // 제목을 "쪽지쓰기"로 설정
            $('#messageModal').modal('show');
        });

        // "내게쓰기" 버튼 클릭 시 작동
        $('#writeMessageBtn2').click(function(){
            $('#messageModalLabel').text('내게쓰기'); // 제목을 "내게쓰기"로 변경
            $('#searchEmpDiv').css("display","none");
            $('#searchEmpCode').prop('readonly', true); // 필드 값을 로그인 ID로 설정하고 readonly로 만듦
            $('#receiverName').val('나').prop('readonly', true); // 필드 값을 로그인 이름으로 설정하고 readonly로 만듦
            $('#receiver').val('${loginInfo.empCode}').prop('readonly', true); // 필드 값을 로그인 ID로 설정하고 readonly로 만듦
            
            $('#messageModal').modal('show');
        });
        
        // 쪽지 모달이 열리면 검색창으로 커서 이동
        $('#messageModal').on('shown.bs.modal', function() {
            $('#searchEmpCode').focus();
        });
        
        // 폼 제출 시 AJAX 요청으로 쪽지 보내기
        $('#messageForm').submit(function(event){
            event.preventDefault(); // 폼의 기본 제출 동작을 중단
            let checkReceiver = $('#receiverName').val();
            // let formData = $(this).serialize(); // 폼 데이터를 직렬화하여 URL 인코딩된 문자열로 변환
            console.log( );
            if(!checkReceiver){
                alert('받는이를 선택해주세요');
                return false;
            }
            
            let formData = new FormData($('#messageForm')[0]);
            
            $.ajax({
                url: '/gaent/msg/sendMessage', // 서버에 쪽지를 보낼 URL
                type: 'POST',
                data: formData,
                contentType: false,  // FormData 객체를 사용하기 때문에 false로 설정
                processData: false,  // FormData 객체를 직렬화하지 않기 때문에 false로 설정
                success: function(response){
                    if(response<0){
                    	window.location.href = '/gaent/defaultError'; // 에러페이지로 이동
                    }else{
                        alert('쪽지가 성공적으로 보내졌습니다.');
                        $('#messageModal').modal('hide');
                        $('#messageForm')[0].reset(); // 폼 초기화
                        window.location.href = '/gaent/msg/2'; // 보낸쪽지함으로 이동
                    }
                },
                error: function(){
                    alert('쪽지 보내기에 실패했습니다.');
                }
            });
        });
       
      // 검색창에 입력할 때마다 검색 결과 업데이트
        $('#searchEmpCode').keyup(function() {
            let searchText = $(this).val(); // 입력된 검색어 가져오기
            if (searchText.length >= 2) {
                $.ajax({
                    url: '/gaent/msg/searchEmpCode',
                    type: 'POST',
                    data: { empName: searchText },
                    success: function(response) {
                        $('#resultEmpCode').empty(); // 기존 옵션 모두 제거
                        $('#resultEmpCode').css('display', 'block'); // 검색 결과 보이기
                        $('#resultEmpCode').append('<option value="">' + '선택하세요' + '</option>');
                        response.forEach(function(item) {
                            $('#resultEmpCode').append('<option value="' + item.empCode + '">' + item.empName + '</option>'); // 검색 결과 옵션 추가
                        });
                    },
                    error: function() {
                        console.error('검색 중 오류가 발생했습니다.');
                    }
                });
            } else {
                $('#resultEmpCode').css('display', 'none'); // 입력이 부족하면 검색 결과 숨기기
            }
        });

        // select 요소에서 옵션 선택 시 처리
        $('#resultEmpCode').change(function() {
            let selectedEmpCode = $(this).val(); // 선택된 직원 코드 가져오기
            let selectedEmpName = $('#resultEmpCode option:selected').text(); // 선택된 직원 이름 가져오기
            $('#receiverName').val(selectedEmpName); // 선택된 직원 이름을 receiverName input 요소에 설정
            $('#receiver').val(selectedEmpCode); // 선택된 직원 코드를 receiver input 요소에 설정
        }); 

        
    });
</script>
<%-- <script src="${pageContext.request.contextPath}/assets/js/searchEmp.js"></script> //직원검색 jQuery코드 JavaScript로 바꾼 파일--%>
