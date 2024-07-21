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
		          <label for="calType" class="form-label">일정타입</label>
		          <select name="calType" id="calType" class="form-select">
		            <option value="public">개인(공개)</option>
				    <option value="private">개인(제한)</option>
				    <option value="tpublic">팀(공개)</option>
				    <option value="tprivate">팀(제한)</option>
				    <option value="corp">전사(전체)</option>
				    <option value="artist">아티스트(전체)</option>
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
		            <option value="emp">개인</option>
				    <option value="110">인사팀</option>
				    <option value="210">경영팀</option>
				    <option value="220">회계팀</option>
				    <option value="310">기획팀</option>
				    <option value="320">제작팀</option>
				    <option value="410">홍보팀</option>
				    <option value="420">영업팀</option>
				    <option value="510">매니지먼트팀</option>
				    <option value="520">스타일팀</option>
				    <option value="corp">전사</option>
				    <option value="artist">아티스트</option>
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