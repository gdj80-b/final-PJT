<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
    <nav aria-label="Page navigation" style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%);">
        <ul class="pagination">
            <li class="page-item first <c:if test="${pg.currentPage==1}">disabled</c:if>">
                <a class="page-link" href="?currentPage=1${param.extraParam}">
                    <i class="tf-icon bx bx-chevrons-left"></i>
                </a>
            </li>
            <li class="page-item prev <c:if test="${pg.currentPage==1}">disabled</c:if>">
                <a class="page-link" href="?currentPage=${pg.currentPage-1}${param.extraParam}">
                    <i class="tf-icon bx bx-chevron-left"></i>
                </a>
            </li>
            <c:forEach var="i" begin="${pg.firstPage}" end="${pg.lastPage}">
                <li class="page-item <c:if test="${pg.currentPage==i}"> active</c:if>">
                    <a class="page-link" href="?currentPage=${i}${param.extraParam}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item next <c:if test="${pg.currentPage==pg.totalPage}">disabled</c:if>">
                <a class="page-link" href="?currentPage=${pg.currentPage+1}${param.extraParam}">
                    <i class="tf-icon bx bx-chevron-right"></i>
                </a>
            </li>
            <li class="page-item last <c:if test="${pg.currentPage==pg.totalPage}">disabled</c:if>">
                <a class="page-link" href="?currentPage=${pg.totalPage}${param.extraParam}">
                    <i class="tf-icon bx bx-chevrons-right"></i>
                </a>
            </li>
        </ul>        
    </nav>
</body>