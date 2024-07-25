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
        <div class="board-list-area">
          <div class="mb-4">
            <span class="display-6 fw-semibold">공지사항</span>
          </div>
          <div class="notice-list">
            <!-- 일자 순 5개만 보이는 공지사항 리스트 -->
            <div class="card mb-4 p-2 board-body">
              <div class="table-responsive text-nowrap d-flex flex-column align-items-center">
                <table class="table table-hover text-center">
                  <thead>
                    <tr>
                      <th class="board-num">번호</th>
                      <th class="board-category">항목</th>
                      <th class="board-title">제목</th>
                      <th class="board-writer">작성자</th>
                      <th class="board-file">파일</th>
                      <th class="board-date">작성일</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                    <c:forEach var="n" items="${noticeList}">
                      <tr onclick="location.href='/gaent/board/notice/boardDetail?boardNum=${n.noticeNum}'">
                        <td><span class="fw-medium">${n.noticeNum}</span></td>
                        <td><span class="fw-medium">항목</span></td>
                        <td class="text-start"><span class="fw-medium">${n.noticeTitle}</span></td>
                        <td><span class="fw-medium">${n.noticeWriter}</span></td>
                        <c:choose>
                          <c:when test="${c.noticeFileName == null}">
                            <td><span class="fw-medium"><i class="tf-icon bx bx-file-blank"></i></span></td>
                          </c:when>
                          <c:otherwise>
                            <td><span class="fw-medium"><i class="tf-icon bx bx-file"></i></span></td>
                          </c:otherwise>
                        </c:choose>
                        <td><span class="fw-medium">${n.noticeCreateDate}</span></td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <!-- 페이징시작 -->
                <div class="mt-4">
                  <jsp:include page="/WEB-INF/view/board/board-paging.jsp"></jsp:include>
                </div>
                <!-- 페이징끝 -->
              </div>
            </div>
            <!-- 일자 순 5개만 보이는 공지사항 리스트 -->
          </div>
        </div>
      </div>
    </div>
    <!--삭제 메세지 모달 시작 -->
    <div id="deleteMessageModal" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="deleteMessageModal" aria-hidden="true">
      <div class="modal-dialog">
        <div id="message" class="modal-content text-white">
          <div class="modal-header">
            <h4 class="modal-title">${message}</h4>
          </div>
          <div class="modal-body">
            <p>${updateMessage}</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 삭제 메세지 모달 끝 -->
    <script>
      $(document).ready(function(){
        if(${!empty message}){
          $("#message").attr("class", "modal-content");
          $("#deleteMessageModal").modal("show");
        };
      });
    </script>
  </body>
</html>
