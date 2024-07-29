<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css"/>
    </head>
    <body>
        <nav class="navbar navbar-example navbar-expand-lg bg-white fixed-top shadow-sm">
            <div class="container-fluid">
                <a href="/gaent/home">
                    <div class="app-brand demo">
                        <span class="app-brand-logo demo">
                            <img src="${pageContext.request.contextPath}/assets/svg/sneat.svg" alt="Logo"/>
                        </span>
                        <span class="app-brand-text demo menu-text fw-bolder ms-2">GA Ent.</span>
                    </div>
                </a>
                <div class="collapse navbar-collapse" id="navbar-ex-3">
                    <div class="navbar-nav me-auto"></div>
                    <!-- 로그인 유저 -->
                    <div class="d-flex aling-items-center me-4">
                        <i class="menu-icon tf-icons bx bx-happy-alt"></i>
                        <span class="text-uppercase">${loginInfo.korName}</span>
                        <span>&nbsp;님 환영합니다.</span>
                    </div>
                    <!-- 마이페이지 -->
                    <div class="me-4">
                        <a href="javascript:void(0)" onclick="showMyPage()" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-user-circle"></i>
                            <span>마이페이지</span>
                        </a>
                    </div>
                    <!-- 로그아웃 -->
                    <div class="">
                        <a href="/gaent/logout" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-log-out"></i>
                            <span>로그아웃</span>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </body>
    <div class="modal fade" id="myPageModal" tabindex="-1" aria-hidden="true" style="display: none">
        <div class="modal-dialog mypage modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">마이페이지</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="myPageInputForm" class="input-form-group" enctype="multipart/form-data">
                        <table class="table mypage-table">
                            <tr>
                                <th><label for="profile">사진</label></th>
                                <td>
                                    <div class="img-preview" id="imgPreview"></div>
                                    <div class="remove-img-btn">
                                        <input class="form-control" type="file" id="profile" name="gaFile" style="display: none"/>
                                        <input type="hidden" id="myEmpCode" value="${loginInfo.empCode}"/>
                                        <button type="button" class="btn btn-outline-secondary" id="removeImgBtn">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><span>이름</span></th>
                                <td><span id="myPageKorName"></span></td>
                            </tr>
                            <tr>
                                <th><span>나이</span></th>
                                <td><span id="myPageAge"></span></td>
                            </tr>
                            <tr>
                                <th><span>생일</span></th>
                                <td><span id="myPageBirth"></span></td>
                            </tr>
                            <tr>
                                <th><span>부서</span></th>
                                <td><span id="myPageTeamName"></span></td>
                            </tr>
                            <tr>
                                <th><span>직위</span></th>
                                <td><span id="myPageRankName"></span></td>
                            </tr>
                            <tr>
                                <th><span>이메일(ID)</span></th>
                                <td>
                                    <div class="d-flex">
                                        <input class="form-control form-control-sm w-75" type="text" id="myPageEmpId" name="myPageEmpId"/>
                                        <button onclick="idCheck()" type="button" class="btn btn-sm btn-outline-primary ms-2">중복검사</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="2"><span>비밀번호</span></th>
                                <td>
                                    <input class="form-control form-control-sm w-75" type="password" id="myPageEmpPassword" name="myPageEmpPassword" placeholder="변경할 비밀번호를 입력해주세요." autocomplete="new-password"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-control form-control-sm w-75" type="password" id="myPageEmpPasswordCheck" name="myPageEmpPasswordCheck" placeholder="한번 더 입력해주세요." autocomplete="new-password"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>연락처</span></th>
                                <td>
                                    <input class="form-control form-control-sm w-75" type="text" id="myPagePhone" name="myPagePhone"/>
                                </td>
                            </tr>
                        </table>
                        <div class="modal-footer d-flex justify-content-evenly">
                            <span id="passMessage" style="color: red;"></span>
                            <div>
                                <input type="hidden" name="myPageEmpCode" value="${loginInfo.empCode}">
                                <button type="submit" class="btn btn-sm btn-outline-primary">수정</button>
                                <button id="modalClose" type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 중복 검사 모달 시작 -->
    <div class="modal fade" id="checkModal" tabindex="-1" aria-hidden="true" style="display: none">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">이메일(ID) 중복검사</h5>
                </div>
                <div id="checkResultMsg" class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 중복 검사 모달 끝 -->
</html> 
