<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="card">
  <h5 class="card-header-edoc">완료 문서</h5>
  <div class="table-responsive text-nowrap">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>기안일</th>
          <th>결재양식</th>
          <th>제목</th>
          <th>첨부</th>
          <th>문서번호</th>
          <th>결재상태</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
        <!-- 문서 조회 반복문 영역 -->
        <tr>
          <td><span class="fw-medium">기안일</span></td>
          <td><span class="fw-medium">결재양식</span></td>
          <td><span class="fw-medium">제목</span></td>
          <td><span class="fw-medium">첨부</span></td>
          <td><span class="fw-medium">문서번호</span></td>
          <td><span class="badge bg-label-primary me-1">결재상태</span></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>