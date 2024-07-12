<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    
    <title>받은쪽지함</title>
    </head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <style>
        .msgCheck{
            text-align:center;
        }
    
    </style>
  <body>
      <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      </div>
      <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/msg/msg-sub-sidebar.jsp"></jsp:include>
      </div>
      <div id="workspace-area" class="subsidebar-from-workspace">       
        <div class="card">            
            <h2 class="card-title" style="margin:30px">받은쪽지함</h2>
            ${loginInfo.empCode}
            <div class="card-header">${loginInfo.email}</div>
            <div class="card-body">
                <div>
                    <table class="table table-bordered">
                        <tr>
                            <td style="padding-left:100px">
                                <span><a href="">읽음</a></span>
                                <span><button type="button" id="deleteButton" class="btn btn-danger btn-sm">삭제하기</button></span>
                            </td>
                        </tr>
                    </table>
                    <table class='table table-bordered table-hover table-striped'>
                        <thead>
                            <tr>
                                <td style="width:80px">선택</td>
                                <td>보낸사람</td>
                                <td>제목</td>
                                <td>시간</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="m" items="${list}">
                                <tr>
                                    <td class="msgCheck">
                                        <input type="checkbox" name="msgNum" value="${m.msgNum}">
                                    </td>
                                    <td>${m.senderName}</td>
                                    <td>${m.msgTitle}</td>
                                    <td>${m.sendTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer">footer</div>
        </div>
    </div>
  </body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function(){      

        // "삭제하기" 버튼 클릭 시 선택된 항목 삭제
        $('#deleteButton').click(function(){
            let checkedItems = $('input[name="msgNum"]:checked');
            let count = checkedItems.length;
            let empCode = "${loginInfo.empCode}";
            if(count > 0){
                if(confirm(count + '개 항목을 삭제하시겠습니까?')){
                    let ids = [];
                     checkedItems.each(function(){
                        ids.push($(this).val());
                        });                     
                     $.ajax({
                         url: '/gaent/msg/modifyMsgStatus', // 서버에 삭제 요청을 보낼 URL
                         type: 'POST',
                         traditional: true, // 배열을 전송할 수 있도록 설정
                            data: { 
                                msgNums: ids,
                                empCode: empCode,
                                request: 1
                            },
                            success: function(result){
                            if(result == 0) {
                                alert('삭제되지 않은 항목이 있습니다.');
                            } else {
                                 alert('선택된 항목이 삭제되었습니다.');
                                    location.reload(); // 페이지 새로 고침
                            }                              
                        },
                        error: function(){
                             alert('항목 삭제에 실패했습니다.');
                        }
                    });
                }
            } else {
                alert('삭제할 항목을 선택하세요.');
            }
        });
    });

</script>
  
</html>