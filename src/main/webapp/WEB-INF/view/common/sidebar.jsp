<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>
<link
  rel="icon"
  type="image/x-icon"
  href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico"
/>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
  href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
  rel="stylesheet"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/vendor/css/core.css"
  class="template-customizer-core-css"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/vendor/css/theme-default.css"
  class="template-customizer-theme-css"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/css/demo.css"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apex-charts.css"
/>
<script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/css/sidebar.css"
/>
<body>
  <aside
    id="layout-menu"
    class="layout-menu menu-vertical menu bg-menu-theme side-nav"
  >
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/home') ? 'active' : '' }"
      >
        <a href="/gaent/home" class="menu-link">
          <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <span>홈</span>
        </a>
      </li>
      <!-- 쪽지함 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/msg') ? 'active' : '' }"
      >
        <a href="/gaent/msg/1" class="menu-link">
          <i class="menu-icon tf-icons bx bx-envelope"></i>
          <span>쪽지함</span>
        </a>
      </li>
      <!-- 채팅 -->
      <!-- <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/chat') ? 'active' : '' }">
                <a href="/gaent/chat" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-message"></i> <span>채팅</span>
                </a>
            </li> -->
      <!-- 캘린더 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/calendar') ? 'active' : '' }"
      >
        <a href="/gaent/calendar" class="menu-link">
          <i class="menu-icon tf-icons bx bx-calendar"></i>
          <span>캘린더</span>
        </a>
      </li>
      <!-- 근태관리 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/attendance') && !fn:contains(pageContext.request.requestURI, 'team') ? 'active' : '' }" >
        <a href="/gaent/atd" class="menu-link">
          <i class="menu-icon tf-icons bx bx-pie-chart-alt"></i>
          <span>근태관리</span>
        </a>
      </li>
      <!-- 직원조회 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/inquiry') ? 'active' : '' }"
      >
        <a href="/gaent/inquiry/teamList" class="menu-link">
          <i class="menu-icon tf-icons bx bx-archive"></i>
          <span>직원조회</span>
        </a>
      </li>
      <!-- 전자결재 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/edoc') ? 'active' : '' }"
      >
        <a href="/gaent/approval" class="menu-link">
          <i class="menu-icon tf-icons bx bx-briefcase"></i>
          <span>전자결재</span>
        </a>
      </li>
      <!-- 공지사항 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/notice') ? 'active' : '' }"
      >
        <a href="/gaent/board" class="menu-link">
          <i class="menu-icon tf-icons bx bx-conversation"></i>
          <span>소통공간</span>
        </a>
      </li>
      <!-- 사내구매 -->
      <li
        class="menu-item ${fn:contains(pageContext.request.requestURI, '/product') ? 'active' : '' }"
      >
        <a href="/gaent/prod" class="menu-link">
          <i class="menu-icon tf-icons bx bx-cart"></i> <span>사내구매</span>
        </a>
      </li>
      <!-- 관리자 -->
      <li class="menu-header small text-uppercase">
        <span class="menu-header-text">관리자 메뉴</span>
      </li>
      <!-- 인사관리 -->
      <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/hr/hr') ? 'active' : '' }">
        <a href="/gaent/hr" class="menu-link">
          <i class="menu-icon tf-icons bx bx-user"></i> <span>인사관리</span>
        </a>
      </li>
      <!-- 부서 근태관리 -->
      <li class="menu-item ${fn:contains(pageContext.request.requestURI, '/team/teamAtdStatus') ? 'active' : '' }">
        <a href="/gaent/team/atd" class="menu-link">
          <i class="menu-icon tf-icons bx bx-pie-chart-alt"></i>
          <span>부서 근태현황</span>
        </a>
      </li>
      <!-- 사내구매 현황 -->
      <!-- <li class="menu-item">
                <a href="/gaent/" class="menu-link"> 
                    <i class="menu-icon tf-icons bx bx-cart"></i> <span>사내구매 현황</span>
                </a>
            </li> -->
    </ul>
  </aside>
  <script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/dashboards-analytics.js"></script>
  <script>
    $(document).ready(function () {
      $('#myPageEmpPasswordCheck').on('input', checkPasswords);
      $('#myPageEmpPassword').on('input', checkPasswords);

      checkPasswords();

      $('#modalCloseTopBtn').on('click', function () {
        $('#myPageInputForm')[0].reset();
        $('#passMessage').html('');
      });

      $('#modalCloseBottomBtn').on('click', function () {
        $('#myPageInputForm')[0].reset();
        $('#passMessage').html('');
      });

      $('#myPageInputForm').submit(function (e) {
        e.preventDefault();

        if (!$('#myPageEmpPassword').val()) {
          alert('비밀번호를 입력해주세요.');
          return;
        } else if (!$('#myPageEmpPasswordCheck').val()) {
          alert('비밀번호가 일치하지 않습니다.');
          return;
        }

        let formData = new FormData($('#myPageInputForm')[0]);

        $.ajax({
          url: '/gaent/modifyMyPageInfo',
          type: 'POST',
          data: formData,
          contentType: false,
          processData: false,
          success: function (data) {
            console.log(data);
            alert('성공');
            $('#myPageInputForm')[0].reset();
            window.location.reload();
          },
          error: function (e) {
            console.log(e);
            alert('실패');
          },
        });
      });
    });

    function checkPasswords() {
      $('#myPageEmpPasswordCheck').on('input', function () {
        let pw1 = $('#myPageEmpPassword').val();
        let pw2 = $('#myPageEmpPasswordCheck').val();

        if (pw1 !== pw2) {
          $('#passMessage')
            .html('비밀번호가 서로 일치하지 않습니다.')
            .css('color', 'red');
        } else {
          $('#passMessage')
            .html('비밀번호가 일치합니다.')
            .css('color', 'green');
        }
      });
    }

    function getMyProfileInfo() {
      $.ajax({
        url: '/gaent/myPage',
        type: 'GET',
        data: {
          empCode: '${loginInfo.empCode}',
        },
        success: function (data) {
          // console.log(data);
          $('#checkResultMsg').text(data);
          $('#imgPreview').html(
            '<img src="${pageContext.request.contextPath}/upload/profile/' +
              data.profile +
              '" alt="imgPreview">'
          );
          $('#myPageKorName').text(data.korName);
          $('#myPageAge').text(data.age);
          let tmpbirth = data.birth;
          let birth =
            tmpbirth.slice(0, 4) +
            '-' +
            tmpbirth.slice(4, 6) +
            '-' +
            tmpbirth.slice(6, 8);
          $('#myPageBirth').text(birth);
          $('#myPageTeamName').text(data.teamName);
          $('#myPageRankName').text(data.rankName);
          $('#myPageEmpId').val(data.empId);
          let tmpphone = data.phone;
          let phone =
            tmpphone.slice(0, 3) +
            '-' +
            tmpphone.slice(3, 7) +
            '-' +
            tmpphone.slice(7, 11);
          $('#myPagePhone').val(phone);
        },
        error: function (e) {
          alert(e);
        },
      });
    }

    function idCheck() {
      let checkEmpId = $('#myPageEmpId').val();

      $.ajax({
        url: '/gaent/hr/checkEmpId',
        type: 'GET',
        data: {
          empId: checkEmpId,
        },
        success: function (data) {
          $('#checkResultMsg').text(data);
          $('#checkModal').modal('show');
          console.log(data);
        },
        error: function (e) {
          alert(e);
        },
      });
    }

    function showMyPage() {
      let myEmpCode = $('#myEmpCode').val();
      $('#myPageModal').modal('show');

      $.ajax({
        url: '/gaent/myPage',
        type: 'GET',
        data: {
          empCode: myEmpCode,
        },
        success: function (data) {
          // console.log(data);
          $('#checkResultMsg').text(data);
          $('#imgPreview').html(
            '<img src="${pageContext.request.contextPath}/upload/profile/' +
              data.profile +
              '" alt="imgPreview">'
          );
          $('#myPageKorName').text(data.korName);
          $('#myPageAge').text(data.age);
          let tmpbirth = data.birth;
          let birth =
            tmpbirth.slice(0, 4) +
            '-' +
            tmpbirth.slice(4, 6) +
            '-' +
            tmpbirth.slice(6, 8);
          $('#myPageBirth').text(birth);
          $('#myPageTeamName').text(data.teamName);
          $('#myPageRankName').text(data.rankName);
          $('#myPageEmpId').val(data.empId);
          let tmpphone = data.phone;
          let phone =
            tmpphone.slice(0, 3) +
            '-' +
            tmpphone.slice(3, 7) +
            '-' +
            tmpphone.slice(7, 11);
          $('#myPagePhone').val(phone);
        },
        error: function (e) {
          alert(e);
        },
      });

      $('#imgPreview').on('click', function () {
        $('#profile').click();
      });

      $('#profile').on('change', function () {
        const file = this.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function (event) {
            $('#imgPreview').html(
              '<img src="' + event.target.result + '" alt="imgPreview">'
            );
          };
          reader.readAsDataURL(file);
        } else {
          $('#imgPreview').html('<span>선택</span>');
        }
      });

      $('#removeImgBtn').on('click', function () {
        $('#profile').val('');
        $('#imgPreview').html('<span>선택</span>');
      });
    }
  </script>
</body>
