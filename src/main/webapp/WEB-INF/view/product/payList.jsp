<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품구매</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <style>

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
        <div class="card">
            <h2 class="card-title" style="margin:50px 0px 0px 30px">
                내 구매내역
            </h2>
            <div class="card-body">
                <table class="table table-striped">
                    <tr>
                        <th>날짜</th>
                        <th>상품이름</th>
                        <th>상품코드</th>
                        <th>가격</th>
                        <th>결재방법</th>
                    </tr>
                    <c:forEach var="m" items="${list}">            
                        <tr>
                            <td>${m.payTime}</td>
                            <td>${m.prodName}</td>
                            <td>${m.prodCode}</td>
                            <td>${m.payPrice}원</td>
                            <td>${m.payType}</td>
                        </tr>                
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    </script>
</body>
</html>
