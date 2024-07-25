<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
  .chat-history-container {
    /* width: 100vw !important; */
  }
  
  .chat-history-container {
    width: 100%;
    height: 100%;
    overflow: hidden;
  }
  
  .chat-form {
    height: 38px;
    padding-left: 16px;
  }
  
  .chat-form-botton {
    width: 38px;
  }
</style>
<div class="chat-history-container">
  <div class="chat-history-container mx-auto p-4">
    <div class="app-chat card overflow-hidden">
      <!-- 채팅 기록 -->
      <div class="app-chat-history">
        <div class="chat-history-wrapper">
          <div class="chat-history-header border-bottom d-flex justify-content-between ">
            <button class="btn btn-sm btn-outline-secondary d-flex align-items-center">
              <i class="bx bx-log-out-circle me-2"></i>
              <span>나가기</span>
            </button>
            <button onclick="chatClose()" class="btn btn-sm btn-outline-secondary d-flex align-items-center">
              <i class="bx bx-x-circle me-2"></i>
              <span>닫기</span>
            </button>
          </div>
          <div id="chat" class="chat-history-body scroll-container">
            <ul id="chat-history" class="list-unstyled chat-history scroll-content">
            
            </ul>
          </div>
          <!-- 채팅 메세지 입력 폼 -->
          <div class="chat-history-footer shadow-xs">
            <form class="form-send-message d-flex justify-content-between align-items-center chat-form">
              <input id="messageInput" class="form-control message-input border-0 me-4 shadow-none" placeholder="메세지를 입력해주세요."/>
              <div class="message-actions d-flex">
                <button id="send" class="btn btn-primary d-flex align-items-center justify-content-center send-msg-btn chat-form-botton">
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
<script src="https://unpkg.com/perfect-scrollbar@1.5.5/dist/perfect-scrollbar.min.js"></script>