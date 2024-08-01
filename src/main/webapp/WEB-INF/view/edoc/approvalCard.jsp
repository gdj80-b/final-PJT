<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="row mb-3">
    <div class="d-flex">
        <c:choose>
            <c:when test="${!empty toDoList}">
                <c:forEach items="${toDoList}" var="el">
                    <div class="card card-size me-3">
                        <div class="card-header-edoc">
                            <c:choose>
                                <c:when test="${el.edocStatus == '0'}">
                                    <span class="badge bg-label-primary">대기</span>
                                </c:when>
                                <c:when test="${el.edocDoneDate == null}">
                                    <span class="badge bg-label-warning">진행</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-label-success">완료</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body-edoc">
                            <h5 class="card-title fw-semibold d-inline-block text-truncate">${el.edocTitle}</h5>
                            <div class="card-text">
                                <small>기안자</small> <small>${el.korName}</small>
                            </div>
                            <div class="card-text">
                                <small>기안일</small> <small>${el.edocEnrollDate}</small>
                            </div>
                            <div class="card-text">
                                <small>결재양식</small> <small>${el.edocFormTitle}</small>
                            </div>
                        </div>
                        <div class="card-body-edoc text-center">
                            <a href="/gaent/edocDetail/${el.edocType}/${el.edocNum}">
                                <button class="btn btn-outline-primary btn-sm">결재하기</button>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="card card-size">
                    <div class="card-header-edoc">
                        <span class="badge bg-label-primary">대기</span>
                    </div>
                    <div class="card-body-edoc">
                        <h5 class="card-title fw-semibold d-inline-block text-truncate">전자결재 문서 제목</h5>
                        <div class="card-text">
                            <small>기안자</small> <small>내용</small>
                        </div>
                        <div class="card-text">
                            <small>기안일</small> <small>내용</small>
                        </div>
                        <div class="card-text">
                            <small>결재양식</small> <small>내용</small>
                        </div>
                    </div>
                    <div class="card-body-edoc text-center">
                        <button class="btn btn-outline-primary btn-sm" disabled>결재하기</button>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
