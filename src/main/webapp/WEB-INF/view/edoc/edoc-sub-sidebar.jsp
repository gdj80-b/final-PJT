<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css" />
<body>
  <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li class="menu-item-scroll">
        <div class="menu-link">
          <span class="display-6 fw-semibold mb-0">전자결재</span>
        </div>
        <ul class="menu-item">
          <li class="menu-item">
            <a href="/gaent/approval" class="menu-link" style="padding-bottom: 0;"><span>전자결재 홈</span></a>
          </li>
        </ul>
      </li>
      <li class="menu-item edoc-btn">
        <div class="menu-link" style="padding-top: 0;">
          <button class="btn btn-primary btn-lg" onclick="location.href='/gaent/edoc'">새 결재 진행</button>
        </div>
      </li>
      <li class="menu-item-scroll">
        <h5 class="fs-4 fw-semibold mb-2">결재하기</h5>
        <ul class="menu-item">
          <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/edocAppr/toDo') ? 'active' : '' }">
            <a href="/gaent/approval/toDo" class="menu-link"><span>결재 대기 문서</span></a>
          </li>
          <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/edocAppr/upComing') ? 'active' : '' }">
            <a href="/gaent/approval/upComing" class="menu-link"><span>결재 진행 문서</span></a>
          </li>
          <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/edocAppr/apprHistory') ? 'active' : '' }">
            <a href="/gaent/approval/apprHistory" class="menu-link"><span>결재 내역</span></a>
          </li>
        </ul>
      </li>
      <li class="menu-item-scroll">
        <h5 class="fs-4 fw-semibold mb-2">개인 문서함</h5>
        <ul class="menu-item">
          <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/edocPersonal/wait') ? 'active' : '' }">
            <a href="/gaent/approval/wait" class="menu-link"><span>대기 문서함</span></a>
          </li>
          <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/edocPersonal/approve') ? 'active' : '' }">
            <a href="/gaent/approval/approve" class="menu-link"><span>승인 문서함</span></a>
          </li>
          <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/edocPersonal/reject') ? 'active' : '' }">
            <a href="/gaent/approval/reject" class="menu-link"><span>반려 문서함</span></a>
          </li>
        </ul>
      </li>
    </ul>
  </aside>
</body>
