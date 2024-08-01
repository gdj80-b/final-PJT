<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
  <nav aria-label="Page navigation" style="">
    <ul class="pagination">
      <li class="page-item first <c:if test="${msgPaging.currentPage == 1}">disabled</c:if>">
        <a class="page-link" href="?currentPage=1${param.extraParam}">
          <i class="tf-icon bx bx-chevrons-left"></i>
        </a>
      </li>
      <li class="page-item prev <c:if test="${msgPaging.currentPage == 1}">disabled</c:if>">
        <a class="page-link" href="?currentPage=${msgPaging.currentPage - 1}${param.extraParam}">
          <i class="tf-icon bx bx-chevron-left"></i>
        </a>
      </li>
      <c:forEach var="i" begin="${msgPaging.firstPage}" end="${msgPaging.lastPage}">
        <li class="page-item <c:if test="${msgPaging.currentPage == i}"> active</c:if>">
          <a class="page-link" href="?currentPage=${i}${param.extraParam}">${i}</a>
        </li>
      </c:forEach>
      <li class="page-item next <c:if test="${msgPaging.currentPage == msgPaging.totalPage}">disabled</c:if>">
        <a class="page-link" href="?currentPage=${msgPaging.currentPage + 1}${param.extraParam}">
          <i class="tf-icon bx bx-chevron-right"></i>
        </a>
      </li>
      <li class="page-item last <c:if test="${msgPaging.currentPage == msgPaging.totalPage}">disabled</c:if>">
        <a class="page-link" href="?currentPage=${msgPaging.totalPage}${param.extraParam}">
          <i class="tf-icon bx bx-chevrons-right"></i>
        </a>
      </li>
    </ul>
  </nav>
</body>