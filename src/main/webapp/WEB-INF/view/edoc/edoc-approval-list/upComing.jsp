<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>전자결재 - GAEnt.</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/edoc.css" />
    </head>
    <body>
        <div id="">
            <div id="header-area">
                <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
            </div>
            <div id="sidebar-area">
                <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
                <jsp:include page="/WEB-INF/view/edoc/edoc-sub-sidebar.jsp"></jsp:include>
            </div>
            <div id="workspace-area" class="subsidebar-from-workspace">
                <div>
                    <div class="mb-3">
                        <span class="display-6 fw-semibold mb-0">결재 진행 문서함</span>
                    </div>
                    <div class="card p-4 pt-5 edoc-personal-list d-flex flex-column align-items-center justify-content-between">
                        <c:choose>
                            <c:when test="${!empty list}">
                                <div class="table-responsive text-nowrap w-100">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr class="text-center">
                                                <th class="edoc-enroll-date">기안일</th>
                                                <th class="edoc-type">문서양식</th>
                                                <th class="edoc-title">제목</th>
                                                <th class="edoc-file">첨부</th>
                                                <th class="edoc-done-date">기안자</th>
                                            </tr>
                                        </thead>
                                        <!-- 문서 조회 반복문 영역 -->
                                        <tbody class="table-border-bottom-0">
                                            <c:forEach items="${list}" var="el">
                                                <tr onclick="location.href='/gaent/edocDetail/${el.edocType}/${el.edocNum}'" class="text-center">
                                                    <td><span class="fw-medium">${el.edocEnrollDate}</span></td>
                                                    <td><span class="fw-medium">${el.edocFormTitle}</span></td>
                                                    <td><span class="fw-medium">${el.edocTitle}</span></td>
                                                    <c:choose>
                                                        <c:when test="${el.fileName == null}">
                                                            <td><i class="tf-icon bx bx-file-blank"></i></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><i class="tf-icon bx bx-file"></i></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td><span class="fw-medium">${el.korName}</span></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            <!-- 페이징 시작 -->
                            <div class="mt-4">
                                <jsp:include page="/WEB-INF/view/edoc/edoc-paging.jsp"></jsp:include>
                            </div>
                            <!-- 페이징 종료 -->
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive text-nowrap h-100 d-flex align-items-center">
                                    <span class="display-6 fw-semibold mb-0">결재 진행중인 문서가 없습니다.</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
