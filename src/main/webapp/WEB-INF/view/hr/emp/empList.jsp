<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>인사관리 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <style>
      .profileImg {
        display: flex;
        justify-content: center;
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
        <jsp:include page="/WEB-INF/view/hr/hr-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <h5 class="fs-4 fw-semibold mb-2">인사현황</h5>
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
                <th>부서</th>
                <th>내선번호</th>
                <th>고용일</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0 table-light striped">
              <c:forEach var="el" items="${empList}">
                <tr>
                  <td class="profileImg"><div class="avatar avatar-sm"><img src="${pageContext.request.contextPath}/upload/profile/${el.profile}" alt="" class="rounded-circle"></div></td>
                  <td><b><a href="/gaent/hr/empDetail/${el.empCode}">${el.korName}</a></b></td>
                  <td>${el.rankCode}</td>
                  <td>${el.phone}</td>
                  <td>${el.empId}</td>
                  <td>${el.teamName}</td>
                  <td>${el.ext}</td>
                  <td>${el.hireDate}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="demo-inline-spacing">
            <!-- Basic Pagination -->
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
                <c:if test="${lastPage == 1}">
                  <li class="page-item active">
                    <a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
                  </li>
                </c:if>
                <c:if test="${currentPage == lastPage}">
                  <li class="page-item first"><a class="page-link" href=""><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <c:if test="${lastPage <= currentPage-2}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                  </c:if>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                </c:if>
                <c:if test="${(1 < currentPage) && (currentPage < lastPage)}">
                  <li class="page-item first"><a class="page-link" href=""><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                </c:if>
                <c:if test="${currentPage == 1}">
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <c:if test="${currentPage+2 <= lastPage}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                  </c:if>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/hr/empList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
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