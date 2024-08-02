<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>직원조회 - GAEnt.</title>
    <!-- 부트스트랩 JS 및 jQuery (필수) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    </head>
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/inquiry/sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <h5 class="fs-4 fw-semibold mb-2">직원조회</h5>
        <form method="get" action="/gaent/inquiry/empList">
        <div class="input-group input-group-merge" style="width: 400px;">
          <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
          <input type="text" class="form-control" name="searchEmp" id="searchEmp" placeholder="이름을 검색해주세요" aria-label="Search..." aria-describedby="basic-addon-search31">
        </div>
        </form>
        <hr />
        <div class="table-responsive text-nowrap">
		    <table class="table table-hover table-striped">
		      <thead class="table-light">
		        <tr>
		          <th>이름</th>
		          <th>직위</th>
		          <th>소속부서</th>
		          <th>소속팀</th>
		          <th>연락처</th>
		          <th>입사일</th>
		        </tr>
		      </thead>
		      <tbody class="table-border-bottom-0 table-light striped"">
		      <c:forEach var="vo" items="${empList}">
		        <tr>
		          <td><b><a href="/gaent/inquiry/empDetail/${vo.empCode}">${vo.korName}</a></b></td>
		          <td>${vo.rankName}</td>
		          <td>${vo.teamName}</td>
		          <td>${vo.parentTeamName}</td>
		          <td>${vo.phone}</td>
		          <td>${vo.hireDate}</td>
		        </tr>
		      </c:forEach>
		      </tbody>
		    </table>
		    <div class="demo-inline-spacing">
          <!-- Basic Pagination -->
          <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
              	<c:if test="${lastPage == 0}">
                  <li class="page-item active">
                    <div><h4>조회 가능한 데이터가 존재하지 않습니다.</h4></div>
                  </li>
                </c:if>
                <c:if test="${lastPage == 1}">
                  <li class="page-item active">
                    <a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
                  </li>
                </c:if>
                <c:if test="${currentPage == lastPage && lastPage != 1}">
                  <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <c:if test="${lastPage <= currentPage-2}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                  </c:if>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                </c:if>
                <c:if test="${(1 < currentPage) && (currentPage < lastPage)}">
                  <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                </c:if>
                <c:if test="${(currentPage == 1 && lastPage != 1) && lastPage != 0}">
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <c:if test="${(currentPage+2 <= lastPage) && lastPage != 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                  </c:if>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/empList?&currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                </c:if>
              </ul>
            </nav>
          <!--/ Basic Pagination -->
        </div>
		    
		  </div>
      </div>
    </div>
  </body>
</html>