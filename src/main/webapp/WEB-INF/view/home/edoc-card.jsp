<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/edoc-card.css"/>
    </head>
    <body>
        <div class="edoc-card">
            <div class="card edoc">
                <div class="card-body">
                    <div class="card-header d-flex align-items-center justify-content-center">
                        <div class="d-flex flex-column">
                            <div class="d-flex align-items-center mb-4">
                                <i class="bx bx-briefcase fs-4 me-2"></i>
                                <h4>전자결재</h4>
                            </div>
                            <div class="d-flex flex-column align-items-center justify-content-center">
                                <div class="card edoc-card mt-2">
                                    <div class="card-header d-flex align-items-center justify-content-between">
                                        <div class="d-flex flex-column align-items-center edoc-status">
                                            <div class="mb-3">
                                                <label>결재 대기 문서</label>
                                                <span id="toDoApprovalCnt"></span>개
                                            </div>
                                            <button onclick="location.href='/gaent/approval/toDo'" class="btn btn-sm btn-outline-secondary w-100">이동하기</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card edoc-card mt-4">
                                    <div class="card-header d-flex align-items-center justify-content-between">
                                        <div class="d-flex flex-column align-items-center edoc-status mt-2">
                                            <div class="mb-3">
                                                <label>결재 진행 문서</label>
                                                <span id="upComingApprovalCnt"></span>개
                                            </div>
                                            <button onclick="location.href='/gaent/approval/upComing'" class="btn btn-sm btn-outline-secondary w-100">이동하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            $(document).ready(function() {
                toDoApprovalCnt();
                upCommingApprovalCnt();
            });
            
            function toDoApprovalCnt() {
                $.ajax({
                    url: "/gaent/approval/0", // 데이터를 가져올 URL
                    type: "GET", // GET 메서드를 사용
                    dataType: "json", // 반환 데이터 타입은 int
                    success: function(data) { // 요청이 성공하면 실행
                        // 서버에서 반환된 JSON 데이터에서 값을 읽어와서 msgAlert 요소에 표시
                        $("#toDoApprovalCnt").text(data);
                    },
                    error: function() { // 요청이 실패하면 실행
                        alert("error"); // 에러 메시지 출력
                    }
                });
            }
            
            function upCommingApprovalCnt() {
                $.ajax({
                    url: "/gaent/approval/1", // 데이터를 가져올 URL
                    type: "GET", // GET 메서드를 사용
                    dataType: "json", // 반환 데이터 타입은 int
                    success: function(data) { // 요청이 성공하면 실행
                        // 서버에서 반환된 JSON 데이터에서 값을 읽어와서 msgAlert 요소에 표시
                        $("#upComingApprovalCnt").text(data);
                    },
                    error: function() { // 요청이 실패하면 실행
                        alert("error"); // 에러 메시지 출력
                    }
                });
            }
        </script>
    </body>
</html>
