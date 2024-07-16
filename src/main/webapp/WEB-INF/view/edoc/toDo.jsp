<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
  </head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
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
        <div style="height:780px; overflow-x: hidden; overflow-y: auto;">
          <div class="mb-3">
            <span class="display-6 fw-semibold mb-0">결재 대기 문서</span>
          </div>
          <div>
            <jsp:include page="/WEB-INF/view/edoc/edocToDoTable.jsp"></jsp:include>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
