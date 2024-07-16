<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<div class="card mb-3">
  <!-- <h5 class="card-header-edoc">결재 대기 문서</h5> -->
  <div class="table-responsive text-nowrap mb-3">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>기안일</th>
          <th>결재양식</th>
          <th>제목</th>
          <th>첨부</th>
          <th>기안자</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
        <!-- 문서 조회 반복문 영역 -->
        <c:forEach items="${toDoList}" var="el">
          <tr>
            <td><span class="fw-medium">${el.edocEnrollDate}</span></td>
            <td><a href="/gaent/edocDetail/${el.edocNum}"><span class="fw-medium">${el.edocFormTitle}</span></a></td>
            <td><span class="fw-medium">${el.propTitle}</span></td>
            <c:choose>
              <c:when test="${el.fileName == null}">
                <td><span class="fw-medium d-flex align-items-center"><i class="tf-icon bx bx-file-blank"></i></span></td>
              </c:when>
              <c:otherwise>
                <td><span class="fw-medium d-flex align-items-center"><i class="tf-icon bx bx-file"></i></span></td>
              </c:otherwise>
            </c:choose>
            <td><span class="fw-medium">${el.korName}</span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
      <li class="page-item prev">
        <a class="page-link" href="/"><i class="tf-icon bx bx-chevrons-left"></i></a>
      </li>
      <li class="page-item">
        <a class="page-link" href="/">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="/">2</a>
      </li>
      <li class="page-item active">
        <a class="page-link" href="/">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="/">4</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="/">5</a>
      </li>
      <li class="page-item next">
        <a class="page-link" href="/"><i class="tf-icon bx bx-chevrons-right"></i></a>
      </li>
    </ul>
  </nav>
</div>
