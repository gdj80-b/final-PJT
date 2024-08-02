<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>그룹조회 - GAEnt.</title>
    <!-- 부트스트랩 JS 및 jQuery (필수) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
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
        <h5 class="fs-4 fw-semibold mb-2">그룹조회</h5>
        <hr />
        <div class="table-responsive text-nowrap">
    <table class="table table-hover table-striped">
      <thead class="table-light">
        <tr>
          <th>부서명</th>
          <th>부서설명</th>
          <th>부서코드</th>
          <th>소속부서</th>
          <th>등록일</th>
          <th>수정일</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0 table-light striped">
      <c:forEach var="vo" items="${teamList}">
        <tr>
          <td><b><a href="/gaent/inquiry/deptDetail?teamCode=${vo.teamCode}&currentPage=1&rowPerPage=5">${vo.teamName}</a></b></td>
          <td>${vo.teamDes}</td>
          <td>${vo.teamCode}</td>
          <td>
          	  <c:choose>
	            <c:when test="${vo.parentTeamCode eq '10'}">
	              -
	            </c:when>
	            <c:otherwise>
	                <c:forEach var="team" items="${teamList}">
		                <c:if test="${team.teamCode eq vo.parentTeamCode}">
		                    ${team.teamName}
		                </c:if>
		            </c:forEach>
	            </c:otherwise>
	          </c:choose>
		  </td>
          <td>${vo.teamCreateDate}</td>
          <td>${vo.teamUpdateDate}</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    
    <!-- 각 행에 대한 모달창 코드는 루프 밖에 위치 -->
	<c:forEach var="vo" items="${teamList}">
	  <!-- 그룹 상세 모달창 시작 -->
        <div class="modal fade" id="teamModal${vo.teamCode}" tabindex="-1" style="display: none;" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">그룹상세</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="row">
                  <div class="col mb-3">
                    <label for="nameSmall" class="form-label">부서명</label><br />
                    ${vo.teamName}
                  </div>
                </div>
                <div class="row g-2">
                  <div class="col mb-0">
                    <label class="form-label" for="emailSmall">부서코드</label><br />
                    ${vo.teamCode}
                  </div>
                  <div class="col mb-0">
                    <label for="dobSmall" class="form-label">소속부서</label><br />
                    <c:choose>
			            <c:when test="${vo.parentTeamCode eq '10'}">
			              -
			            </c:when>
			            <c:otherwise>
			                <c:forEach var="team" items="${teamList}">
				                <c:if test="${team.teamCode eq vo.parentTeamCode}">
				                    ${team.teamName}
				                </c:if>
				            </c:forEach>
			            </c:otherwise>
			          </c:choose>
                  </div>
                </div><br />
                <div class="row">
                  <div class="col mb-3">
                    <label for="nameSmall" class="form-label">부서설명</label><br />
                    ${vo.teamDes}
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
        <!--  그룹 상세 모달창 끝 -->
	</c:forEach>
    
    <div class="demo-inline-spacing">
          <!-- Basic Pagination -->
          <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
            <c:if test="${lastPage == 1}">
              <li class="page-item active">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
              </li>
            </c:if>
            <c:if test="${currentPage == lastPage}">
              <li class="page-item first">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a>
              </li>
              <li class="page-item prev">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a>
              </li>
              <c:if test="${lastPage <= currentPage-2}">
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a>
              </li>
              </c:if>
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a>
              </li>
              <li class="page-item active">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
              </li>
            </c:if>
            <c:if test="${(1 < currentPage) && (currentPage < lastPage)}">
              <li class="page-item first">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a>
              </li>
              <li class="page-item prev">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a>
              </li>
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a>
              </li>
              <li class="page-item active">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a>
              </li>
              <li class="page-item next">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a>
              </li>
              <li class="page-item last">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a>
              </li>
            </c:if>
            <c:if test="${currentPage == 1}">
              <li class="page-item active">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a>
              </li>
              <c:if test="${currentPage+2 <= lastPage}">
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a>
              </li>
              </c:if>
              <li class="page-item next">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a>
              </li>
              <li class="page-item last">
                <a class="page-link" href="${pageContext.request.contextPath}/inquiry/teamList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a>
              </li>
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