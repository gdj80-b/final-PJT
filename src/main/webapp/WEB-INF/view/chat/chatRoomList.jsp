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
      
      .chat-room-area {
        width: 20rem;
        height: 100%;
      }
      
      .chat-room {
        /* width: 100%;
        height: 100%; */
      }
    </style>
  </head>
  <body>
    <aside id="layout-menu" class="layout-content-menu menu-vertical menu bg-content-menu-theme content-side-nav">
      <div class="chat-room-area">
        <div class="chat-room mx-auto p-4">
          <!-- Chat & Contacts -->
          <div class="app-chat card overflow-hidden">
            <div class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end" id="app-chat-contacts">
              <div class="sidebar-body">
                <!-- Chats -->
                <ul class="list-unstyled chat-contact-list py-2 mb-0" id="chat-list"></ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </aside>
  </body>
</html>