<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  .edocForm {
    margin-bottom: 0rem !important;
  }
  
  .typeDraftThTag {
    color: #fff !important;
    background-color: rgba(105, 108, 255, 0.6) !important;
    padding: 0.1rem !important;
  }
  
  .typeDraftTdTag {
    background-color: rgba(255, 255, 255, 1) !important;
  }
  
  .typeDraftTdTag textarea {
    resize: none;
  }
</style>
<div class="table-responsive text-nowrap">
  <table class="table table-bordered edocForm">
    <tbody>
      <tr>
        <th class="text-center typeDraftThTag">시작일자</th>
        <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="date" name="propStartDate"></td>
        <th class="text-center typeDraftThTag">종료일자</th>
        <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="date" name="propEndDate"></td>
      </tr>
      <tr>
        <th class="text-center typeDraftThTag">제목</th>
        <td class="typeDraftTdTag" colspan="3"><input class="form-control form-control-sm" type="text" name="propTitle"></td>
      </tr>
      <tr>
        <td class="typeDraftTdTag" colspan="4"><textarea class="form-control" rows="12" name="propContent"></textarea></td>
      </tr>
      <tr>
        <th class="text-center typeDraftThTag">파일첨부</th>
        <td class="typeDraftTdTag" colspan="4"><input class="form-control form-control-sm" type="file" id="formFileMultiple" multiple="" name="edocFileName"></td>
      </tr>
    </tbody>
  </table>
</div>
