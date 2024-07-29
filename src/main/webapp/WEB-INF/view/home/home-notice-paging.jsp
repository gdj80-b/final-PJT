<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
  <nav aria-label="Page navigation" style="">
    <ul class="pagination">
      <li class="page-item first <c:if test="${noticePaging.currentPage == 1}">disabled</c:if>">
        <a class="page-link" href="?currentPage=1${param.extraParam}">
          <i class="tf-icon bx bx-chevrons-left"></i>
        </a>
      </li>
      <li class="page-item prev <c:if test="${noticePaging.currentPage == 1}">disabled</c:if>">
        <a class="page-link" href="?currentPage=${noticePaging.currentPage - 1}${param.extraParam}">
          <i class="tf-icon bx bx-chevron-left"></i>
        </a>
      </li>
      <c:forEach var="i" begin="${noticePaging.firstPage}" end="${noticePaging.lastPage}">
        <li class="page-item <c:if test="${noticePaging.currentPage == i}"> active</c:if>">
          <a class="page-link" href="?currentPage=${i}${param.extraParam}">${i}</a>
        </li>
      </c:forEach>
      <li class="page-item next <c:if test="${noticePaging.currentPage == noticePaging.totalPage}">disabled</c:if>">
        <a class="page-link" href="?currentPage=${noticePaging.currentPage + 1}${param.extraParam}">
          <i class="tf-icon bx bx-chevron-right"></i>
        </a>
      </li>
      <li class="page-item last <c:if test="${noticePaging.currentPage == noticePaging.totalPage}">disabled</c:if>">
        <a class="page-link" href="?currentPage=${noticePaging.totalPage}${param.extraParam}">
          <i class="tf-icon bx bx-chevrons-right"></i>
        </a>
      </li>
    </ul>
  </nav>
</body>