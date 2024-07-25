<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                <th class="text-center typeDraftThTag">제목</th>
                <td class="typeDraftTdTag" colspan="3">
                    <input class="form-control form-control-sm" type="text" name="edocTitle" required>
                </td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag">경조사 종류</th>
                <td class="typeDraftTdTag">
                    <select class="form-select form-select-sm" name="eventType" required>
                        <option value="결혼">경혼</option>
                        <option value="생일">생일</option>
                        <option value="장례식">장례</option>
                    </select>
                </td>            
                <th class="text-center typeDraftThTag">날짜</th>
                <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="date" name="eventDate" required></td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag">장소</th>
                <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="text" name="eventPlace"></td>
                <th class="text-center typeDraftThTag">비용</th>
                <td class="typeDraftTdTag"><input class="form-control form-control-sm" type="text" name="eventExpense" required></td>
            </tr>
            <tr>
                <th class="text-center typeDraftThTag">파일첨부</th>
                <td class="typeDraftTdTag" colspan="4"><input class="form-control form-control-sm" type="file" id="formFileMultiple" name="edocFileName"></td>
            </tr>
        </tbody>
    </table>
</div>