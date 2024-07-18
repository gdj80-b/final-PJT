<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="d-flex overflow-hidden">
  <div class="user-avatar flex-shrink-0 ${message.sender === username ? 'ms-4' : 'me-4'}">
    <div class="avatar avatar-sm">
      <img src="${pageContext.request.contextPath}/assets/img/avatars/default.png" alt="Avatar" class="rounded-circle"/>
    </div>
  </div>
  <div class="chat-message-wrapper flex-grow-1">
    <div class="chat-message-text ${message.sender === username ? 'primary' : ''}">
      <p class="mb-0">${message.content}</p>
    </div>
    <div class="${message.sender === username ? 'text-end' : ''} text-muted mt-1">
      <small>${new Date().toLocaleTimeString()}</small>
    </div>
  </div>
</div>