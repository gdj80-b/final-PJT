<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은쪽지함</title>
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .care-body div {
            margin-bottom: 15px;
        }
        .care-body .title {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .care-body .info {
            color: #555;
        }
        .care-body .info-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .care-body .content {
            padding: 10px;
            background-color: #f0f0f0;
            height:120px;
            border-radius: 5px;
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
        <div class="inbox-container">
            <div class="care-body">
                <div class="title">${m.msgTitle}</div>
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
                let empCode = '${m.receiver}';
                let requestData = {
                    msgNums: msgNum,
                    empCode: empCode,
                    request: 1
                };

                $.ajax({
                    url: '/gaent/msg/modifyMsgStatus',
                    type: 'POST',
                    data: requestData,
                    success: function(result) {
                        alert('선택된 항목이 삭제되었습니다.');
                        window.location.href = '/gaent/msg/1'; // 보낸쪽지함으로 이동
                    },
                    error: function() {
                        alert('항목 삭제에 실패했습니다.');
                    }
                });
            }
        });
        
        $('#reMsg').click(function() {
            $('#writeMessageBtn').click();
        });
        
    });
    
    function reply() {
        // 답장 기능을 여기에 구현
        // 예시로 alert 창만 띄우는 방식으로 표시
        alert('답장 기능은 구현되지 않았습니다.');
    }
</script>
</body>
</html>
