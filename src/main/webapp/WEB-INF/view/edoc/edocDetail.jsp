<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <style>
      .edoc {
        max-width: 100%;
        width: 880px;
        height: 780px;
        overflow-x: hidden;
        overflow-y: auto;
      }

      .edoc-type-select-box {
        width: 200px;
      }

      .edoc-form-info {
        width: 300px;
      }

      .edoc-form-info-table {
        background-color: #fff;
        margin-bottom: 0rem !important;
      }

      .edoc-form-info-table > tbody > tr > th {
        width: 80px;
        color: #fff !important;
        background-color: rgba(105, 108, 255, 0.6);
      }

      .edoc-form-info-table > tbody > tr > td > input {
        border: none;
        outline: none;
      }

      .edoc-form-area {
        background-color: #fff;
        height: 440px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .btn-me {
        margin-right: -1rem !important;
      }
      
      .approverForm {
        width: 130px;
      }
      
      .approverThTag {
        width: 30px;
        height: 122px;
        
        color: #fff !important;
        background-color: rgba(105, 108, 255, 0.6) !important;
        
        writing-mode: vertical-rl;
        text-orientation: upright;
        
        padding: 0.1rem !important;
      }
      
      .approverTdTag {
        height: 20px !important;
        padding: 0.1rem !important;
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
        <jsp:include page="/WEB-INF/view/edoc/edoc-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">
        <div class="edoc">
        <div>
          <div class="mb-3">
            <span id="edoc-form-title" class="display-6 fw-semibold mb-0">${edocDetail.edocFormTitle}</span>
          </div>
          <div class="d-flex justify-content-between">
            <!-- 문서정보 -->
            <div class="edoc-form-info">
              <div class="table-responsive text-nowrap">
                <table class="table table-bordered table-sm edoc-form-info-table">
                  <tbody>
                    <tr>
                      <th class="text-center">기안자</th>
                      <td class="small">
                        <input name="edocKorName" value="${edocDetail.edocWriter}" readonly />
                      </td>
                    </tr>
                    <tr>
                      <th class="text-center">소속</th>
                      <td class="small">
                        <input name="edocRankCode" value="${edocDetail.teamCode}" readonly />
                      </td>
                    </tr>
                    <tr>
                      <th class="text-center">기안일</th>
                      <td class="small">
                        <input name="edocDate" value="${edocDetail.edocEnrollDate}" readonly />
                      </td>
                    </tr>
                    <tr>
                      <th class="text-center">문서번호</th>
                      <td class="small">
                        <input name="edocDate" value="${edocDetail.edocNum}" readonly />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 결재선 -->
            <div class="d-flex">
              <c:choose>
                <c:when test="${edocDetail.apprOrder2 == 2}">
                  <div class="table-responsive text-nowrap approverForm">
                    <table class="table table-bordered" style="background-color: #fff; margin-bottom: 0rem !important">
                      <tbody>
                        <tr>
                          <th id="edocApproverOrder" class="text-center approverThTag" rowspan="3">접 수</th>
                          <td id="edocRankCode" class="small text-center approverTdTag">직위</td>
                        </tr>
                        <tr>
                          <td id="edocKorName" class="small text-center">${edocDetail.approver2}</td>
                        </tr>
                        <tr>
                          <td id="edocApprovalDate" class="small text-center approverTdTag">결재일</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </c:when>
              </c:choose>
              <c:choose>
                <c:when test="${edocDetail.apprOrder1 == 1}">
                  <div class="table-responsive text-nowrap approverForm">
                    <table class="table table-bordered" style="background-color: #fff; margin-bottom: 0rem !important">
                      <tbody>
                        <tr>
                          <th id="edocApproverOrder" class="text-center approverThTag" rowspan="3">접 수</th>
                          <td id="edocRankCode" class="small text-center approverTdTag">직위</td>
                        </tr>
                        <tr>
                          <td id="edocKorName" class="small text-center">${edocDetail.approver1}</td>
                        </tr>
                        <tr>
                          <td id="edocApprovalDate" class="small text-center approverTdTag">결재일</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </c:when>
              </c:choose>
            </div>
          </div>
        </div>
        <hr />
        <!-- 기안서 양식 -->
        <div>
          <div id="edoc-form-type">
            <c:choose>
              <c:when test="${edocDetail.edocType == 0}">
                <jsp:include page="/WEB-INF/view/edoc/edocFormTypeDraft.jsp"></jsp:include>
              </c:when>
              <c:otherwise>
                <div class="edoc-form-area">양식을 선택해주세요.</div>
              </c:otherwise>
            </c:choose>
          </div>
          <hr />
          <!-- 버튼 -->
          <div class="text-end">
            <button class="btn btn-link btn-me" type="submit">
              <i class="menu-icon bx bx-check-square"></i>결재
            </button>
            <button class="btn btn-link btn-me" data-bs-toggle="modal" data-bs-target="#modalScrollable" type="button">
              <i class="menu-icon bx bx-exit"></i>반려
            </button>
            <a href="javascript:history.back()" class="btn btn-link btn-me">
              <i class="menu-icon bx bx-chevron-left-circle"></i>돌아가기
            </a>
          </div>
        </div>
        </div>
      </div>
    </div>
  </body>
</html>