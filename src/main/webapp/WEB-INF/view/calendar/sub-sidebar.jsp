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
        <a href="/gaent/calendar" class="menu-link">
          <span>홈</span>
        </a>
      </li>
      <li class="menu-item">
	  	<span>일정선택</span>
          <div class="list-group">
            <label class="list-group-item">
              <input class="form-check-input me-1" type="checkbox" value="">
              개인일정
            </label>
            <label class="list-group-item">
              <input class="form-check-input me-1" type="checkbox" value="">
              팀일정
            </label>
            <label class="list-group-item">
              <input class="form-check-input me-1" type="checkbox" value="">
              전사일정
            </label>
            <label class="list-group-item">
              <input class="form-check-input me-1" type="checkbox" value="">
              아티스트일정
            </label>
      	</div>
      </li>
    </ul>
  </aside>
</body>
-