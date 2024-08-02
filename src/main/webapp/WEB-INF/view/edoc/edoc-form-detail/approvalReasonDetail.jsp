<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="table-responsive text-nowrap approval-reason-table">
    <table class="table table-bordered">
        <tr>
            <th rowspan="5" style="width: 2rem !important; color: inherit !important; background-color: rgb(255, 255, 255) !important;">${edocDetail.apprOrder1}</th>
        </tr>
        <tr>
            <th>결재자</th>
            <td>
                ${edocDetail.approverName1}
                <input type="hidden" name="firstApproverEmpCode" value="${edocDetail.approver1}">
            </td>
        </tr>
        <tr>
            <th>결재상태 / 결재일자</th>
            <td>
                <div>
                    <c:choose>
                        <c:when test="${edocDetail.apprStatus1 == -1}">반려</c:when>
                        <c:when test="${edocDetail.apprStatus1 == 1}">승인</c:when>
                    </c:choose>
                </div>
                <div class="mx-2">/</div>
                <div>${edocDetail.apprDate1}</div>
            </td>
        </tr>
        <tr>
            <th>결재의견</th>
            <td>${edocDetail.apprReason1}</td>
        </tr>
    </table>
</div>