<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<style>

</style>
<body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
        <div class="menu-inner-shadow"></div>
        <br>
        <h2 style="margin-left:20px">사내구매</h2>
        <hr>
        <ul class="menu-inner py-3">
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'prodList')}">active</c:if>">
                <a href="/gaent/prod" class="menu-link"> 
                    <span class="fs-5 mb-2">상품목록</span>
                </a>
            </li>
            
            <li class="menu-item <c:if test="${fn:contains(pageContext.request.requestURI, 'payList')}">active</c:if>">
                <a href="/gaent/prod/payList" class="menu-link"> 
                    <span class="fs-5 mb-2">구매내역</span>
                </a>
            </li>
           
        </ul>
    </aside>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

</script>
