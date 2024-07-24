<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>소통공간 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <style>
      .board-detail-area {
        height: 84vh;
      }
      
      .board-detail {
        width: 36rem;
        height: 40rem;
      }
      
      .board-content {
        height: 28rem;
        overflow-y: auto;
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
        <jsp:include page="/WEB-INF/view/board/board-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="board-detail-area d-flex flex-column align-items-center justify-content-center">
          <div class="mb-5">
            <span class="display-5 fw-semibold mb-0">자유게시판</span>
          </div>
          <div>
            <div class="card board-detail">
              <div class="px-4 pt-4 d-flex align-items-start">
                <label class="me-2">제목 :</label>
                <h3>${boardDetail.commTitle}</h3>
              </div>
              <hr>
              <div class="px-4 d-flex justify-content-between">
                <div class="d-flex align-items-center">
                  <label class="me-2">작성자 :</label>
                  <span>${boardDetail.commWriter}</span>
                </div>
                <div>
                  <span>${boardDetail.commCreateDate}</span>
                </div>
              </div>
              <hr>
              <div class="px-4 py-2">
                <div class="board-content">${boardDetail.commContent}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
