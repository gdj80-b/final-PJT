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
          <form method="post" action="approver/edoc">
            <div class="d-flex mb-3">
              <span class="display-6 fw-semibold me-3">기안하기</span>
              <div class="edoc-type-select-box">
                <select id="edoc-type" class="form-select form-select-sm" name="edocType">
                  <option value="">양식을 선택해주세요.</option>
                </select>
              </div>
            </div>
            <hr />
            <div>
              <div class="mb-3">
                <span id="edoc-form-title" class="display-6 fw-semibold mb-0">전자문서양식</span>
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
                            <input name="edocKorName" value="${loginInfo.korName}" readonly />
                            <input type="hidden" name="edocWriter" value="${loginInfo.empCode}" readonly />
                          </td>
                        </tr>
                        <tr>
                          <th class="text-center">소속</th>
                          <td class="small">
                            <input name="edocRankCode" value="${loginInfo.rankCode}" readonly />
                          </td>
                        </tr>
                        <tr>
                          <th class="text-center">기안일</th>
                          <td class="small">
                            <input name="edocDate" value="${date}" readonly />
                          </td>
                        </tr>
                        <tr>
                          <th class="text-center">문서번호</th>
                          <td class="small"></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <!-- 결재선 -->
                <div class="d-flex">
                  <div id="edoc-approver-one" class="me-2"></div>
                  <div id="edoc-approver-two"></div>
                </div>
              </div>
            </div>
            <hr />
            <!-- 기안서 양식 -->
            <div>
              <div id="edoc-form-type">
                <div class="edoc-form-area">양식을 선택해주세요.</div>
              </div>
              <hr />
              <!-- 버튼 -->
              <div class="text-end">
                <button class="btn btn-link btn-me" type="submit">
                  <i class="menu-icon bx bx-save"></i>결재요청
                </button>
                <button class="btn btn-link btn-me" data-bs-toggle="modal" data-bs-target="#modalScrollable" type="button">
                  <i class="menu-icon bx bx-info-circle"></i>결재정보
                </button>
                <a href="approval" class="btn btn-link btn-me">
                  <i class="menu-icon bx bx-chevron-left-circle"></i>돌아가기
                </a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script>
      $.ajax({
        url: '/gaent/edocType',
        method: 'GET',
        success: function (data) {
          // console.log(data);
          data.forEach(function (el) {
            // console.log(el);
            $('#edoc-type').append('<option value="' + el.edocType + '">' + el.edocFormTitle + '</option>');
          });
        },
        error: function (error) {
          console.log(error);
        },
      });

      $('#edoc-type').change(function () {
        if ($('#edoc-type').val() == '') {
          $('#edoc-form-type').empty();
          $('#edoc-form-type').append(
            '<div class="edoc-form-area">양식을 선택해주세요.</div>'
          );
          return;
        } else if ($('#edoc-type').val() == '0') {
          $.ajax({
            url: '/gaent/edoc/0',
            method: 'GET',
            success: function (data) {
              console.log(data);
              $('#edoc-form-title').empty();
              $('#edoc-form-title').append('기안서');
              $('#edoc-form-type').empty();
              $('#edoc-form-type').append(data);
            },
            error: function (error) {
              console.log(error);
            },
          });
        }
      });

      $.ajax({
        url: '/gaent/getApprover',
        method: 'GET',
        success: function (data) {
          $('#approver-modal').empty();
          $('#approver-modal').append(data);
        },
        error: function (error) {
          console.log(error);
        },
      });
    </script>
    <!-- 모달 -->
    <div id="approver-modal"></div>
  </body>
</html>
