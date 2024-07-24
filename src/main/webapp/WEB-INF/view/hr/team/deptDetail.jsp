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
        <jsp:include page="/WEB-INF/view/hr/hr-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
      <div class="d-flex align-items-center justify-content-between">
        <h5 class="fs-4 fw-semibold mb-2">부서정보</h5>
          <div>
          	<a href="#modifyModal${teamCode}" data-toggle="modal" data-target="#modifyModal${teamCode}" class="btn btn-outline-primary">수정</a>
          	<c:forEach var="dept" items="${deptDetail}">
          	<!-- 부서 수정 모달창 시작 -->
            <div class="modal fade" id="modifyModal${teamCode}" tabindex="-1" style="display: none;" aria-hidden="true">
              <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">부서수정</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/gaent/hr/modifyTeam" method="post">
                    <div class="modal-body">
                      <div class="row">
                        <div class="col mb-3">
                          <label for="teamName" class="form-label">부서명</label>
                          <br />
                          <input type="text" name="teamName" id="teamName" class="form-control" placeholder="부서명을 입력하세요." value="${dept.teamName}">
                        </div>
                      </div>
                      <div class="row g-2">
                        <div class="col mb-0">
                          <label class="form-label" for="teamCode">부서코드</label>
                          <br />
                          <input type="text" name="teamCode" class="form-control" id="teamCode" placeholder="3자리 숫자 ex) 110" maxlength="3" value="${dept.teamCode}" readonly="readonly">
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
                          <input type="text" name="teamDes" id="desSmall" class="form-control" placeholder="부서설명을 입력하세요." value="${dept.teamDes}">
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
            <a href="/gaent/hr/removeTeam?teamCode=${teamCode}" class="delete-link btn btn-outline-danger">삭제</a>
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
            </div>
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
        <jsp:include page="/WEB-INF/view/hr/hr-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <h5 class="fs-4 fw-semibold mb-2">팀 정보</h5>
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
        </div>
      </div>
    </div>
	<%
	    }
	}
	%>
  	
    
  </body>
</html>