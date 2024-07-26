<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${pageContext.request.contextPath}/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
    <title>헤더 - GAEnt.</title>
    <style>
      .mypage-table th {
        width: 4rem;
        text-align: right;
      }

      .mypage-table td {
        width: 8rem;
      }

      .img-preview {
        width: 6rem;
        height: 8rem;
        background-color: #f0f0f0;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #ddd;
        margin-bottom: 10px;
        overflow: hidden;
        cursor: pointer;
      }

      .remove-img-btn button {
        width: 6rem;
        height: 1.6rem;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .img-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .img-preview span {
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <nav
      class="navbar navbar-example navbar-expand-lg bg-white fixed-top shadow-sm"
    >
      <div class="container-fluid">
        <div class="app-brand demo">
          <span class="app-brand-logo demo">
            <img
              src="${pageContext.request.contextPath}/assets/svg/sneat.svg"
              alt="Logo"
            />
          </span>
          <span class="app-brand-text demo menu-text fw-bolder ms-2"
            >GA Ent.</span
          >
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-3">
          <div class="navbar-nav me-auto"></div>
          <!-- 로그인 유저 -->
          <div class="me-4">
            <a href="#" class="menu-link">
              <i class="menu-icon tf-icons bx bx-happy-alt"></i>
              <span class="text-uppercase">${loginInfo.korName}</span>
              <span>&nbsp;님 환영합니다.</span>
            </a>
          </div>
          <!-- 마이페이지 -->
          <div class="me-4">
            <a
              href="javascript:void(0)"
              onclick="showMyPage()"
              class="menu-link"
            >
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
  <div
    class="modal fade"
    id="myPageModal"
    tabindex="-1"
    aria-hidden="true"
    style="display: none"
  >
    <div class="modal-dialog mypage modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalCenterTitle">마이페이지</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <form
            id="myPageInputForm"
            class="input-form-group"
            enctype="multipart/form-data"
          >
            <table class="table mypage-table">
              <tr>
                <th><label for="profile">사진</label></th>
                <td>
                  <div class="img-preview" id="imgPreview"></div>
                  <div class="remove-img-btn">
                    <input
                      class="form-control"
                      type="file"
                      id="profile"
                      name="gaFile"
                      style="display: none"
                    />
                    <input
                      type="hidden"
                      id="myEmpCode"
                      value="${loginInfo.empCode}"
                    />
                    <button
                      type="button"
                      class="btn btn-outline-secondary"
                      id="removeImgBtn"
                    >
                      삭제
                    </button>
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
                    <input
                      class="form-control form-control-sm w-75"
                      type="text"
                      id="myPageEmpId"
                      name="myPageEmpId"
                    />
                    <button
                      onclick="idCheck()"
                      type="button"
                      class="btn btn-sm btn-outline-primary ms-2"
                    >
                      중복검사
                    </button>
                  </div>
                </td>
              </tr>
              <tr>
                <th><span>연락처</span></th>
                <td>
                  <input
                    class="form-control form-control-sm w-75"
                    type="text"
                    id="myPagePhone"
                    name="myPagePhone"
                  />
                </td>
              </tr>
            </table>
            <div class="modal-footer">
              <button
                type="submit"
                class="btn btn-sm btn-outline-primary"
                data-bs-dismiss="modal"
              >
                수정
              </button>
              <button
                type="button"
                class="btn btn-sm btn-outline-secondary"
                data-bs-dismiss="modal"
              >
                닫기
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- 중복 검사 모달 시작 -->
  <div
    class="modal fade"
    id="checkEmpIdModal"
    tabindex="-1"
    aria-hidden="true"
    style="display: none"
  >
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalCenterTitle">이메일(ID) 중복검사</h5>
        </div>
        <div id="checkResultMsg" class="modal-body"></div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-outline-secondary"
            data-bs-dismiss="modal"
          >
            확인
          </button>
        </div>
      </div>
    </div>
  </div>
  <!-- 중복 검사 모달 끝 -->
</html>
