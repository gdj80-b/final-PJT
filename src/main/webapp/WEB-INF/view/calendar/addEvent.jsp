<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>일정등록 - GAEnt.</title>
    </head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/calendar/sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
      <h5 class="fs-4 fw-semibold mb-2">일정등록</h5>
        <hr />
      	<div class="col-md-6">
		    <div class="card mb-4">
		      <div class="card-body">
		      	<form action="/gaent/calendar/addEvent" method="post">
		      	<div class="mb-3">
		          <input type="hidden" name="calWriter" value="${loginInfo.empCode}">
		          <label for="calType" class="form-label">일정타입</label>
		          <select name="calType" id="calType" class="form-select">
		            <c:forEach var="event" items="${eventType}">
			            <option value="${event.calType}">${event.calTypeName}</option>
					</c:forEach>
		          </select>
		        </div>
		        <div class="mb-3">
		          <label for="calTitle" class="form-label">제목</label>
		          <input name="calTitle" id="calTitle" class="form-control" type="text" placeholder="제목을 입력해주세요.">
		        </div>
		        <div class="mb-3">
		          <label for="calContent" class="form-label">내용</label>
		          <input name="calContent" id="calContent" class="form-control" type="text" placeholder="내용을 입력해주세요.">
		        </div>
		        <div class="mb-3">
		          <label for="calStartDate" class="form-label">시작시간</label>
		          <input name="calStartDate" class="form-control" type="datetime-local" id="html5-datetime-local-input">
		        </div>
		        <div class="mb-3">
		          <label for="calEndDate" class="form-label">종료시간</label>
		          <input name="calEndDate" class="form-control" type="datetime-local" id="html5-datetime-local-input">
		        </div>
				<div class="mb-3">
		          <label for="calTargetType" class="form-label">일정분류</label>
		          <select name="calTargetType" id="calTargetType" class="form-select">
		            <option value="${loginInfo.empCode}">개인</option>
				    <c:forEach var="target" items="${eventTarget}">
				    	<option value="${target.teamCode}">${target.teamName}</option>
				    </c:forEach>
		          </select>
		        </div>
		        <button type="submit" class="btn btn-primary">등록</button>
		        <a href="/gaent/calendar" class="btn btn-secondary">취소</a>
		        
		        </form>
		      </div>
		    </div>
		  </div>
      </div>
    </div>
  </body>
</html>