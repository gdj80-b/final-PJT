<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<body>
  <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li class="menu-item">
        <div class="menu-link">
          <span class="display-6 fw-semibold mb-0">전자결재</span>
        </div>
      </li>
      <li class="menu-item">
        <div class="menu-link">
          <button class="btn btn-primary btn-lg" onclick="location.href='/gaent/edoc'">새 결재 진행</button>
        </div>
      </li>
      <li class="menu-item-edoc">
        <h5 class="fs-4 fw-semibold mb-2">결재하기</h5>
        <ul class="menu-item">
          <div class="">
            <a href="/gaent/approval/toDo" class="menu-link">
              <span>결재 대기 문서</span>
            </a>
          </div>
          <div class="">
            <a href="/gaent/approval/upComing" class="menu-link">
              <span>결재 진행 문서</span>
            </a>
          </div>
          <div class="">
            <a href="/gaent/approval/apprHistory" class="menu-link">
              <span>결재 내역</span>
            </a>
          </div>
        </ul>
      </li>
      <li class="menu-item-edoc">
        <h5 class="fs-4 fw-semibold mb-2">개인 문서함</h5>
        <ul class="menu-item">
          <div class="">
            <a href="/gaent/approval/wait" class="menu-link">
              <span>대기 문서함</span>
            </a>
          </div>
          <div class="">
            <a href="/gaent/approval/approve" class="menu-link">
              <span>승인 문서함</span>
            </a>
          </div>
          <div class="">
            <a href="/gaent/approval/reject" class="menu-link">
              <span>반려 문서함</span>
            </a>
          </div>
        </ul>
      </li>
    </ul>
  </aside>
</body>
