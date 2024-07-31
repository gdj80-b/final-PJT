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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hr.css"/>
    </head>
    <body>
    <%
        String teamCode = request.getParameter("teamCode");
        if(teamCode != null && teamCode.length() == 3) {
            char secondChar = teamCode.charAt(1); // 2번째 문자 추출
            if (secondChar == '0') {
    %>
    <div id="">
        <div id="header-area">
            <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
        </div>
        <div id="sidebar-area">
            <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
            <jsp:include page="/WEB-INF/view/hr/hr-sub-sidebar.jsp"></jsp:include>
        </div>
        <div id="workspace-area" class="subsidebar-from-workspace">
            <div class="d-flex align-items-center justify-content-between">
                <h5 class="fs-4 fw-semibold mb-2">부서정보</h5>
                <div>
                    <a href="#modifyModal${teamCode}" data-toggle="modal" data-target="#modifyModal${teamCode}" class="btn btn-sm btn-outline-primary">수정</a>
                    <button onclick="location.href='/gaent/hr/removeTeam?teamCode=${teamCode}'" class="delete-link btn btn-sm btn-outline-secondary">삭제</button>
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
                        <!-- 삭제 확인용 모달 끝 -->
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
                </div>
            </div>
            <hr />
            <div class="table-responsive text-nowrap">
                <table class="table table-bordered edoc-form">
                    <tbody class="table-border-bottom-0 table-light striped">
                        <c:forEach var="d" items="${deptDetail}">
                            <tr>
                                <th class="text-center type-draft-th-tag">부서명</th>
                                <td class="type-draft-td-tag">${d.teamName}</td>
                                <th class="text-center type-draft-th-tag">부서설명</th>
                                <td class="type-draft-td-tag">${d.teamDes}</td>
                            </tr>
                            <tr>
                                <th class="text-center type-draft-th-tag">소속인원</th>
                                <td class="type-draft-td-tag">${deptTotal}명</td>
                                <th class="text-center type-draft-th-tag">부서장</th>
                                <td class="type-draft-td-tag">${d.empName}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br>
                <h5 class="fs-4 fw-semibold mb-2">관련부서</h5>
                <hr />
                <c:forEach var="t" items="${deptTeam}">
                    <table class="table table-bordered edoc-form">
                        <tbody class="table-border-bottom-0 table-light striped">
                            <tr>
                                <th class="text-center type-draft-th-tag">팀 이름</th>
                                <td class="type-draft-td-tag">${t.teamName}</td>
                                <th class="text-center type-draft-th-tag">팀 설명</th>
                                <td class="type-draft-td-tag">${t.teamDes}</td>
                            </tr>
                            <tr>
                                <th class="text-center type-draft-th-tag">소속인원</th>
                                <td class="type-draft-td-tag">${t.cnt}명</td>
                                <th class="text-center type-draft-th-tag">팀장</th>
                                <td class="type-draft-td-tag">${t.empName}</td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                </c:forEach>
                <br>
                <hr />
                <div id="add-btn-group" class="container d-flex justify-content-end">
                    <div class="row gx-3">
                        <div class="col">
                            <button onclick="location.href='/gaent/hr/addTeam'" class="btn btn-primary">부서등록</button>
                        </div>
                        <div class="col">
                            <button onclick="location.href='/gaent/hr/addEmp'" class="btn btn-primary">직원등록</button>
                        </div>
                    </div>
                </div>
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
            <div class="d-flex align-items-center justify-content-between">
                <h5 class="fs-4 fw-semibold mb-2">팀 정보</h5>
                    <div>
                        <a href="#modifyModal${teamCode}" data-toggle="modal" data-target="#modifyModal${teamCode}" class="btn btn-sm btn-outline-primary">수정</a>
                        <button onclick="location.href='/gaent/hr/removeTeam?teamCode=${teamCode}'" class="delete-link btn btn-sm btn-outline-secondary">삭제</button>
                        <c:forEach var="t" items="${teamDetail}">
                            <!-- 부서 수정 모달창 시작 -->
                            <div class="modal fade" id="modifyModal${teamCode}" tabindex="-1" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel2">팀 수정</h5>
                                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/gaent/hr/modifyTeam" method="post">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col mb-3">
                                                        <label for="teamName" class="form-label">팀 이름</label>
                                                        <br />
                                                        <input type="text" name="teamName" id="teamName" class="form-control" placeholder="부서명을 입력하세요." value="${t.teamName}">
                                                    </div>
                                                </div>
                                                <div class="row g-2">
                                                    <div class="col mb-0">
                                                        <label class="form-label" for="teamCode">팀 코드</label>
                                                        <br />
                                                        <input type="text" name="teamCode" class="form-control" id="teamCode" placeholder="3자리 숫자 ex) 110" maxlength="3" value="${t.teamCode}" readonly="readonly">
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
                                                        <label for="desSmall" class="form-label">팀 설명</label>
                                                        <br />
                                                        <input type="text" name="teamDes" id="desSmall" class="form-control" placeholder="부서설명을 입력하세요." value="${t.teamDes}">
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
                                        <div class="modal-body">팀 정보를 삭제하시겠습니까?</div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                            <button type="button" class="btn btn-danger" id="confirmDeleteBtn">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 삭제 확인용 모달 끝 -->
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
                    </div>
                </div>
                <hr />
                <div class="table-responsive text-nowrap">
                    <table class="table table-bordered edoc-form">
                        <tbody class="table-border-bottom-0 table-light striped">
                            <c:forEach var="team" items="${teamDetail}">
                                <tr>
                                    <th class="text-center type-draft-th-tag">팀 이름</th>
                                    <td class="type-draft-td-tag">${team.teamName}</td>
                                    <th class="text-center type-draft-th-tag">팀 설명</th>
                                    <td class="type-draft-td-tag">${team.teamDes}</td>
                                </tr>
                                <tr>
                                    <th class="text-center type-draft-th-tag">소속인원</th>
                                    <td class="type-draft-td-tag">${team.cnt}명</td>
                                    <th class="text-center type-draft-th-tag">팀장</th>
                                    <td class="type-draft-td-tag">${team.empName}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <br>
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
                                    <td><b><a href="/gaent/hr/empDetail/${m.empCode}">${m.empName}</a></b></td>
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
                            <c:if test="${lastPage == 1}">
                                <li class="page-item active">
                                    <a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage == lastPage && lastPage != 1}">
                                <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                                <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                                <c:if test="${lastPage <= currentPage-2}">
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                                </c:if>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                                <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                            </c:if>
                            <c:if test="${(1 < currentPage) && (currentPage < lastPage)}">
                                <li class="page-item first"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=1&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
                                <li class="page-item prev"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-left"></i></a></li>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-2}&rowPerPage=${rowPerPage}">${currentPage-2}</a></li>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">${currentPage-1}</a></li>
                                <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                                <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                                <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                            </c:if>
                            <c:if test="${currentPage == 1 && lastPage != 1}">
                                <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${currentPage}</a></li>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">${currentPage+1}</a></li>
                                <c:if test="${currentPage+2 <= lastPage}">
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+2}&rowPerPage=${rowPerPage}">${currentPage+2}</a></li>
                                </c:if>
                                <li class="page-item next"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${currentPage+1}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevron-right"></i></a></li>
                                <li class="page-item last"><a class="page-link" href="${pageContext.request.contextPath}/hr/deptDetail?teamCode=${teamCode}&currentPage=${lastPage}&rowPerPage=${rowPerPage}"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
                            </c:if>
                        </ul>
                    </nav>
                    <!--/ Basic Pagination -->
                </div>
                <br>
                <hr />
                <div id="add-btn-group" class="container d-flex justify-content-end">
                    <div class="row gx-3">
                        <div class="col">
                            <button onclick="location.href='/gaent/hr/addEmp'" class="btn btn-primary">직원등록</button>
                        </div>
                    </div>
                </div>
            </div>
        <%
            }
        }
        %>
    </body>
</html>