<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="table-responsive text-nowrap approverForm">
  <table class="table table-bordered appr-table">
    <tr>
      <th id="edocApproverOrder" class="text-center approverThTag" rowspan="3">접 수</th>
      <td id="edocRankCode" class="small text-center approverTdTag">직위</td>
    </tr>
    <tr>
      <td id="edocKorName" class="small text-center">결재자</td>
    </tr>
    <tr>
      <td id="edocApprovalDate" class="small text-center approverTdTag">결재일</td>
    </tr>
  </table>
  <input type="hidden" name="approver" id="hiddenEdocApprover"> <input type="hidden" name="apprOrder" id="hiddenEdocApproverOrder">
</div>
