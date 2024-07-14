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
      </div>
      <div id="workspace-area" class="sidebar-from-workspace">
        <h1>일정등록</h1>
	<form action="/gaent/calendar/addEvent" method="post">
		<!-- 작성자 --> 
		<input type="hidden" name="calWriter">
	    일정타입 : <select name="calType">
					    <option value="private">개인</option>
					    <option value="team">팀</option>
					    <option value="dept">부서</option>
					    <option value="corp">전사</option>
					    <option value="artist">아티스트</option>
					</select>
					<br />
	    제목 : <input type="text" name="calTitle" /><br />
        내용 : <input type="text" name="calContent" /><br />
        시작시간 : <input type="datetime-local" name="calStartDate" /> <br />
        종료시간 : <input type="datetime-local" name="calEndDate" /><br />
        공개범위 : <select name="calTargetType">
					    <option value="all">전체</option>
					    <option value="private">개인</option>
					    <option value="team">팀</option>
					    <option value="dept">부서</option>
					</select>
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-secondary">취소</button>
	</form>
      </div>
    </div>
  </body>
</html>