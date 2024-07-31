<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
<style>
    body {
    	font-family: Arial, sans-serif;
    }
    
    .inbox-container {
    	width: 90%;
    	margin: 0 auto;
    	margin-top: 20px;
    }
    
    .inbox-container {
    	width: 80%;
    	margin: 0 auto;
    	margin-top: 20px;
    	padding: 20px;
    	border: 1px solid #ddd;
    	border-radius: 5px;
    	background-color: #f9f9f9;
    }
    
    .care-body {
    	padding: 20px;
    	background-color: #fff;
    	border-radius: 5px;
    	/* 	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
    }
    
    .care-body div {
    	margin-bottom: 15px;
    }
    
    .title {
    	font-size: 1.5em;
    	font-size: 1.5em;
    	font-weight: bold;
    	margin-bottom: 10px;
    }
    
    .care-body .info {
    	color: #555;
    	font-size: 1.2em;
    	font-weight: 300;
    	margin-bottom: 10px;
    }
    
    .care-body .info-container {
    	display: flex;
    	justify-content: space-between;
    	margin-bottom: 0px;
    }
    
    .care-body .content {
    	padding: 10px;
    	background-color: #f0f0f0;
    	height: 120px;
    	border-radius: 5px;
    }
    
    .msg-file-text {
    	font-size: 20px;
    	font-weight: 500;
    }
</style>
</head>
<body>
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/msg/msg-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="card inbox-container">
            <div class="card-header d-flex align-items-start justify-content-between ps-3 pt-3" style="padding-top: ">
                <h2 class="title pt-3">${m.msgTitle}</h2>
                <button onclick="reloadPreviousPage()" class="btn-close fs-4"></button>
            </div>
            <div class="care-body">
                <div class="info" style="display: flex; font-weight: bold" >
                    첨부파일 : &nbsp;
                    <c:if test="${m.msgFileName!=null}"> 
                        <a class="msg-file-text" href="${pageContext.request.contextPath}/upload/msgfile/${m.msgFileName}" target="_blank">
                            ${m.msgOriginalFileName}
                        </a>
                    </c:if>
                </div>
                    <div class="info-container">
                        <div class="info">보낸사람 : ${m.senderName}</div>
                        <div class="info">읽은시간 : ${m.readTime}</div>
                    </div>
                        <div class="info">받은사람 : ${m.receiverName}</div>
                <div class="content">${m.msgContent}</div>
            </div>
            <div class="modal-footer" style="margin-top:10px">
                <button id="deleteThisMsg" type="button" class="btn btn-danger">삭제</button>
                <button id="reMsg" type="submit" class="btn btn-primary">답장</button>
            </div>
        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
    $(document).ready(function() {
        $('#deleteThisMsg').click(function() {
            let confirmDelete = confirm('정말로 이 메시지를 삭제하시겠습니까?');
            if (confirmDelete) {
                let msgNum = '${m.msgNum}';
                let requestData = {
                    msgNums: msgNum,
                    request: 1
                };

                $.ajax({
                    url: '/gaent/msg/modifyMsgStatus',
                    type: 'POST',
                    data: requestData,
                    success: function(result) {
                        alert('선택된 항목이 삭제되었습니다.');
                        window.location.href = '/gaent/msg/4'; // 휴지통으로 이동
                    },
                    error: function() {
                        alert('항목 삭제에 실패했습니다.');
                    }
                });
            }
        });
        
        $('#reMsg').click(function() {
            $('#writeMessageBtn').click();
            $('#messageModalLabel').text('답장하기');
            $('#searchEmpDiv').css("display","none");
            $('#searchEmpCode').prop('readonly', true);
            $('#receiverName').val('${m.senderName}').prop('readonly', true);
            $('#receiver').val('${m.sender}').prop('readonly', true);
        });
        
    });
    
    function reloadPreviousPage() {
        // 현재 페이지의 URL을 새로 고침하여 이전 페이지를 다시 로드합니다.
        const previousPageUrl = document.referrer;
        if (previousPageUrl) {
          window.location.replace(previousPageUrl); // 페이지 새로고침
        } else {
          window.location.href = '/gaent/defaultError'; // 에러페이지로이동
        }
      }
</script>
</body>
</html>
