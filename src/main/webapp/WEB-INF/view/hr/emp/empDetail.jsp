<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>인사관리 - GAEnt.</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
  </head>
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/hr/hr-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <h5 class="fs-4 fw-semibold mb-2">인사정보</h5>
        <hr />
        <div class="table-responsive text-nowrap">
          <div>${empDetail.empCode}</div>
          <div>${empDetail.teamCode}</div>
          <div>${empDetail.teamName}</div>
          <div>${empDetail.rankCode}</div>
          <div>${empDetail.profile}</div>
          <div>${empDetail.empId}</div>
          <div>${empDetail.korName}</div>
          <div>${empDetail.engName}</div>
          <div>${empDetail.age}</div>
          <div>${empDetail.gender}</div>
          <div>${empDetail.phone}</div>
          <div>${empDetail.ext}</div>
          <div>${empDetail.hireDate}</div>
          <div>${empDetail.resignDate}</div>
        </div>
      </div>
    </div>
  </body>
</html>