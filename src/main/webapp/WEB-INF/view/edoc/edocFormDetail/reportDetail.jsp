<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
</style>
<div class="table-responsive text-nowrap">
    <table class="table table-bordered edocForm">
        <tbody>
            <tr>
                <th class="text-center typeDraftThTag">제목</th>
                <td class="typeDraftTdTag" colspan="3">${edocDetail.edocTitle}</td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag">보고서 종류</th>
                <c:choose>
                    <c:when test="${(formDetail.reportType).equals('근태')}">
                        <td class="typeDraftTdTag" colspan="3">${formDetail.reportType}</td>
                    </c:when>
                    <c:when test="${(formDetail.reportType).equals('범죄')}">
                        <td class="typeDraftTdTag" colspan="3">${formDetail.reportType}</td>
                    </c:when>
                    <c:when test="${(formDetail.reportType).equals('사고')}">
                        <td class="typeDraftTdTag" colspan="3">${formDetail.reportType}</td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag" colspan="4">내용</th>
            </tr>
            <tr>
                <td class="typeDraftTdTag" colspan="4"><textarea class="form-control" rows="16" name="reportContent" readonly>${formDetail.reportContent}</textarea></td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag">파일첨부</th>
                <td class="typeDraftTdTag" colspan="4">
                ${edocDetail.edocFileName == null ? '첨부파일 없음':edocDetail.edocFileName }
                </td>
            </tr>
        </tbody>
    </table>
</div>