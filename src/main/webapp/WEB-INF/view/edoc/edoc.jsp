<%@page import="java.util.Date"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
  </head>
  <body>
    <div id="">
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/edoc/edoc-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <div style="max-width: 100%; width: 880px; height: 780px; overflow-x: hidden; overflow-y: auto">
          <div class="d-flex mb-3">
            <span class="display-6 fw-semibold me-3">기안하기</span>
            <div style="width: 200px;">
              <select class="form-select form-select-sm">
                <option>기안서 양식을 선택해주세요.</option>
                <option value="1">기안서</option>
                <option value="2">휴가신청서</option>
                <option value="3">지출결의서</option>
                <option value="4">경조사지출결의서</option>
                <option value="5">차량이용신청서</option>
                <option value="6">보고서(경위서)</option>
              </select>
            </div>
          </div>
          <hr />
          <div>
            <div class="mb-3">
              <span class="display-6 fw-semibold mb-0">전자문서양식</span>
            </div>
            <div class="d-flex justify-content-between">
              <!-- 문서정보 -->
              <div style="width: 300px;">
                <div class="table-responsive text-nowrap">
                  <table class="table table-bordered table-sm" style="background-color: #fff; margin-bottom: 0rem !important">
                    <tbody>
                      <tr>
                        <th class="text-center" style="width: 80px; color: #fff; background-color: rgba(105, 108, 255, 0.6);">기안서</th>
                        <td class="small">${loginInfo.korName}</td>
                      </tr>
                      <tr>
                        <th class="text-center" style="width: 80px; color: #fff; background-color: rgba(105, 108, 255, 0.6);">소속</th>
                        <td class="small">${loginInfo.rankCode}</td>
                      </tr>
                      <tr>
                        <th class="text-center" style="width: 80px; color: #fff; background-color: rgba(105, 108, 255, 0.6);">기안일</th>
                        <td class="small">
                          <c:set var="today" value="<%=new Date()%>"></c:set>
                          <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
                        </td>
                      </tr>
                      <tr>
                        <th class="text-center" style="width: 80px; color: #fff; background-color: rgba(105, 108, 255, 0.6);">문서번호</th>
                        <td class="small">내용</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <!-- 결재선 -->
              <div style="width: 130px;">
                <div class="table-responsive text-nowrap">
                  <table class="table table-bordered" style="background-color: #fff; margin-bottom: 0rem !important">
                    <tbody>
                      <tr>
                        <th class="text-center" rowspan="3" style="width: 30px; height: 122px; color: #fff; background-color: rgba(105, 108, 255, 0.6); writing-mode: vertical-rl; text-orientation: upright; padding: 0.1rem !important;">접 수</th>
                        <td class="small text-center" style="height: 20px; padding: 0.1rem !important">직위</td>
                      </tr>
                      <tr>
                        <td class="small text-center">결재자</td>
                      </tr>
                      <tr>
                        <td class="small text-center" style="height: 20px; padding: 0.1rem !important">결재일</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <hr />
          <!-- 기안서 양식 -->
          <div style="max-width: 100%; height: 500px; background-color: #fff;">
          </div>
          <hr />
          <!-- 버튼 -->
          <div class="text-end">
            <a href="/" class="me-3">
              <i class="menu-icon  bx bx-save"></i>결재요청
            </a>
            <a href="/" class="me-3">
              <i class="menu-icon  bx bx-info-circle"></i>결재정보
            </a>
            <a href="approval" class="me-0">
              <i class="menu-icon  bx bx-chevron-left-circle"></i>돌아가기
            </a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
