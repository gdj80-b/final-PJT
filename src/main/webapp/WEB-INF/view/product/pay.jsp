<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결재</title>
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
    <div id="workspace-area" class="subsidebar-from-workspace" style="padding:0px;!important; height:100% !important;">
        <jsp:include page="/WEB-INF/view/product/checkout.jsp"></jsp:include>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
		
    </script>
</body>
</html>
