<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Error -->
<div class="misc-wrapper">
  <h1 class="mb-5 mx-2" style="line-height: 6rem;font-size: 6rem;">ERROR</h1>
  <button onclick="javascript:location.href='/gaent/home'" class="btn btn-primary mb-2">홈 화면으로 돌아가기</button>
  <div class="mt-5">
    <img src="${pageContext.request.contextPath}/assets/img/illustrations/page-misc-error.png" alt="page-misc-error-light" width="500" class="img-fluid">
  </div>
  <h4 class="my-4 mx-2">페이지 없음.️ ⚠️</h4>
  <p class="mb-5 mx-2">찾고 계신 페이지를 찾을 수 없습니다.</p>
</div>
<!-- /Error -->