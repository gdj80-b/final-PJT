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
        width: 80%;
        margin: 20px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    .title {
        font-size: 25px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .care-body {
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
    }

    .care-body div {
        margin-bottom: 15px;
    }

    .info {
        color: #555;
        font-size: 1.2em;
        margin-bottom: 10px;
    }

    .info-container {
        display: flex;
        justify-content: space-between;
        font-size: 14px;
    }

    .content {
        padding: 10px;
        background-color: #f0f0f0;
        height: 120px;
        border-radius: 5px;
    }

    .msg-file-text {
        font-size: 20px;
        font-weight: 500;
    }

    .msgInfo {
        font-weight: 600;
    }

    .modal-footer {
        margin-top: 1rem;
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
            <div class="card-header d-flex align-items-start justify-content-between ps-3 pt-3 pb-0">
                <h2 class="title">${m.msgTitle}</h2>
                <button onclick="reloadPreviousPage()" class="btn-close fs-4"></button>
            </div>
            <div class="care-body">
                <div class="info d-flex justify-content-start">
                    <c:if test="${m.msgFileName != null}">
                        첨부파일 : &nbsp;
                        <a class="msg-file-text" href="${pageContext.request.contextPath}/upload/msgfile/${m.msgFileName}" target="_blank">
                            ${m.msgOriginalFileName}
                        </a>
                    </c:if>
                </div>


                <div class="info-container mb-3">
                    <div class="info msgInfo mb-0 p-0">
                        <c:choose>
                            <c:when test="${m.receiver == m.sender}">
                                내게쓴 쪽지
                            </c:when>
                            <c:when test="${m.receiver == loginInfo.empCode}">
                                <div class="d-flex justify-content-start m-0">
                                    보낸사람 : &nbsp;<a href="/gaent/inquiry/empDetail/${m.sender}" target="_blank"> ${m.senderName} </a>
                                </div>
                            </c:when>
                            <c:when test="${m.sender == loginInfo.empCode}">
                                <div class="d-flex justify-content-start m-0">
                                    받은사람 :&nbsp; <a href="/gaent/inquiry/empDetail/${m.receiver}" target="_blank"> ${m.receiverName} </a>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="d-flex justify-content-end m-0 p-0">
                        보낸시간 : ${m.sendTime} <br>
                        <c:if test="${m.readTime != null && m.receiver != m.sender}">
                            읽은시간 : ${m.readTime}
                        </c:if>
                    </div>
                </div>
                <div class="content">
                    ${m.msgContent}
                </div>
            </div>
            <div class="modal-footer">
                <button id="deleteThisMsg" type="button" class="btn btn-danger">삭제</button>
                <button id="reMsg" type="button" class="btn btn-primary">답장</button>
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
                    success: function() {
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
            $('#searchEmpDiv').css("display", "none");
            $('#searchEmpCode').prop('readonly', true);
            $('#receiverName').val('${m.senderName}').prop('readonly', true);
            $('#receiver').val('${m.sender}').prop('readonly', true);
        });
    });

    function reloadPreviousPage() {
        const previousPageUrl = document.referrer;
        if (previousPageUrl) {
            window.location.replace(previousPageUrl); // 페이지 새로고침
        } else {
            window.location.href = '/gaent/defaultError'; // 에러 페이지로 이동
        }
    }
</script>
</body>
</html>
