<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>채팅 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/app-chat.css" class="template-customizer-app-chat-css"/>
    <style>
      .primary {
        background-color: #696cff !important;
      }
      
      .init {
        margin-bottom: 0 !important;
        flex: 0 !important;
      }
      
      .chatroom {
        background-color: #fff;
        width: inherit;
        height: inherit;
        
        padding: 2rem 1rem;
      }
    </style>
  </head>
  <body>
    <aside id="layout-menu" class="layout-content-menu menu-vertical menu bg-content-menu-theme content-side-nav">
      <div class="menu-inner-shadow"></div>
      <ul class="menu-inner py-3 init">
        <li class="menu-item">
          <div class="menu-link">
            <span class="display-6 fw-semibold mb-0">채팅방 목록</span>
          </div>
        </li>
      </ul>
      <div class="mx-auto">
        <div class="chatroom"></div>
      </div>
    </aside>
  </body>
</html>