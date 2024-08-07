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
  <!-- 부트스트랩 JS 및 jQuery (필수) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
  <!-- 부트스트랩 CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <style>
  
      .edocForm {
        margin-bottom: 0rem !important;
      }

      .typeDraftThTag {
      	width: 200px;
        color: #fff !important;
        background-color: rgba(105, 108, 255, 0.6) !important;
        padding: 0.1rem !important;
      }

      .typeDraftTdTag {
      	width: 300px;
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
  	<%
	String teamCode = request.getParameter("teamCode");
	if (teamCode != null && teamCode.length() == 3) {
	    char secondChar = teamCode.charAt(1); // 2번째 문자 추출
	    if (secondChar == '0') {
	%>
	        <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/inquiry/sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
      <div class="d-flex align-items-center justify-content-between">
        <h5 class="fs-4 fw-semibold mb-2">부서정보</h5>
           </div>
        <hr />
        <div class="table-responsive text-nowrap">
          <table class="table table-bordered edocForm">
            <tbody class="table-border-bottom-0 table-light striped">
            <c:forEach var="d" items="${deptDetail}">
            <tr>
                <th class="text-center typeDraftThTag">부서명</th>
                <td class="typeDraftTdTag">
                  ${d.teamName}
                </td>
                <th class="text-center typeDraftThTag">부서설명</th>
                <td class="typeDraftTdTag">
                  ${d.teamDes}
                </td>
              </tr>
              <tr>
                <th class="text-center typeDraftThTag">소속인원</th>
                <td class="typeDraftTdTag">
                  ${deptTotal}명
                </td>
                <th class="text-center typeDraftThTag">부서장</th>
                <td class="typeDraftTdTag">
                  ${d.empName}
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          <br>
          <h5 class="fs-4 fw-semibold mb-2">관련부서</h5>
          <hr />
          <c:forEach var="t" items="${deptTeam}">
          <table class="table table-bordered edocForm">
            <tbody class="table-border-bottom-0 table-light striped">
            <tr>
                <th class="text-center typeDraftThTag">팀 이름</th>
                <td class="typeDraftTdTag">
                  ${t.teamName}
                </td>
                <th class="text-center typeDraftThTag">팀 설명</th>
                <td class="typeDraftTdTag">
                  ${t.teamDes}
                </td>
              </tr>
              <tr>
                <th class="text-center typeDraftThTag">소속인원</th>
                <td class="typeDraftTdTag">
                  ${t.cnt}명
                </td>
                <th class="text-center typeDraftThTag">팀장</th>
                <td class="typeDraftTdTag">
                  ${t.empName}
                </td>
              </tr>
           </tbody>
           </table>
           <br>
           </c:forEach>
        </div>
      </div>
    </div>
	<%
	    } else {
	%>
	        <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/inquiry/sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="d-flex align-items-center justify-content-between">
        <h5 class="fs-4 fw-semibold mb-2">팀 정보</h5>
           </div>
        <hr />
        <div class="table-responsive text-nowrap">
          <table class="table table-bordered edocForm">
            <tbody class="table-border-bottom-0 table-light striped">
            <c:forEach var="team" items="${teamDetail}">
            <tr>
                <th class="text-center typeDraftThTag">팀 이름</th>
                <td class="typeDraftTdTag">
                  ${team.teamName}
                </td>
                <th class="text-center typeDraftThTag">팀 설명</th>
                <td class="typeDraftTdTag">
                  ${team.teamDes}
                </td>
              </tr>
              <tr>
                <th class="text-center typeDraftThTag">소속인원</th>
                <td class="typeDraftTdTag">
                  ${team.cnt}명
                </td>
                <th class="text-center typeDraftThTag">팀장</th>
                <td class="typeDraftTdTag">
                  ${team.empName}
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div><br>
        <h5 class="fs-4 fw-semibold mb-2">멤버 정보</h5>
        <hr />
        <div class="table-responsive text-nowrap">
          <table class="table table-hover table-striped">
            <thead class="table-light">
              <tr>
                <th>&nbsp;</th>
                <th>이름</th>
                <th>직위</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>내선번호</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0 table-light striped">
              <c:forEach var="m" items="${memberDetail}">
                <tr>
                  <td class="profileImg"><div class="avatar avatar-sm"><img src="${pageContext.request.contextPath}/upload/profile/${m.profile}" alt="" class="rounded-circle"></div></td>
                  <td><b><a href="/gaent/inquiry/empDetail/${m.empCode}">${m.empName}</a></b></td>
                  <td>${m.rank}</td>
                  <td>${m.phone}</td>
                  <td>${m.email}</td>
                  <td>${m.ext}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <br>
          <!-- Basic Pagination -->
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
              	<c:if test="${lastPage == 0}">
                  <li class="page-item active">
                    <a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
                  </li>
                </c:if>
                <c:if test="${lastPage == 1}">
                  <li class="page-item active">
                    <a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
                  </li>
                </c:if>
                <c:if test="${currentPage == lastPage && lastPage != 1}">
                  <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <c:if test="${lastPage <= currentPage-2}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                  </c:if>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                </c:if>
                <c:if test="${(1 < currentPage) && (currentPage < lastPage)}">
                  <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                </c:if>
                <c:if test="${(currentPage == 1 && lastPage != 1) && lastPage != 0}">
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <c:if test="${(currentPage+2 <= lastPage) && lastPage != 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                  </c:if>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/inquiry/deptDetail?teamCode=${teamCode}&currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                </c:if>
              </ul>
            </nav>
            <!--/ Basic Pagination -->
      </div>
    </div>
	<%
	    }
	}
	%>
  	
    
  </body>
</html>