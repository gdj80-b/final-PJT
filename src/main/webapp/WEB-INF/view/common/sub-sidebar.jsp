<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="${pageContext.request.contextPath}/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>서브 사이드바 - GAEnt.</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css" />
  </head>
  <body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
    <div class="menu-inner-shadow"></div>
      <ul class="menu-inner py-3">
        <li class="menu-item">
          <a href="home" class="menu-link">
            <i class="menu-icon tf-icons bx bx-home-circle"></i>
            <span>홈</span>
          </a>
        </li>
        <!-- 쪽지함 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-envelope"></i>
            <span>쪽지함</span>
          </a>
        </li>
        <!-- 채팅 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-message"></i>
            <span>채팅</span>
          </a>
        </li>
        <!-- 캘린더 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-calendar"></i>
            <span>캘린더</span>
          </a>
        </li>
        <!-- 근태관리 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-pie-chart-alt"></i>
            <span>근태관리</span>
          </a>
        </li>
        <!-- 직원조회 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-archive"></i>
            <span>직원조회</span>
          </a>
        </li>
        <!-- 전자결재 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-briefcase"></i>
            <span>전자결재</span>
          </a>
        </li>
        <!-- 공지사항 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
            <span>공지사항</span>
          </a>
        </li>
        <!-- 커뮤니티 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-conversation"></i>
            <span>커뮤니티</span>
          </a>
        </li>
        <!-- 사내구매 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-cart"></i>
            <span>사내구매</span>
          </a>
        </li>
        <!-- 관리자 -->
        <li class="menu-header small text-uppercase">
          <span class="menu-header-text">관리자 메뉴</span>
        </li>
        <!-- 인사관리 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-user"></i>
            <span>인사관리</span>
          </a>
        </li>
        <!-- 부서 근태관리 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-pie-chart-alt"></i>
            <span>부서 근태관리</span>
          </a>
        </li>
        <!-- 사내구매 현황 -->
        <li class="menu-item">
          <a href="/" class="menu-link">
            <i class="menu-icon tf-icons bx bx-cart"></i>
            <span>사내구매 현황</span>
          </a>
        </li>
      </ul>
    </aside>
  </body>
</html>
