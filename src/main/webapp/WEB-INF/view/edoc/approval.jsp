<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/edoc.css"/>
  </head>
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/edoc/edoc-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <div>
          <div class="mb-3">
            <span class="display-6 fw-semibold mb-0">전자결재 홈</span>
          </div>
          <div class="edoc-card-area mb-4"><jsp:include page="/WEB-INF/view/edoc/approvalCard.jsp"></jsp:include></div>
          <div class="edoc-list-area">
            <div class="card mb-3">
              <h5 class="card-header-edoc">기안 대기 문서</h5>
              <div class="table-responsive text-nowrap">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>기안일</th>
                      <th>결재양식</th>
                      <th>제목</th>
                      <th>첨부</th>
                      <th>결재상태</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                    <!-- 문서 조회 반복문 영역 -->
                    <tr>
                      <td><span class="fw-medium">기안일</span></td>
                      <td><span class="fw-medium">결재양식</span></td>
                      <td><span class="fw-medium">제목</span></td>
                      <td><span class="fw-medium">첨부</span></td>
                      <td><span class="badge bg-label-primary me-1">결재상태</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="">
            <div class="card mb-3">
              <h5 class="card-header-edoc">기안 승인 문서</h5>
              <div class="table-responsive text-nowrap">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>기안일</th>
                      <th>결재양식</th>
                      <th>제목</th>
                      <th>첨부</th>
                      <th>결재상태</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                    <!-- 문서 조회 반복문 영역 -->
                    <tr>
                      <td><span class="fw-medium">기안일</span></td>
                      <td><span class="fw-medium">결재양식</span></td>
                      <td><span class="fw-medium">제목</span></td>
                      <td><span class="fw-medium">첨부</span></td>
                      <td><span class="badge bg-label-primary me-1">결재상태</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
