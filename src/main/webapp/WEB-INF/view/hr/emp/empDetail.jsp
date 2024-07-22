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
      .img-box {
        width: 120px;
        height: 160px;
        background-color: rgba(105, 108, 255, 0.6);
      }
      
      .img-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
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
        <div class="d-flex align-items-center justify-content-between">
          <h5 class="fs-4 fw-semibold mb-2">인사정보</h5>
          <div>
            <a href="/gaent/hr/modifyEmp/${empDetail.empCode}" class="btn btn-outline-primary">수정</a>
            <a class="btn btn-outline-danger">삭제</a>
          </div>
        </div>
        <hr />
        <!-- 인사정보 -->
        <div class="card mb-3">
          <div class="table-responsive text-nowrap">
            <table class="table table-hover">
              <tr>
                <td rowspan="6">
                  <div class="img-box mx-auto"><img src="${pageContext.request.contextPath}/upload/profile/${empDetail.profile}"></div>
                </td>
              </tr>
              <tr>
                <th>이름(국문)</th>
                <td><span>${empDetail.korName}</span></td>
                <th>이름(영문)</th>
                <td><span class="text-uppercase">${empDetail.engName}</span></td>
              </tr>
              <tr>
                <th>소속</th>
                <td colspan="3"><span>${empDetail.teamName}(${empDetail.teamCode})</span></td>
              </tr>
              <tr>
                <th>사번</th>
                <td><span>${empDetail.empCode}</span></td>
                <th>내선번호</th>
                <td><span>${empDetail.ext}</span></td>
              </tr>
              <tr>
                <th>이메일</th>
                <td><span>${empDetail.empId}</span></td>
                <th>휴대번호</th>
                <td><span>${empDetail.phone}</span></td>
              </tr>
              <tr>
                <th>직위 / 직책</th>
                <td><span>${empDetail.rankCode}</span></td>
                <th>대표전화</th>
                <td><span></span></td>
              </tr>
            </table>
          </div>
        </div>
        <!-- 기타 개인정보 -->
        <div class="card mb-3">
          <div class="table-responsive text-nowrap">
            <table class="table table-hover">
              <tr>
                <th>생년월일</th>
                <td><span>${empDetail.birth}</span></td>
                <th>나이</th>
                <td><span>${empDetail.age}</span></td>
                <th>성별</th>
                <td><span>${empDetail.gender}</span></td>
              </tr>
              <tr>
                <th>입사일</th>
                <td><span>${empDetail.hireDate}</span></td>
                <th>퇴사일</th>
                <td><span>${empDetail.resignDate}</span></td>
                <th>상태</th>
                <td><span></span></td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>