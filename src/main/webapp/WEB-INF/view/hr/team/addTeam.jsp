<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인사관리 - GAEnt.</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
    <style>
      .edocForm {
        margin-bottom: 0rem !important;
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

      #teamCode {
        width: 80%;
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
        <!-- 작업 공간 시작 -->
        <h5 class="fs-4 fw-semibold mb-2">부서등록</h5>
        <hr />
        <div class="table-responsive text-nowrap">
          <form action="/gaent/team/addTeam" method="post">
            <table class="table table-bordered edocForm">
              <tbody>
                <tr>
                  <th class="text-center typeDraftThTag">팀 이름</th>
                  <td class="typeDraftTdTag">
                    <input class="form-control form-control-sm" type="text" id="teamName" name="teamName" placeholder="팀 이름을 입력해주세요." required="required"/>
                  </td>
                </tr>
                <tr>
                  <th class="text-center typeDraftThTag">팀 코드</th>
                  <td class="typeDraftTdTag">
                    <input id="teamCode" class="form-control form-control-sm d-inline" type="text" name="teamCode" placeholder="팀 코드를 입력해주세요." maxlength="3" pattern="[0-9]{3}"/>
                    <button type="button" class="btn btn-primary" onclick="checkTeamCode()">중복검사</button>
                  </td>
                  <th class="text-center typeDraftThTag">소속 그룹</th>
                  <td class="typeDraftTdTag">
                    <div class="edoc-type-select-box">
                      <select id="edoc-type" class="form-select form-select-sm" name="parentTeamCode">
                        <option value="10">대표이사</option>
                        <option value="100">인사부</option>
                        <option value="200">경영부</option>
                        <option value="300">기획부</option>
                        <option value="400">홍보부</option>
                        <option value="500">매니지먼트부</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th class="text-center typeDraftThTag">팀 설명</th>
                  <td class="typeDraftTdTag" colspan="3">
                    <textarea class="form-control" rows="12" name="teaDes"></textarea>
                  </td>
                </tr>
              </tbody>
            </table>
            <br />
            <button type="submit" class="btn btn-primary btn-lg">등록하기</button>
            <a href="/gaent/team/addTeam" class="btn btn-primary btn-lg">취소하기</a>
          </form>
        </div>
        <!-- 작업 공간 끝 -->
      </div>
    </div>
    <!-- 부서코드 중복 검사 -->
    <script type="text/javascript">
      $(document).ready(function(){
        if(${!empty msgType}){
          $("#messageType").attr("class", "modal-content panel-warning");
          $("#myMessage").modal("show");
        }
      });
      
      function checkTeamCode(){
        let teamCode=$("#teamCode").val();

        // 정규 표현식을 사용하여 숫자 3자리인지 검사
        let pattern = /^[0-9]{3}$/;

        if (!pattern.test(teamCode)) {
          alert("부서 코드는 3자리 숫자여야 합니다.");
          return; // 검사에 실패하면 함수 종료
        }

        $.ajax({
          url: "/gaent/team/checkTeamCode",
          method: "get",
          data: {
              "teamCode" : teamCode
          },
          success: function(result) {
            // 중복유무 출력(result=1 : 사용할 수 없는 부서코드, 0 : 사용할 수 있는 부서코드)
            if(result == 1) {
              alert("이미 존재하는 부서코드입니다.");
              $("#checkMessage").html("이미 존재하는 부서코드입니다.");
              $("#checkType").attr("class","modal-content panel-success");
            } else {
              alert("사용할 수 있는 부서코드입니다.");
              $("#checkMessage").html("사용할 수 있는 부서코드입니다.");
              $("#checkType").attr("class","modal-content panel-warning");
            }
            $("#myModal").modal("show");
          },
          error: function() {
            alert("작성되지 않은 항목이 있습니다.");
          }
        });
      }
    </script>
  </body>
</html>
