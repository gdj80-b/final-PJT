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
                        <div class="img-preview">
                            <img src="${pageContext.request.contextPath}/upload/profile/${empInfo.profile}" />
                        </div>
                    </div>
                    <div>
                        <div class="">${empInfo.teamName}</div>
                        <div class="mt-1"><b>${empInfo.korName}</b> ${empInfo.rankName}</div>
                        <div class="mt-1">${empInfo.empId}</div>
                        <div class="mt-1">
                            <c:set var="phone" value="${empInfo.phone}"/>
                            <span>${fn:substring(phone, 0, 3)}.</span>
                            <span>${fn:substring(phone, 3, 7)}.</span>
                            <span>${fn:substring(phone, 7, 13)}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
