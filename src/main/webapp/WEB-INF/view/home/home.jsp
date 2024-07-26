<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>홈 - GAEnt.</title>
    <link
      rel="icon"
      type="image/x-icon"
      href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/workspace.css"
    />
    <style>
      .content-wrapper {
        overflow-x: hidden;
        overflow-y: auto;
        
        
      }

      .home-container {
        padding: 0 !important;
      }
    </style>
  </head>
<body>
<div id="">
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar-area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="sidebar-from-workspace">
        <div class="content-wrapper">
            <div class="flex-grow-1 home-container">
                <div class="row row-cols-3 mb-5">
                    <div class="col-md-2 mb-3 d-flex justify-content-center">
                        <jsp:include page="/WEB-INF/view/home/profile-card.jsp"></jsp:include>
                    </div>
                    <div class="col-md-4 mb-3 d-flex justify-content-center">
                        <jsp:include page="/WEB-INF/view/home/calendar-card.jsp"></jsp:include>
                    </div>
                    <div class="col-md-4 mb-3 d-flex justify-content-center">
                        <jsp:include page="/WEB-INF/view/home/alert-card.jsp"></jsp:include>
                    </div>
                </div>
                <div class="row row-cols-3 mb-5">
                    <div class="col-md-2 mb-3 d-flex justify-content-center">
                        <jsp:include page="/WEB-INF/view/home/attendance-card.jsp"></jsp:include>
                    </div>
                    <div class="col-md-4 mb-3 d-flex justify-content-center">
                        <jsp:include page="/WEB-INF/view/home/notice-card.jsp"></jsp:include>
                    </div>
                    <div class="col-md-4 mb-3 d-flex justify-content-center">
                        <jsp:include page="/WEB-INF/view/home/navernews-card.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
  $(document).ready(function () {
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
  });
</script>
</body>
</html>
