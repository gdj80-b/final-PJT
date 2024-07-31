<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/profile-card.css"/>
    </head>
    <body>
        <div class="profile-card">
            <div class="card">
                <div class="card-body d-flex flex-column align-items-center text-center">
                    <div class="">
                        <div id="homeProfileImgPreview" class="img-preview"></div>
                    </div>
                    <div>
                        <div id="homeProfileTeamName" class=""></div>
                        <div id="homeProfileKorName" class="mt-1"></div>
                        <div id="homeProfileEmpId" class="mt-1"></div>
                        <div id="homeProfilePhone" class="mt-1"></div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                getHomeProfile();
            });
            
            // 프로필 카드 정보
            function getHomeProfile() {
                $.ajax({
                    url: '/gaent/home/profile',
                    type: 'GET',
                    success: function(data) {
                        // console.log(data);
                        $('#homeProfileImgPreview').html('<img src="${pageContext.request.contextPath}/upload/profile/' + data.profile + '" alt="imgPreview">');
                        $('#homeProfileTeamName').text(data.teamName);
                        $('#homeProfileKorName').html('<b>' + data.korName + '</b> ' + data.rankName);
                        $('#homeProfileEmpId').text(data.empId);
                        
                        let phone = data.phone;
                        let one = phone.substring(0, 3);
                        let two = phone.substring(3, 7);
                        let three = phone.substring(7, 13);
                        
                        $('#homeProfilePhone').text(one + '. ' + two + '. ' + three);
                    },
                    error: function(e) {
                        alert('프로필 카드의 정보를 불러오질 못 했습니다.')
                    }
                });
            }
        </script>
    </body>
</html>
