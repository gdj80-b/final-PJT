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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board.css"/>
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
          <div class="mb-3">
            <span class="display-5 fw-semibold mb-0">자유게시판</span>
            <input type="hidden" name="articleType" value="자유게시판">
          </div>
          <div class="mb-3 w-100 d-flex justify-content-end">
            <button id="getModifyForm" class="btn btn-sm btn-outline-primary me-2">등록</button>
            <button onclick="javascript:history.back()" class="btn btn-sm btn-outline-secondary">취소</button>
          </div>
          <div>
            <div class="card board-detail">
              <div class="px-4 pt-4 d-flex flex-column align-items-start">
                <label for="boardTitle" class="mb-2">제목 :</label>
                <input class="form-control" id="boardTitle" name="articleTitle" value="${boardDetail.commTitle}">
              </div>
              <hr>
              <div class="px-4 py-2 d-flex flex-column align-items-start">
                <label for="boardContent" class="mb-2">내용 :</label>
                <textarea id="boardContent" name="articleContent" class="form-control modify-comm-board-content">${boardDetail.commContent}</textarea>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
