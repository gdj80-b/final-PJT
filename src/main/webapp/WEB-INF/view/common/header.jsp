<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>헤더 - GAEnt.</title>
  </head>
  <body>
    <nav class="navbar navbar-example navbar-expand-lg bg-white position-sticky shadow-sm">
      <div class="container-fluid">
        <div class="app-brand demo">
          <span class="app-brand-logo demo">
            <img src="${pageContext.request.contextPath}/assets/svg/sneat.svg" alt="Logo">
          </span>
          <span class="app-brand-text demo menu-text fw-bolder ms-2">GA Ent.</span>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-3">
          <div class="navbar-nav me-auto"></div>
          <!-- 마이페이지 -->
          <div class="me-4">
            <a href="/" class="menu-link">
              <i class="menu-icon tf-icons bx bx-user-circle"></i>
              <span>마이페이지</span>
            </a>
          </div>
          <!-- 로그아웃 -->
          <div class="">
            <a href="/gaent/logout" class="menu-link">
              <i class="menu-icon tf-icons bx bx-log-out"></i>
              <span>로그아웃</span>
            </a>
          </div>
        </div>
      </div>
    </nav>
  </body>
</html>
