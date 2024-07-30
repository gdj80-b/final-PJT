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
        <tr>
            <th class="text-center typeDraftThTag">제목</th>
            <td class="typeDraftTdTag" colspan="3"><input class="form-control form-control-sm" type="text" name="edocTitle" required></td>
        </tr>
        <tbody>
            <tr>
                <th class="text-center typeDraftThTag">프로젝트 이름</th>
                <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="text" name="projectTitle" required></td>
                <th class="text-center typeDraftThTag">프로젝트 예상 산정비용</th>
                <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="text" name="projectEstimate" required></td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag" colspan="4">내용</th>
            </tr>
            <tr>
                <td class="typeDraftTdTag" colspan="4"><textarea class="form-control" rows="8" name="projectContent"></textarea></td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag">파일첨부</th>
                <td class="typeDraftTdTag" colspan="4"><input class="form-control form-control-sm" type="file" id="formFileMultiple" name="gaFile"></td>
            </tr>
        </tbody>
    </table>
</div>