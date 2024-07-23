<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>성공페이지</title>
<style>
    .modal-header, .modal-body {
        text-align: center;
        justify-content: center;
    }
    .modal-header img {
        width: 50px;
        display: block;
        margin: 0 auto;
    }
    .modal-header img {
        width: 50px;
    }
    .modal-header h2 {
        font-size: 32px;
        margin: 20px 0;
    }
    .p-grid {
        display: flex;
        justify-content: space-around;
        margin: 10px 0;
    }
    .p-grid-col {
        flex: 1;
    }
    .button {
        padding: 10px 20px;
        border: none;
        cursor: pointer;
    }
    .primary-button {
        background-color: #1b64da;
        color: white;
    }
    .secondary-button {
        background-color: #e8f3ff;
        color: #1b64da;
    }
    .link-button {
        background-color: transparent;
        color: #1b64da;
        text-decoration: underline;
        cursor: pointer;
    }
    .succ-sign{
        display: flex;
        flex-direction: column;
        align-items: center;
       
    }
    .pay-ck-btn{
        margin: 40px 0px 10px 0px;
    }
    .toss-relative-btn{
        margin:20px;
    }
</style>
</head>
<body>
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/product/prod-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="modal fades" id="tossSuccessModal" tabindex="-1" aria-labelledby="tossSuccessModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header succ-sign">
                        <div class="succ-sign">
                            <img src="https://static.toss.im/illusts/check-blue-spot-ending-frame.png" />
                            <h2>결제를 완료했어요</h2>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="p-grid typography--p">
                            <div class="p-grid-col text--left"><b>결제금액</b></div>
                            <div class="p-grid-col text--right" id="amount">${amount}원</div>
                        </div>
                        <div class="p-grid typography--p">
                            <div class="p-grid-col text--left"><b>상품코드</b></div>
                            <div class="p-grid-col text--right" id="prodCode">${prodCode}</div>
                        </div>
                        <div class="p-grid typography--p">
                            <div class="p-grid-col text--left"><b>결재자</b></div>
                            <div class="p-grid-col text--right" id="payName" style="white-space: initial; width: 250px">${loginInfo.korName}</div>
                        </div>
                        <div class="p-grid toss-relative-btn">
                            <button class="btn btn-primary" onclick="location.href='https://docs.tosspayments.com/guides/payment/integration';">연동 문서</button>
                            <button class="btn btn-info" onclick="location.href='https://discord.gg/A4fRFXQhRu';">실시간 문의</button>
                        </div>
                        <div class="pay-ck-btn">
                            <button class="btn btn-secondary" onclick="location.href='/gaent/prod/payList';">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
$(document).ready(function(){
    $('#tossSuccessModal').modal('show');
});
</script>
</html>
