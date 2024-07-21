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
        height: 60rem;
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
        <h5 class="fs-4 fw-semibold mb-2">직원등록</h5>
        <hr />
        <div class="table-responsive text-nowrap">
          <form action="/gaent/team/addEmp" method="post" class="input-form-group">
            <table class="table">
              <tr>
                <th><label for="profile">사진</label></th>
                <td colspan="2">
                  <div class="imgPreview" id="imgPreview"><span>선택</span></div>
                  <div class="removeIngBtn">
                    <input class="form-control" type="file" id="profile" name="profile" style="display: none;">
                    <input class="btn btn-outline-secondary" id="removeImgBtn" value="삭제">
                  </div>
                </td>
              </tr>
              <tr>
                <th><label for="korName">이름(국문)</label></th>
                <td colspan="2"><input class="form-control" type="text" id="korName" name="korName" value="" placeholder="이름을 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="engName">이름(영문)</label></th>
                <td><input class="form-control" type="text" id="engName" name="engLastName" value="" placeholder="Last Name"></td>
                <td><input class="form-control" type="text" id="" name="engFirstName" value="" placeholder="First Name"></td>
              </tr>
              <tr>
                <th><label for="empCode">사원코드</label></th>
                <td><input class="form-control" type="text" id="empCode" name="empCode" value="" placeholder="사원코드를 입력해주세요."></td>
                <td><button class="btn btn-secondary">중복검사</button></td>
              </tr>
              <tr>
                <th><label for="teamCode">팀코드</label></th>
                <td colspan="2">
                  <select class="form-select form-select" id="teamCode">
                    <option disabeld selected hidden>팀코드를 선택해주세요.</option>
                    <option value="1">인사팀</option>
                    <option value="2">경영팀</option>
                    <option value="3">회계팀</option>
                    <option value="4">기획팀</option>
                    <option value="5">제작팀</option>
                    <option value="6">홍보팀</option>
                    <option value="7">영업팀</option>
                    <option value="8">매니지먼트팀</option>
                    <option value="9">스타일팀</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th><label for="teamCode">직위코드</label></th>
                <td colspan="2">
                  <select class="form-select form-select" id="teamCode">
                    <option disabeld selected hidden>직위코드를 선택해주세요.</option>
                    <option value="1">사원</option>
                    <option value="2">대리</option>
                    <option value="3">팀장</option>
                    <option value="4">부장</option>
                    <option value="5">아티스트</option>
                    <option value="6">대표</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th><label for="email">이메일(ID)</label></th>
                <td colspan="2"><input class="form-control" type="text" id="email" name="email" value="" placeholder="이메일을 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="password">비밀번호</label></th>
                <td colspan="2"><input class="form-control" type="password" id="password" name="password" value="" placeholder="비밀번호를 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="regNo">이메일(ID)</label></th>
                <td><input class="form-control" type="text" id="regNo" name="firstRegNo" value="" placeholder="주민번호 앞 6자리"></td>
                <td><input class="form-control" type="text" id="" name="lastRegNo" value="" placeholder="주민번호 뒷 7자리"></td>
              </tr>
              <tr>
                <th><label for="gender">성별</label></th>
                <td colspan="2">
                  <select class="form-select form-select" id="teamCode">
                    <option disabeld selected hidden>성별을 선택해주세요.</option>
                    <option value="1">여자</option>
                    <option value="2">남자</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th><label for="phone">연락처</label></th>
                <td colspan="2"><input class="form-control" type="text" id="phone" name="phone" value="" placeholder="하이픈('-')을 제외한 숫자만 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="relation">비상연락처</label></th>
                <td>
                  <select class="form-select form-select" id="relation">
                    <option disabeld selected hidden>관계를 선택해주세요.</option>
                    <option value="1">가족</option>
                    <option value="2">친구</option>
                    <option value="3">기타</option>
                  </select>
                </td>
                <td><input class="form-control" type="text" id="" name="relationPhone" value="" placeholder="하이픈('-')을 제외한 숫자만 입력해주세요."></td>
              </tr>
              <tr>
                <th><label for="ext">내선번호</label></th>
                <td colspan="2"><input class="form-control" type="text" id="ext" name="ext" value="" placeholder=""></td>
              </tr>
              <tr>
                <th rowspan="3"><label for="postCode">주소</label></th>
                <td><input class="form-control" type="text" id="postCode" name="postCode" value="" placeholder="우편번호" readonly></td>
                <td><input class="form-control" type="button" onclick="daumPostCode()" value="우편번호 찾기"></td>
                <tr>
                  <td colspan="2"><input class="form-control" type="text" id="address" placeholder="주소"></td>
                <tr>
                  <td colspan="2"><input class="form-control" type="text" id="detailAddress" placeholder="상세주소"></td>
              </tr>
              <tr>
                <th><label for="leave">총연차</label></th>
                <td><input class="form-control" type="number" id="leave" name="leave" value="" placeholder="총 연차를 입력해주세요." readonly></td>
                <td><input class="form-control" type="button" id="leaveBtn" value="읽기전용 해제"></td>
              </tr>
            </table>
            <br />
            <button type="submit" class="btn btn-outline-primary">등록</button>
            <button onclick="" class="btn btn-outline-secondary">취소</button>
          </form>
        </div>
        <!-- 작업 공간 끝 -->
      </div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
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
        $('#leaveBtn').on('click', function() {
          if ($('#leave').attr('readonly')) {
            $('#leave').removeAttr('readonly');
          } else {
            $('#leave').attr('readonly', 'readonly');
          }
        });
        
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
              $('#imgPreview').html('<span>사진 없음</span>');
            }
          });

          $('#removeImgBtn').on('click', function() {
            $('#profile').val('');
            $('#imgPreview').html('<span>사진 없음</span>');
          });
      });
    </script>
  </body>
</html>
