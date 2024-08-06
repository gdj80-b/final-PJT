<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${edocDetail.apprStatus1 != 0 && !empty edocDetail.apprReason1}">
    <div class="table-responsive text-nowrap approval-reason-table">
        <table class="table table-bordered">
            <tr>
                <th rowspan="5" class="approval-order">${edocDetail.apprOrder1}</th>
            </tr>
            <tr>
                <th>결재자 | 결재상태 | 결재일자 </th>
                <td>
                    <div>${edocDetail.approverName1}</div>
                    <input type="hidden" name="firstApproverEmpCode" value="${edocDetail.approver1}">
                    <div>&nbsp;|&nbsp;</div>
                    <div>
                        <c:choose>
                            <c:when test="${edocDetail.apprStatus1 == -1}">반려</c:when>
                            <c:when test="${edocDetail.apprStatus1 == 1}">승인</c:when>
                        </c:choose>
                    </div>
                    <div>&nbsp;|&nbsp;</div>
                    <div>${edocDetail.apprDate1}</div>
                </td>
            </tr>
            <tr>
                <th>결재의견</th>
                <td>${edocDetail.apprReason1}</td>
            </tr>
        </table>
    </div>
</c:if>
<c:if test="${edocDetail.apprOrder2 != 0 && !empty edocDetail.apprReason2}">
    <div class="table-responsive text-nowrap approval-reason-table ms-3">
        <table class="table table-bordered">
            <tr>
                <th rowspan="5" class="approval-order">${edocDetail.apprOrder2}</th>
            </tr>
            <tr>
                <th>결재자 | 결재상태 | 결재일자</th>
                <td>
                    <div>${edocDetail.approverName2}</div>
                    <input type="hidden" name="firstApproverEmpCode" value="${edocDetail.approver2}">
                    <div>&nbsp;|&nbsp;</div>
                    <div>
                        <c:choose>
                            <c:when test="${edocDetail.apprStatus2 == -1}">반려</c:when>
                            <c:when test="${edocDetail.apprStatus2 == 1}">승인</c:when>
                        </c:choose>
                    </div>
                    <div>&nbsp;|&nbsp;</div>
                    <div>${edocDetail.apprDate2}</div>
                </td>
            </tr>
            <tr>
                <th>결재의견</th>
                <td>${edocDetail.apprReason2}</td>
            </tr>
        </table>
    </div>
</c:if>