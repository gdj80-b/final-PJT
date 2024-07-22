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
        <table class="table">
            <tr>
                <th>이름</th>
                <th>가격</th>
                <th></th>
            </tr>
            <c:forEach var="m" items="${list}">            
                <tr>
                    <td>${m.prodContent}</td>
                    <td>${m.prodPrice}</td>
                    <td>
                    <form action="/gaent/prod/toss" method="post">
                        <input type="hidden" name="prodCode" value="${m.prodCode}">
                        <input type="hidden" name="prodContent" value="${m.prodContent}">
                        <input type="hidden" name="prodPrice" value="${m.prodPrice}">
                        <button class="btn btn-primary" type="submit">구매</button>
                    </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    </script>
</body>
</html>
