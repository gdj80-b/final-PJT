<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css" />
<body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
        <div class="menu-inner-shadow"></div>
        <ul class="menu-inner pb-3">
            <jsp:include page="/WEB-INF/view/attendance/attendance-card.jsp"></jsp:include>
            <li class="menu-item-scroll mt-4">
                <div class="menu-link">
                    <span class="display-6 fw-semibold mb-0">근태관리</span>
                </div>
                <ul class="menu-item mt-2">
                    <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/atdHistory') ? 'active' : '' }">
                        <a href="/gaent/atd" class="menu-link"><span>근태관리</span></a>
                    </li>
                    <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/vacHistory') ? 'active' : '' }">
                        <a href="/gaent/atd/vacation" class="menu-link"><span>휴가내역</span></a>
                    </li>
                </ul>
            </li>
        </ul>
    </aside>
</body>
