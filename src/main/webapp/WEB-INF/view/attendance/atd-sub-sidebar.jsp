<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css" />
<body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
        <div class="menu-inner-shadow"></div>
        <ul class="menu-inner py-3">
            <li class="menu-item" style="height:24rem;"><jsp:include page="/WEB-INF/view/home/attendance-card.jsp"></jsp:include></li>
            <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/atdHistory') ? 'active' : '' }"><a href="/gaent/atd" class="menu-link"> <span>근태관리</span>
            </a></li>
            <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/vacHistory') ? 'active' : '' }"><a href="/gaent/atd/vacation" class="menu-link"> <span>휴가내역</span>
            </a></li>
        </ul>
    </aside>
</body>
