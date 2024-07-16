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
        <th class="text-center typeDraftThTag">시작일자</th>
        <td class="typeDraftTdTag">
          <c:choose>
            <c:when test="${edocDetail.propStartDate != null}">
              <input class="form-control form-control-sm" type="text" name="propStartDate" value="${edocDetail.propStartDate}">
            </c:when>
            <c:otherwise>
              <input class="form-control form-control-sm" type="date" name="propStartDate">
            </c:otherwise>
          </c:choose>
        </td>
        <th class="text-center typeDraftThTag">종료일자</th>
        <td class="typeDraftTdTag">
          <c:choose>
            <c:when test="${edocDetail.propEndDate != null}">
              <input class="form-control form-control-sm" type="text" name="propEndDate" value="${edocDetail.propEndDate}">
            </c:when>
            <c:otherwise>
              <input class="form-control form-control-sm" type="date" name="propEndDate">
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="text-center typeDraftThTag">제목</th>
        <td class="typeDraftTdTag" colspan="3">
          <c:choose>
            <c:when test="${edocDetail.propTitle != null}">
              <input class="form-control form-control-sm" type="text" name="propTitle" value="${edocDetail.propTitle}">
            </c:when>
            <c:otherwise>
              <input class="form-control form-control-sm" type="text" name="propTitle">
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <td class="typeDraftTdTag" colspan="4">
          <c:choose>
            <c:when test="${edocDetail.propContent != null}">
              <textarea class="form-control" rows="12" name="propContent">${edocDetail.propContent}</textarea>
            </c:when>
            <c:otherwise>
              <textarea class="form-control" rows="12" name="propContent"></textarea>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="text-center typeDraftThTag">파일첨부</th>
        <td class="typeDraftTdTag" colspan="4"><input class="form-control form-control-sm" type="file" id="formFileMultiple" multiple="" name="edocFileName"></td>
      </tr>
    </tbody>
  </table>
</div>