<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
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
            <span class="display-6 fw-semibold mb-0">전자결재 홈</span>
          </div>
          <div>
            <jsp:include page="/WEB-INF/view/edoc/approvalCard.jsp"></jsp:include>
          </div>
          <div>
            <jsp:include page="/WEB-INF/view/edoc/edocProgressTable.jsp"></jsp:include>
          </div>
          <div>
            <jsp:include page="/WEB-INF/view/edoc/edocCompleteTable.jsp"></jsp:include>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
