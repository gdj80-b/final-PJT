<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.snow.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/quill@2.0.2/dist/quill.js"></script>
<style>
  .articleContent {
    height: 16rem;
    resize: none;
  }
</style>
<body>
  <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li class="menu-item">
        <div class="menu-link">
          <span class="display-6 fw-semibold mb-0">소통공간</span>
        </div>
      </li>
      <li class="menu-item">
        <div class="menu-link">
          <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#articleModal">게시글 작성</button>
        </div>
      </li>
      <li class="menu-item-edoc">
        <h5 class="fs-4 fw-semibold mb-2">메뉴</h5>
        <ul class="menu-item">
          <div>
            <a href="/gaent/notice/" class="menu-link">
              <span>공지사항</span>
            </a>
          </div>
          <div>
            <a href="/gaent/notice/qna" class="menu-link">
              <span>자유게시판</span>
            </a>
          </div>
        </ul>
      </li>
    </ul>
  </aside>
  <!-- 게시글 작성 모달 시작 -->
  <div class="modal fade" id="articleModal" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <form id="articleInputForm" enctype="multipart/form-data">
        <div class="modal-content">
          <div class="modal-header mt-4">
            <h4 class="modal-title ms-2" id="modalCenterTitle">게시글 작성하기</h4>
          </div>
          <div class="modal-body">
            <c:set var="num" value="3"/>
            <c:choose>
              <c:when test="${loginInfo.rankCode <= num}">
                <div class="mb-2">
                  <select class="form-select" name="articleType">
                    <option disabled selected hidden>항목을 선택해주세요.</option>
                    <option value="공지사항">공지사항</option>
                    <option value="자유게시판">자유게시판</option>
                  </select>
                </div>
              </c:when>
              <c:otherwise>
                <div class="mb-2"><input type="hidden" name="articleType" value="자유게시판"></div>
              </c:otherwise>
            </c:choose>
            <div class="mb-2">
              <input class="form-control mb-2" type="text" name="articleTitle" id="articleTitle" placeholder="제목을 입력해주세요.">
              <textarea class="form-control articleContent mb-2" name="articleContent" id="articleContent" placeholder="내용을 입력해주세요."></textarea>
              <input class="form-control" type="file" name="gaFile" id="gaFile">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-outline-primary">등록하기</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- 게시글 작성 모달 끝 -->
  <script>
    $('#articleInputForm').submit(function(e) {
      e.preventDefault();
      let formData = new FormData($('#articleInputForm')[0]);
      
      $.ajax({
        url: '/gaent/board/addArticle',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(data){
          $('#articleInputForm')[0].reset();
          window.location.href = '/gaent/home';
        },
        error: function(e){
          console.log(e);
        }
      });
    });
  </script>
</body>