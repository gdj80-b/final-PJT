<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 모달 -->
<div class="modal fade" id="modalScrollable" tabindex="-1" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">결재선</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col mb-3">
            <table class="table table-sm text-center">
              <thead>
                <tr>
                  <th>선택</th>
                  <th>사원번호</th>
                  <th>소속</th>
                  <th>직위</th>
                  <th>이름</th>
                  <th>차수</th>
                </tr>
              </thead>
              <tbody class="table-border-bottom-0">
                <c:forEach var="vo" items="${approverList}">
                  <c:if test="${vo.rankCode > 2}">
                  <tr>
                    <td><input class="form-check-input" type="checkbox" value="${vo.empCode}" id="defaultCheck3" name="approval"></td>
                    <td>${vo.empCode}</td>
                    <td>${vo.teamCode}</td>
                    <td>${vo.rankCode}</td>
                    <td>${vo.korName}</td>
                    <td>
                      <select id="smallSelect" class="form-select form-select-sm" name="approvalRank">
                        <option value="0">차수</option>
                        <option value="1">1차</option>
                        <option value="2">2차</option>
                      </select>
                    </td>
                  </tr>
                  </c:if>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="">Save changes</button>
      </div>
    </div>
  </div>
</div>