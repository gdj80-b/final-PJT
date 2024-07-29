<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/css/sidebar.css"
/>
<body>
  <aside
    id="layout-menu"
    class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav"
  >
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li class="menu-item">
        <a href="/gaent/inquiry/main" class="menu-link">
          <span>직원조회 홈</span>
        </a>
      </li>
      <li class="menu-item">
        <a href="/gaent/inquiry/teamList" class="menu-link">
          <span>그룹조회</span>
        </a>
      </li>
      <li class="menu-item">
        <a href="/gaent/inquiry/empList" class="menu-link">
          <span>직원조회</span>
        </a>
      </li>
    </ul>
  </aside>
</body>
