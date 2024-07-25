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
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- 부트스트랩 CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        <h5 class="fs-4 fw-semibold mb-2">부서현황</h5>
        <hr />
        <div class="table-responsive text-nowrap">
          <table class="table table-hover table-striped">
            <thead class="table-light">
              <tr>
                <th>부서명</th>
                <th>부서코드</th>
                <th>소속부서</th>
                <th>등록일</th>
                <th>수정일</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0 table-light striped">
              <c:forEach var="vo" items="${teamList}">
                <tr>
                  <td><b><a href="#teamModal${vo.teamCode}" data-toggle="modal" data-target="#teamModal${vo.teamCode}">${vo.teamName}</a></b></td>
                  <td>${vo.teamCode}</td>
                  <td>
                    <c:choose>
                      <c:when test="${vo.parentTeamCode eq '10'}"> - </c:when>
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
                  <td><b><a href="#modifyModal${vo.teamCode}" data-toggle="modal" data-target="#modifyModal${vo.teamCode}" style="color: blue;">수정</a></b></td>
                  <td><b><a href="/gaent/team/removeTeam?teamCode=${vo.teamCode}" class="delete-link" style="color: red;">삭제</a></b></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <!-- 각 행에 대한 모달창 코드는 루프 밖에 위치 -->
          <c:forEach var="vo" items="${teamList}">
            <!-- 부서 상세 모달창 시작 -->
            <div class="modal fade" id="teamModal${vo.teamCode}" tabindex="-1" style="display: none;" aria-hidden="true">
              <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">부서상세</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col mb-3">
                        <label for="nameSmall" class="form-label">부서명</label>
                        <br />
                          ${vo.teamName}
                      </div>
                    </div>
                    <div class="row g-2">
                      <div class="col mb-0">
                        <label class="form-label" for="emailSmall">부서코드</label>
                        <br />
                          ${vo.teamCode}
                      </div>
                      <div class="col mb-0">
                        <label for="dobSmall" class="form-label">소속부서</label>
                        <br />
                        <c:choose>
                          <c:when test="${vo.parentTeamCode eq '10'}"> - </c:when>
                          <c:otherwise>
                            <c:forEach var="team" items="${teamList}">
                              <c:if test="${team.teamCode eq vo.parentTeamCode}">
                                ${team.teamName}
                              </c:if>
                            </c:forEach>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                    <br />
                    <div class="row">
                      <div class="col mb-3">
                        <label for="nameSmall" class="form-label">부서설명</label>
                        <br />
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
            <!--  부서 상세 모달창 끝 -->
    
            <!-- 부서 수정 모달창 시작 -->
            <div class="modal fade" id="modifyModal${vo.teamCode}" tabindex="-1" style="display: none;" aria-hidden="true">
              <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">부서수정</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/gaent/team/modifyTeam" method="post">
                    <div class="modal-body">
                      <div class="row">
                        <div class="col mb-3">
                          <label for="teamName" class="form-label">부서명</label>
                          <br />
                          <input type="text" name="teamName" id="teamName" class="form-control" placeholder="부서명을 입력하세요." value="${vo.teamName}">
                        </div>
                      </div>
                      <div class="row g-2">
                        <div class="col mb-0">
                          <label class="form-label" for="teamCode">부서코드</label>
                          <br />
                          <input type="text" name="teamCode" class="form-control" id="teamCode" placeholder="3자리 숫자 ex) 110" maxlength="3" value="${vo.teamCode}" readonly="readonly">
                        </div>
                        <div class="col mb-0">
                          <label for="parentTeamCode" class="form-label">소속부서</label>
                          <br />
                          <select name="parentTeamCode" id="parentSmall" class="form-select color-dropdown">
                            <option value="10">대표이사</option>
                            <option value="100">인사부</option>
                            <option value="200">경영부</option>
                            <option value="300">기획부</option>
                            <option value="400">홍보부</option>
                            <option value="500">매니지먼트부</option>
                          </select>
                        </div>
                      </div>
                      <br />
                      <div class="row">
                        <div class="col mb-3">
                          <label for="desSmall" class="form-label">부서설명</label>
                          <br />
                          <input type="text" name="teamDes" id="desSmall" class="form-control" placeholder="부서설명을 입력하세요." value="${vo.teamDes}">
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="submit" class="btn btn-primary">수정</button>
                      <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <!--  부서 수정 모달창 끝 -->
    
            <!-- 삭제 확인용 모달 시작 -->
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
              <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">삭제 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">부서 정보를 삭제하시겠습니까?</div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">삭제</button>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
    
          <script>
            // 삭제 링크 클릭 시 모달 띄우기
            $(document).ready(function() {
              $('a.delete-link').on('click', function(e) {
                e.preventDefault(); // 기본 동작(링크 이동) 방지
    
                let deleteUrl = $(this).attr('href'); // 삭제할 링크 주소 가져오기
                $('#deleteModal').modal('show'); // 모달 띄우기
    
                // 모달 안의 삭제 버튼 클릭 시
                $('#confirmDeleteBtn').on('click', function() {
                  window.location.href = deleteUrl; // 삭제할 링크로 이동
                });
              });
            });
          </script>
          <!-- 삭제 확인용 모달 끝 -->
    
          <div class="demo-inline-spacing">
            <!-- Basic Pagination -->
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
                <c:if test="${lastPage == 1}">
                  <li class="page-item active">
                    <a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
                  </li>
                </c:if>
                <c:if test="${currentPage == lastPage}">
                  <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <c:if test="${lastPage <= currentPage-2}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                  </c:if>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                </c:if>
                <c:if test="${(1 < currentPage) && (currentPage < lastPage)}">
                  <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                  <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                </c:if>
                <c:if test="${currentPage == 1}">
                  <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                  <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                  <c:if test="${currentPage+2 <= lastPage}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                  </c:if>
                  <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                  <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/hr/teamList?currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
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