<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인사관리 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <style>
      .emp {
        height: 50rem;
        overflow-y: auto;
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
      
      .input-form-group {
        width: 54rem !important;
      }
      
      .imgPreview {
        width: 7.5rem;
        height: 10rem;
        background-color: #f0f0f0;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #ddd;
        margin-bottom: 10px;
        overflow: hidden;
        cursor: pointer;
      }
      
      .removeIngBtn input {
        width: 7.5rem;
        height: 1.6rem;
      }
      
      .imgPreview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      
      .imgPreview span {
        cursor: pointer;
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
      <div id="workspace-area" class="subsidebar-from-workspace emp">
        <!-- 작업 공간 시작 -->
        <h5 class="fs-4 fw-semibold mb-2">직원수정</h5>
        <hr />
        <div class="table-responsive text-nowrap">
          <form id="empInputForm" class="input-form-group" enctype="multipart/form-data">
            <table class="table">
              <tr>
                <th><label for="profile">사진</label></th>
                <td colspan="2">
                  <div class="imgPreview" id="imgPreview"><img src="${pageContext.request.contextPath}/upload/profile/${empDetail.profile}" alt="imgPreview"></div>
                  <div class="removeIngBtn">
                    <input class="form-control" type="file" id="profile" name="gaFile" style="display: none;">
                    <input class="form-control" type="text" name="updateFileName" value="${empDetail.profile}" style="display: none;">
                    <input class="btn btn-outline-secondary" id="removeImgBtn" value="삭제">
                  </div>
                </td>
              </tr>
              <tr>
                <th><label for="korName">이름(국문)</label></th>
                <td colspan="2"><input class="form-control" type="text" id="korName" name="korName" value="${empDetail.korName}" placeholder="이름을 입력해주세요." readonly></td>
              </tr>
              <tr>
                <th><label for="engName">이름(영문)</label></th>
                <td><input class="form-control" type="text" id="engName" name="lastEngName" value="${lastEngName}" placeholder="Last Name" readonly></td>
                <td><input class="form-control" type="text" id="" name="firstEngName" value="${firstEngName}" placeholder="First Name" readonly></td>
              </tr>
              <tr>
                <th><label for="empCode">사원코드</label></th>
                <td><input class="form-control" type="text" id="empCode" name="empCode" value="${empDetail.empCode}" placeholder="사원코드를 입력해주세요." readonly></td>
                <td></td>
              </tr>
              <tr>
                <th><label for="teamCode">팀코드</label></th>
                <td colspan="2">
                  <select class="form-select form-select" id="teamCode" name="teamCode">
                    <c:choose>
                      <c:when test="${(empDetail.teamCode).equals('100')}">
                        <option value="100" selected>인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('110')}">
                        <option value="100">인사부</option>
                        <option value="110" selected>인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('200')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200" selected>경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('210')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210" selected>경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('220')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220" selected>경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('300')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300" selected>기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('310')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310" selected>기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('320')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320" selected>기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('400')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400" selected>홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('410')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410" selected>홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('420')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420" selected>홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('500')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500" selected>매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('510')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510" selected>매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:when test="${(empDetail.teamCode).equals('520')}">
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520" selected>매니지먼트부 / 스타일팀</option>
                      </c:when>
                      <c:otherwise>
                        <option value="100">인사부</option>
                        <option value="110">인사부 / 인사팀</option>
                        <option value="200">경영부</option>
                        <option value="210">경영부 / 경영팀</option>
                        <option value="220">경영부 / 회계팀</option>
                        <option value="300">기획부</option>
                        <option value="310">기획부 / 제작팀</option>
                        <option value="320">기획부 / 기획팀</option>
                        <option value="400">홍보부</option>
                        <option value="410">홍보부 / 홍보팀</option>
                        <option value="420">홍보부 / 영업팀</option>
                        <option value="500">매니지먼트부</option>
                        <option value="510">매니지먼트부 / 매니지먼트팀</option>
                        <option value="520">매니지먼트부 / 스타일팀</option>
                        <option value="10" selected>국정원</option>
                      </c:otherwise>
                    </c:choose>
                  </select>
                </td>
              </tr>
              <tr>
                <th><label for="rankCode">직위코드</label></th>
                <td colspan="2">
                  <select class="form-select form-select" id="rankCode" name="rankCode">
                    <c:choose>
                      <c:when test="${(empDetail.rankCode).equals('0')}">
                        <option value="5">사원</option>
                        <option value="4">대리</option>
                        <option value="3">팀장</option>
                        <option value="2">부장</option>
                        <option value="0" selected>아티스트</option>
                        <option value="1">대표</option>
                      </c:when>
                      <c:when test="${(empDetail.rankCode).equals('1')}">
                        <option value="5">사원</option>
                        <option value="4">대리</option>
                        <option value="3">팀장</option>
                        <option value="2">부장</option>
                        <option value="0">아티스트</option>
                        <option value="1" selected>대표</option>
                      </c:when>
                      <c:when test="${(empDetail.rankCode).equals('2')}">
                        <option value="5">사원</option>
                        <option value="4">대리</option>
                        <option value="3">팀장</option>
                        <option value="2" selected>부장</option>
                        <option value="0">아티스트</option>
                        <option value="1">대표</option>
                      </c:when>
                      <c:when test="${(empDetail.rankCode).equals('3')}">
                        <option value="5">사원</option>
                        <option value="4">대리</option>
                        <option value="3" selected>팀장</option>
                        <option value="2">부장</option>
                        <option value="0">아티스트</option>
                        <option value="1">대표</option>
                      </c:when>
                      <c:when test="${(empDetail.rankCode).equals('4')}">
                        <option value="5">사원</option>
                        <option value="4" selected>대리</option>
                        <option value="3">팀장</option>
                        <option value="2">부장</option>
                        <option value="0">아티스트</option>
                        <option value="1">대표</option>
                      </c:when>
                      <c:when test="${(empDetail.rankCode).equals('5')}">
                        <option value="5" selected>사원</option>
                        <option value="4">대리</option>
                        <option value="3">팀장</option>
                        <option value="2">부장</option>
                        <option value="0">아티스트</option>
                        <option value="1">대표</option>
                      </c:when>
                    </c:choose>
                  </select>
                </td>
              </tr>
              <tr>
                <th><label for="email">이메일(ID)</label></th>
                <td colspan="2"><input class="form-control" type="text" id="email" name="empId" value="${empDetail.empId}" placeholder="이메일을 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="password">비밀번호</label></th>
                <td colspan="2"><input class="form-control" type="password" id="password" name="empPw" value="${empDetail.empPw}" placeholder="비밀번호를 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="regNo">주민등록번호</label></th>
                <td><input class="form-control" type="text" id="regNo" name="firstRegNo" value="${firstRegNo}" placeholder="주민번호 앞 6자리" readonly></td>
                <td><input class="form-control" type="text" id="" name="lastRegNo" value="${lastRegNo}" placeholder="주민번호 뒷 7자리" readonly></td>
              </tr>
              <tr>
                <th><label for="gender">성별</label></th>
                <td colspan="2">
                  <select class="form-select form-select" id="gender" name="gender">
                    <c:choose>
                      <c:when test="${(empDetail.gender).equals('남자')}">
                        <option value="남자" selected>남자</option>
                        <option value="여자">여자</option>
                      </c:when>
                      <c:otherwise>
                        <option value="남자">남자</option>
                        <option value="여자" selected>여자</option>
                      </c:otherwise>
                    </c:choose>
                  </select>
                </td>
              </tr>
              <tr>
                <th><label for="phone">연락처</label></th>
                <td colspan="2"><input class="form-control" type="text" id="phone" name="phone" value="${empDetail.phone}" placeholder="하이픈('-')을 제외한 숫자만 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="relation">비상연락처</label></th>
                <td>
                  <select class="form-select form-select" id="relation" name="emergencyPhoneRelation">
                    <c:choose>
                      <c:when test="${(empDetail.emergencyPhoneRelation).equals('가족')}">
                        <option value="가족" selected>가족</option>
                        <option value="친구">친구</option>
                        <option value="기타">기타</option>
                      </c:when>
                      <c:when test="${(empDetail.emergencyPhoneRelation).equals('친구')}">
                        <option value="가족">가족</option>
                        <option value="친구" selected>친구</option>
                        <option value="기타">기타</option>
                      </c:when>
                      <c:when test="${(empDetail.emergencyPhoneRelation).equals('기타')}">
                        <option value="가족">가족</option>
                        <option value="친구">친구</option>
                        <option value="기타" selected>기타</option>
                      </c:when>
                    </c:choose>
                  </select>
                </td>
                <td><input class="form-control" type="text" id="" name="emergencyPhone" value="${empDetail.emergencyPhone}" placeholder="하이픈('-')을 제외한 숫자만 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="ext">내선번호</label></th>
                <td colspan="2"><input class="form-control" type="text" id="ext" name="ext" value="${empDetail.ext}" placeholder="내선번호 4자리를 입력해주세요."></td>
              </tr>
              <tr>
                <th rowspan="3"><label for="postCode">주소</label></th>
                <td><input class="form-control" type="text" id="postCode" name="postCode" value="${empDetail.postCode}" placeholder="우편번호" readonly></td>
                <td><input class="form-control" type="button" onclick="daumPostCode()" value="우편번호 찾기"></td>
                <tr>
                  <td colspan="2"><input class="form-control" type="text" id="address" name="address" value="${empDetail.address}" placeholder="주소"></td>
                <tr>
                  <td colspan="2"><input class="form-control" type="text" id="detailAddress" name="detailAddress" value="${empDetail.detailAddress}" placeholder="상세주소"></td>
              </tr>
              <tr>
                <th><label for="leave">총연차</label></th>
                <td colspan="2"><input class="form-control" type="number" id="leave" name="leave" value="${empDetail.totalLeave}" placeholder="총 연차를 입력해주세요." readonly></td>
              </tr>
              <tr>
                <th><label for="hireDate">입사일</label></th>
                <td colspan="2">
                  <input class="form-control" type="date" id="hireDate" name="hireDate" value="${empDetail.hireDate}" placeholder="입사일을 입력해주세요." readonly>
                  <input class="form-control" type="hidden" id="modifier" name="modifier" value="${loginInfo.empCode}">
                </td>
              </tr>
            </table>
            <br />
            <button type="submit" class="btn btn-outline-primary">수정</button>
            <button onclick="" class="btn btn-outline-secondary">취소</button>
          </form>
        </div>
        <!-- 작업 공간 끝 -->
      </div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      $('#empInputForm').submit(function(e) {
        e.preventDefault();
        let formData = new FormData($('#empInputForm')[0]);
        let empCode = $('#empCode').val();
        
        $.ajax({
          url: '/gaent/hr/modifyEmp',
          type: 'POST',
          data: formData,
          contentType: false,
          processData: false,
          success: function(response){
            alert('성공');
            $('#empInputForm')[0].reset();
            window.location.href = '/gaent/hr/empDetail/' + empCode;
          },
          error: function(){
            alert('실패');
          }
        });
      });
    
      function daumPostCode() {
        new daum.Postcode({
          oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수
        
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById('address').value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('detailAddress').focus();
          }
        }).open();
      }
      
      $(document).ready(function() {
        $('#imgPreview').on('click', function() {
          $('#profile').click();
        });
          
        $('#profile').on('change', function() {
          const file = this.files[0];
            if (file) {
              const reader = new FileReader();
              reader.onload = function(event) {
                $('#imgPreview').html('<img src="' + event.target.result + '" alt="imgPreview">');
              }
              reader.readAsDataURL(file);
            } else {
              $('#imgPreview').html('<span>선택</span>');
            }
          });

          $('#removeImgBtn').on('click', function() {
            $('#profile').val('');
            $('#imgPreview').html('<span>선택</span>');
          });
      });
    </script>
  </body>
</html>
