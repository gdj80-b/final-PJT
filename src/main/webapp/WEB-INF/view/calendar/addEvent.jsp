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
		<input type="hidden" name="calWriter" value="">
	    일정타입 : <select name="calType">
					    <option value="public">개인(공개)</option>
					    <option value="private">개인(제한)</option>
					    <option value="tpublic">팀(공개)</option>
					    <option value="tprivate">팀(제한)</option>
					    <option value="corp">전사(전체)</option>
					    <option value="artist">아티스트(전체)</option>
					</select>
					<br />
	    제목 : <input type="text" name="calTitle" /><br />
        내용 : <input type="text" name="calContent" /><br />
        시작시간 : <input type="datetime-local" name="calStartDate" /> <br />
        종료시간 : <input type="datetime-local" name="calEndDate" /><br />
        일정분류 : <select name="calTargetType">
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
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-secondary">취소</button>
	</form>
      </div>
    </div>
  </body>
</html>