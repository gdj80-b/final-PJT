<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>홈 - GAEnt.</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css"/>
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
                        <div class="row mb-2">
                            <div class="col-2 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/profile-card.jsp"></jsp:include>
                            </div>
                            <div class="col-5 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/calendar-card.jsp"></jsp:include>
                            </div>
                            <div class="col-5 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/navernews-card.jsp"></jsp:include>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/attendance-card.jsp"></jsp:include>
                            </div>
                            <div class="col-2 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/edoc-card.jsp"></jsp:include>
                            </div>
                            <div class="col-3 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/msg-card.jsp"></jsp:include>
                            </div>
                            <div class="col-5 mb-3 d-flex justify-content-center">
                                <jsp:include page="/WEB-INF/view/home/board-card.jsp"></jsp:include>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                
                $('#modalClose').on('click', function() {
                    $('#myPageInputForm')[0].reset();
                    $('#passMessage').html('');
                });
                
                $('#myPageInputForm').submit(function (e) {
                    e.preventDefault();
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
                
                $('#myPageEmpPasswordCheck').on('input', function() {
                    let pw1 = $('#myPageEmpPassword').val();
                    let pw2 = $('#myPageEmpPasswordCheck').val();
                    
                    if(pw1 != pw2) {
                        $('#passMessage').html('비밀번호가 서로 일치하지 않습니다.').css('color', 'red');
                    } else {
                        $('#passMessage').html('비밀번호가 일치합니다.').css('color', 'green');
                    }
                });
                
            });
            
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
                            '<img src="${pageContext.request.contextPath}/upload/profile/' + data.profile + '" alt="imgPreview">'
                        );
                        $('#myPageKorName').text(data.korName);
                        $('#myPageAge').text(data.age);
                        let tmpbirth = data.birth;
                        let birth = tmpbirth.slice(0, 4) + '-' + tmpbirth.slice(4, 6) + '-' + tmpbirth.slice(6, 8);
                        $('#myPageBirth').text(birth);
                        $('#myPageTeamName').text(data.teamName);
                        $('#myPageRankName').text(data.rankName);
                        $('#myPageEmpId').val(data.empId);
                        let tmpphone = data.phone;
                        let phone = tmpphone.slice(0, 3) + '-' + tmpphone.slice(3, 7) + '-' + tmpphone.slice(7, 11);
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
                        $('#imgPreview').html('<img src="${pageContext.request.contextPath}/upload/profile/' + data.profile + '" alt="imgPreview">');
                        $('#myPageKorName').text(data.korName);
                        $('#myPageAge').text(data.age);
                        let tmpbirth = data.birth;
                        let birth = tmpbirth.slice(0, 4) + '-' + tmpbirth.slice(4, 6) + '-' + tmpbirth.slice(6, 8);
                        $('#myPageBirth').text(birth);
                        $('#myPageTeamName').text(data.teamName);
                        $('#myPageRankName').text(data.rankName);
                        $('#myPageEmpId').val(data.empId);
                        let tmpphone = data.phone;
                        let phone = tmpphone.slice(0, 3) + '-' + tmpphone.slice(3, 7) + '-' + tmpphone.slice(7, 11);
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
                        $('#imgPreview').html('<img src="' + event.target.result + '" alt="imgPreview">');
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
</html>
