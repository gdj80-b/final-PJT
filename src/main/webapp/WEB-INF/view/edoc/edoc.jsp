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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/edoc.css"/>
    <!-- 조직도 관련 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css"/>
    <style>
      
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
                <button id="approverModal" class="btn btn-link btn-me" data-bs-toggle="modal" data-bs-target="#approvalModalOrgChart" type="button">
                  <i class="menu-icon bx bx-info-circle"></i>결재정보
                </button>
                <!-- 결재선 정보 모달 시작 -->
                <div class="modal fade" id="approvalModalOrgChart" tabindex="-1" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="modalCenterTitle">결재선 선택</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                      </div>
                      <div class="modal-body d-flex justify-content-between">
                        <div class="approverInfo">
                          <div id="orgChart"></div>
                        </div>
                        <div class="approverInput d-flex flex-column align-items-start ps-4">
                          <h5>결재선</h5>
                          <div class="d-flex flex-column align-items-start mb-3">
                            <label for="firstApprover">1차 결재자</label>
                            <div class="d-flex">
                              <input class="form-control form-control-sm w-75 me-2" type="text" name="firstApprover" id="firstApprover" readonly>
                              <button type="button" class="btn btn-outline-primary btn-sm w-25">초기화</button>
                            </div>
                          </div>
                          <div class="d-flex flex-column align-items-start">
                            <label for="secondApprover">2차 결재자</label>
                            <div class="d-flex">
                              <input class="form-control form-control-sm w-75 me-2" type="text" name="secondApprover" id="firstApprover" readonly>
                              <button type="button" class="btn btn-outline-primary btn-sm w-25">초기화</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary" onclick="addApprover()" data-bs-dismiss="modal">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 결재선 정보 모달 끝 -->
                <a href="approval" class="btn btn-link btn-me">
                  <i class="menu-icon bx bx-chevron-left-circle"></i>돌아가기
                </a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <script>
      $(document).ready(function() {
        selectType();
        
        $('#orgChart').jstree({
          'core' : {
            'data' : {
              'url' : '/gaent/hr/tree',
              'dataType' : 'json'
            },
            'themes' : {
              'icons' : true,
              'dots' : true,
              'responsive' : true
            },
            'expand_all' : true,
          },
          'plugins' : [ 'themes', 'json_data', 'state' ]
        });
        
        $('#orgChart').on('select_node.jstree', function(e, data) {
          e.preventDefault(); // 기본 이벤트 동작 막기
          
          let nodeId = data.node.id;
          
          // 인풋에 코드가 아닌 이름이 들어가고
          // 1차는 필수로 들어가게
          
          $('#firstApprover').val(nodeId);
          $('#secondApprover').val(nodeId);
          
          // 선택된 노드 해제
          $('#orgChart').jstree(true).deselect_node(nodeId);
        });
      });
      
      function selectType() {
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
            let edocType = $('#edoc-type').val();
            
            if (edocType == '') {
              $('#edoc-form-type').empty().append('<div class="edoc-form-area">양식을 선택해주세요.</div>');
              return;
            }
          
            let url = '/gaent/edoc/' + edocType;
            let title = '';
            
            switch (edocType) {
              case '0':
                title = '기안서';
                break;
              case '1':
                title = '휴가신청서';
                break;
              case '2':
                title = '지출결의서';
                break;
              case '3':
                title = '경조사 지출결의서';
                break;
              case '4':
                title = '보고서';
                break;
            }
            
            $.ajax({
              url: url,
              method: 'GET',
              success: function (data) {
                console.log(data);
                $('#edoc-form-title').text(title);
                $('#edoc-form-type').empty().append(data);
              },
              error: function (error) {
                console.log(error);
              },
            });
          });
      }
    </script>
  </body>
</html>
