<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  .approverForm {
    width: 130px;
  }
  
  .approverThTag {
    width: 30px;
    height: 122px;
    
    color: #fff !important;
    background-color: rgba(105, 108, 255, 0.6) !important;
    
    writing-mode: vertical-rl;
    text-orientation: upright;
    
    padding: 0.1rem !important;
  }
  
  .approverTdTag {
    height: 20px !important;
    padding: 0.1rem !important;
  }
</style>
<div class="table-responsive text-nowrap approverForm">
  <table class="table table-bordered" style="background-color: #fff; margin-bottom: 0rem !important">
    <tbody>
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
    </tbody>
  </table>
  <input type="hidden" name="edocApprover" id="hiddenEdocApprover">
  <input type="hidden" name="edocApprover" id="hiddenEdocApproverOrder">
</div>
