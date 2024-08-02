<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
  </head>
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar-area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/edoc/edoc-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="misc-wrapper p-4 d-flex flex-column align-items-center justify-content-center">
          <h1 class="mb-5 mx-2" style="line-height: 6rem;font-size: 6rem;">ERROR</h1>
          <button onclick="javascript:history.back()" class="btn btn-primary mb-2">이전으로 돌아가기</button>
          <div class="mt-5">
            <img src="${pageContext.request.contextPath}/assets/img/illustrations/page-misc-error.png" alt="page-misc-error-light" width="500" class="img-fluid">
          </div>
          <h4 class="my-4 mx-2">⚠️ 페이지 없음.️ ⚠️</h4>
          <p class="mx-2">찾고 계신 문서를 찾을 수 없습니다.</p>
        </div>
      </div>
    </div>
  </body>
</html>
 