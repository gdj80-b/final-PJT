<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<%
    Map<String,Object> loginInfo = (Map<String,Object>)(session.getAttribute("loginInfo"));    
    loginInfo.put("empCode", "20110004");
%>
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
        <hr>
        <div>
            여백
        </div>
        <ul class="menu-inner py-3">
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgList')}">active</c:if>">
                <a href="/gaent/msg/0" class="menu-link"> 
                    <span>전체쪽지함</span>
                </a>
            </li>
            <!-- 받은쪽지함 -->
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgReceive')}">active</c:if>">
                <a href="/gaent/msg/1" class="menu-link"> 
                    <span>받은쪽지함</span>
                </a>
            </li>
            <!-- 보낸쪽지함 -->
           <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgSendList')}">active</c:if>">
                <a href="/gaent/msg/2" class="menu-link">
                    <span>보낸쪽지함</span>
                </a>
            </li>
            <!-- 내게쓴쪽지함 -->
           <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgSelf')}">active</c:if>">
                <a href="/gaent/msg/3" class="menu-link">
                    <span>내게쓴쪽지함</span>
                </a>
            </li>
            <!-- 휴지통 -->
	       <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'msgBin')}">active</c:if>">
                <a href="/gaent/msg/4" class="menu-link">                  
                    <span>휴지통</span>
                </a>
	       </li>
        </ul>
    </aside>
        
    <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                
                    <h5 class="modal-title" id="messageModalLabel">쪽지쓰기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                     <!-- 쪽지쓰기 폼 -->
                    <form id="messageForm">
                        <!-- 숨겨진 필드에 로그인한 사용자의 ID -->
                        <input type="text" name="sender" value="${loginInfo.empCode}">
                        <div class="mb-3">
                            <label for="receiver" class="form-label">받는이</label>
                            <input type="text" class="form-control" id="receiver" name="receiver" required>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="msgTitle" name="msgTitle" required>
                        </div>
                        <div class="mb-3">
                            <!-- 첨부파일 관련 필드 -->
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" id="msgContent" name="msgContent" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">보내기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function(){
        // "쪽지쓰기" 버튼 클릭 시 모달 표시
        $('#writeMessageBtn').click(function(){
            $('#receiver').val('').prop('readonly', false); // 받는이 필드를 초기화하고 읽기 전용 해제
            $('#messageModalLabel').text('쪽지쓰기'); // 제목을 "쪽지쓰기"로 설정
            $('#messageModal').modal('show');
        });

        // "내게쓰기" 버튼 클릭 시 receiver 필드에 로그인한 사용자의 ID로 설정하고 readonly로 만들기
        $('#writeMessageBtn2').click(function(){
            $('#receiver').val('${loginInfo.empCode}').prop('readonly', true); // 필드 값을 로그인 ID로 설정하고 readonly로 만듦
            $('#messageModalLabel').text('내게쓰기'); // 제목을 "내게쓰기"로 변경
            $('#messageModal').modal('show');
        });

        // 폼 제출 시 AJAX 요청으로 쪽지 보내기
        $('#messageForm').submit(function(event){
            event.preventDefault(); // 폼의 기본 제출 동작을 중단
            let formData = $(this).serialize(); // 폼 데이터를 직렬화하여 URL 인코딩된 문자열로 변환
            
            $.ajax({
                url: '/gaent/msg/sendMessage', // 서버에 쪽지를 보낼 URL
                type: 'POST',
                data: formData,
                success: function(response){
                    alert('쪽지가 성공적으로 보내졌습니다.');
                    $('#messageModal').modal('hide');
                    $('#messageForm')[0].reset(); // 폼 초기화
                    window.location.href = '/gaent/msg/2'; // home.jsp로 이동
                },
                error: function(){
                    alert('쪽지 보내기에 실패했습니다.');
                }
            });
        });
    });
</script>
