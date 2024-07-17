<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>팀 등록 - GAEnt.</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <style>
	  .edocForm {
	    margin-bottom: 0rem !important;
	  }
	  
	  .typeDraftThTag {
	    color: #fff !important;
	    background-color: rgba(105, 108, 255, 0.6) !important;
	    padding: 0.1rem !important;
	  }
	  
	  .typeDraftTdTag {
	    background-color: rgba(255, 255, 255, 1) !important;
	  }
	  
	  .typeDraftTdTag textarea {
	    resize: none;
	  }
	  
	  #teamCode {
	  	width: 80%;
	  }
	</style>
  </head>
    
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/team/sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
      	<!-- 작업 공간 시작 -->
        <h5 class="fs-4 fw-semibold mb-2">부서등록</h5>
        <hr />
		<div class="table-responsive text-nowrap">
		<form action="/gaent/team/addTeam" method="post">
		  <table class="table table-bordered edocForm">
		    <tbody>
		      <tr>
		        <th class="text-center typeDraftThTag">팀 이름</th>
		        <td class="typeDraftTdTag">
		              <input class="form-control form-control-sm" type="text" id="teamName" name="teamName" placeholder="팀 이름을 입력해주세요.">
		        </td>
		      </tr>
		      <tr>
		      	<th class="text-center typeDraftThTag">팀 코드</th>
		        <td class="typeDraftTdTag">
		        	<input id="teamCode" class="form-control form-control-sm d-inline" type="text" id="teamCode" name="teamCode" placeholder="팀 코드를 입력해주세요.">
		            <button class="btn btn-primary">중복검사</button>
		        </td>
		        <th class="text-center typeDraftThTag">소속 그룹</th>
		        <td class="typeDraftTdTag">
		          <div class="edoc-type-select-box">
		            <select id="edoc-type" class="form-select form-select-sm" name="parentTeamCode">
				      <option value="10">대표이사</option>
				      <option value="100">인사부</option>
				      <option value="200">경영부</option>
				      <option value="300">기획부</option>
				      <option value="400">홍보부</option>
				      <option value="500">매니지먼트부</option>
		            </select>
		          </div>
		        </td>
		      </tr>
		      <tr>
		        <th class="text-center typeDraftThTag">팀 설명</th>
		        <td class="typeDraftTdTag" colspan="3">
		          <textarea class="form-control" rows="12" name="teaDes"></textarea>
		        </td>
		      </tr>
		    </tbody>
		  </table>
		  <br />
		  <button type="submit" class="btn btn-primary btn-lg">등록하기</button>
		  <a href="/gaent/team/addTeam" class="btn btn-primary btn-lg">취소하기</a>
		  </form>
		</div>
        <!-- 작업 공간 끝 -->
      </div>
    </div>
  </body>
</html>