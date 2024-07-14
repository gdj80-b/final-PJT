<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전자결재 - GAEnt.</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/commonAjax.js"/>
    <style>
      .edoc-form-area {
        background-color: #fff;
        height: 440px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
    
      .btn-me{
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
        <div style="max-width: 100%; width: 880px; height: 780px; overflow-x: hidden; overflow-y: auto">
          <div class="d-flex mb-3">
            <span class="display-6 fw-semibold me-3">기안하기</span>
            <div style="width: 200px;">
              <select id="edoc-type" class="form-select form-select-sm">
                <option value="">양식을 선택해주세요.</option>
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
                        <td class="small"></td>
                      </tr>
                      <tr>
                        <th class="text-center" style="width: 80px; color: #fff; background-color: rgba(105, 108, 255, 0.6);">문서번호</th>
                        <td class="small"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <!-- 결재선 -->
              <div>
                <jsp:include page="/WEB-INF/view/edoc/edocApprover.jsp"></jsp:include>
              </div>
            </div>
          </div>
          <hr />
          <!-- 기안서 양식 -->
          <div>
            <form method="post" action="approval/edoc/${edocType}">
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
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 기안서 양식 -->
    <script>
        $.ajax({
          url: '/gaent/edocType',
          method: 'GET',
          success: function(data) {
            // console.log(data);
            data.forEach(function(el) {
              // console.log(el);
              $('#edoc-type').append('<option value="' + el.edocType + '">' + el.edocFormTitle + '</option>');
            });
          },
          error: function(error) {
            console.log(error);
          }
        });
        
        $('#edoc-type').change(function() {
          if($('#edoc-type').val() == '') {
            $('#edoc-form-type').empty();
            $('#edoc-form-type').append('<div class="edoc-form-area">양식을 선택해주세요.</div>');
            return;
          } else if($('#edoc-type').val() == '0') {
            $.ajax({
              url: '/gaent/edoc/0',
              method: 'GET',
              success: function(data) {
                $('#edoc-form-type').empty();
                $('#edoc-form-type').append(data);
              },
              error: function(error) {
                console.log(error);
              }
            });
          }
        });
        
        $.ajax({
          url: '/gaent/getApprover',
          method: 'GET',
          success: function(data) {
            $('#approver-modal').empty();
            $('#approver-modal').append(data);
          },
          error: function(error) {
            console.log(error);
          }
        });
    </script>
    <div id="approver-modal"></div>
  </body>
</html>