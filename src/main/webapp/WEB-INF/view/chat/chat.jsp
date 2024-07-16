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
      
      .chat-area {
        width: 100vw !important;
      }
      
      .chat {
        width: 100%;
        height: 100%;
      }
      
      .chat-form {
        height: 38px;
        padding-left: 16px;
      }
      
      .chat-form-botton {
        width: 38px;
      }
    </style>
  </head>
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar-area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/chat/chat-sub-sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/chat/chatRoomList.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="content-from-workspace d-flex align-items-center justify-content-center">
        <div class="chat-area">
          <div class="chat mx-auto p-4">
            <!-- Content -->
            <div class="app-chat card overflow-hidden">
              <div class="">
                <!-- Chat History -->
                <div class="app-chat-history">
                  <div class="chat-history-wrapper">
                    <div class="chat-history-header border-bottom d-flex justify-content-between">
                      <button class="btn btn-sm btn-outline-secondary d-flex align-items-center">
                        <i class="bx bx-log-out-circle me-2"></i>
                        <span>나가기</span>
                      </button>
                      <button class="btn btn-sm btn-outline-secondary d-flex align-items-center">
                        <i class="bx bx-x-circle me-2"></i>
                        <span>닫기</span>
                      </button>
                    </div>
                    <div class="chat-history-body scroll-container">
                      <ul class="list-unstyled chat-history scroll-content">
                        <li class="chat-message chat-message-right">
                          <div class="d-flex overflow-hidden">
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text primary">
                                <!-- Chat Message -->
                                <p class="mb-0">How can we help? We're here for you! 😄</p>
                              </div>
                              <div class="text-end text-muted mt-1">
                                <small>10:00 AM</small>
                              </div>
                            </div>
                            <div class="user-avatar flex-shrink-0 ms-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle"/>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message">
                          <div class="d-flex overflow-hidden">
                            <div class="user-avatar flex-shrink-0 me-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle">
                              </div>
                            </div>
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text">
                                <p class="mb-0">Do you have design files for sneat?</p>
                              </div>
                              <div class="text-muted mt-1">
                                <small>10:15 AM</small>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message chat-message-right">
                          <div class="d-flex overflow-hidden">
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text primary">
                                <!-- Chat Message -->
                                <p class="mb-0">How can we help? We're here for you! 😄</p>
                              </div>
                              <div class="text-end text-muted mt-1">
                                <small>10:00 AM</small>
                              </div>
                            </div>
                            <div class="user-avatar flex-shrink-0 ms-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle"/>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message">
                          <div class="d-flex overflow-hidden">
                            <div class="user-avatar flex-shrink-0 me-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle">
                              </div>
                            </div>
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text">
                                <p class="mb-0">Do you have design files for sneat?</p>
                              </div>
                              <div class="text-muted mt-1">
                                <small>10:15 AM</small>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message chat-message-right">
                          <div class="d-flex overflow-hidden">
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text primary">
                                <!-- Chat Message -->
                                <p class="mb-0">How can we help? We're here for you! 😄</p>
                              </div>
                              <div class="text-end text-muted mt-1">
                                <small>10:00 AM</small>
                              </div>
                            </div>
                            <div class="user-avatar flex-shrink-0 ms-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle"/>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message">
                          <div class="d-flex overflow-hidden">
                            <div class="user-avatar flex-shrink-0 me-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle">
                              </div>
                            </div>
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text">
                                <p class="mb-0">Do you have design files for sneat?</p>
                              </div>
                              <div class="text-muted mt-1">
                                <small>10:15 AM</small>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message chat-message-right">
                          <div class="d-flex overflow-hidden">
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text primary">
                                <!-- Chat Message -->
                                <p class="mb-0">How can we help? We're here for you! 😄</p>
                              </div>
                              <div class="text-end text-muted mt-1">
                                <small>10:00 AM</small>
                              </div>
                            </div>
                            <div class="user-avatar flex-shrink-0 ms-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle"/>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="chat-message">
                          <div class="d-flex overflow-hidden">
                            <div class="user-avatar flex-shrink-0 me-4">
                              <div class="avatar avatar-sm">
                                <img src="${pageContext.request.contextPath}/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle">
                              </div>
                            </div>
                            <div class="chat-message-wrapper flex-grow-1">
                              <div class="chat-message-text">
                                <p class="mb-0">Do you have design files for sneat?</p>
                              </div>
                              <div class="text-muted mt-1">
                                <small>10:15 AM</small>
                              </div>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <!-- Chat message form -->
                    <div class="chat-history-footer shadow-xs">
                      <form class="form-send-message d-flex justify-content-between align-items-center chat-form">
                        <input class="form-control message-input border-0 me-4 shadow-none" placeholder="메세지를 입력해주세요."/>
                        <div class="message-actions d-flex">
                          <button class="btn btn-primary d-flex align-items-center justify-content-center send-msg-btn chat-form-botton">
                            <i class="bx bx-paper-plane bx-sm"></i>
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://unpkg.com/perfect-scrollbar@1.5.5/dist/perfect-scrollbar.min.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function() {
        const scrollContainer = document.querySelector('.scroll-container');

        if (scrollContainer) {
          const ps = new PerfectScrollbar(scrollContainer);

          scrollContainer.addEventListener('mouseenter', function() {
            scrollContainer.classList.add('ps--focus');
          });

          scrollContainer.addEventListener('mouseleave', function() {
            scrollContainer.classList.remove('ps--focus');
          });
        }
      });
    </script>
  </body>
</html>