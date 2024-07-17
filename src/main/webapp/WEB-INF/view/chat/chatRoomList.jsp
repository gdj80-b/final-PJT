<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="chat-room-container">
  <div class="chat-room-wrap mx-auto p-4">
    <!-- Content -->
    <div class="app-chat app-chat-room card card-bg overflow-hidden">
      <!-- Chat History -->
      <div class="app-chat-contacts app-sidebar">
        <div class="sidebar-header border-bottom d-flex align-items-center justify-content-center">
          <div class="d-flex align-items-center justify-content-center me-6 me-lg-0">
            <span class="display-6 fw-semibold mb-0">채팅방 목록</span>
          </div>
        </div>
        <div class="sidebar-body sidebar-bg scroll-container">
          <ul class="list-unstyled chat-contact-list scroll-content p-4">
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://unpkg.com/perfect-scrollbar@1.5.5/dist/perfect-scrollbar.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const scrollContainers = document.querySelectorAll('.scroll-container');

    scrollContainers.forEach(function(container) {
      const ps = new PerfectScrollbar(container);

      container.addEventListener('mouseenter', function() {
        container.classList.add('ps--focus');
      });

      container.addEventListener('mouseleave', function() {
        container.classList.remove('ps--focus');
      });
    });
  });
</script>