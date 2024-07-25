<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체쪽지함</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
<style>
.checkbox {
	text-align: center;
	width: 60px;
}

.msg-sub-size {
	QQwidth: 140px;
	text-align: center;
}

.msg-state-size {
	QQwidth: 80px;
	text-align: center;
}

.msg-time-size {
	QQwidth: 200px;
	text-align: right;
}
</style>
</head>
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
            <h2 class="card-title" style="margin: 50px 0px 0px 30px">전체쪽지함</h2>
            <div class="card-body">
                <div class="care-body" style="height: 700px;">
                    <table class="table table-bordered ">
                        <thead>
                            <tr>
                                <th colspan="2" class="align-middle fs-6" >전체 : ${pg.lastRow}개</th>
                                <th colspan="2">
                                    <form action="/gaent/msg/0">
                                        <div class="d-flex justify-content-between">
                                            <input class="form-control w-75 me-2" type="search" placeholder="검색어를 입력하세요..." aria-label="Search" name="searchMsg">
                                            <button class="btn btn-secondary" type="submit">검색</button>
                                        </div>
                                    </form>
                                </th>
                                <th>
                                    <div class="d-flex flex-row-reverse">
                                        <button type="button" id="deleteButton" class="btn btn-danger">삭제</button>
                                        <button type="button" id="readButton" class="btn btn-success me-2">읽음</button>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th class="checkbox"><input type="checkbox" id="selectAll" class="form-check-input form-check-input-lg"></th>
                                <th class="msg-state-size">상태</th>
                                <th class="msg-sub-size">상대방</th>
                                <th class="msg-title-size">제목</th>
                                <th class="msg-time-size">시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty list}">
                                <tr>
                                    <td colspan="5" style="text-align: center">쪽지가 없습니다</td>
                                </tr>
                            </c:if>
                            <c:forEach var="m" items="${list}">
                                <tr style="background-color: ${m.readTime == null ? 'FFFFFF' : '#F5F5F5'}">
                                    <td class="checkbox"><input type="checkbox" class="form-check-input form-check-input-lg" name="msgNum" value="${m.msgNum}"></td>
                                    <td class="msg-state-size">${m.receiver == m.sender ? '<span class="badge bg-label-info fs-6">나</span>' :
                                         (m.receiver == loginInfo.empCode ? '<span class="badge bg-label-primary fs-6">수신</span>'
                                         : '<span class="badge bg-label-warning fs-6">발신</span>') }
                                    </td>
                                    <td class="msg-sub-size">${m.receiver == m.sender ? '내게쓰기' : (m.receiver == loginInfo.empCode ? m.senderName : m.receiverName) }</td>
                                    <td class="msg-title-size"><a href="/gaent/msg/msgDetail/${m.msgNum}" style="color: ${m.readTime == null ? 'black' : '#A0A0A0'}"> ${m.msgTitle} </a></td>
                                    <td class="msg-time-size">${m.sendTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- 페이징 -->
                    <div>
                        <jsp:include page="/WEB-INF/view/common/paging.jsp">
                            <jsp:param name="aaa" value="&searchMsg=${param.searchMsg}" />
                        </jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            checkNotReadMsg();
            
            
            // 한번에 체크
            $('#selectAll').click(function() {
                $('input[name="msgNum"]').prop('checked', this.checked);
            });
            
			<!-- 삭제버튼-->
            $('#deleteButton').click(function() {
                let checkedItems = $('input[name="msgNum"]:checked');
                let count = checkedItems.length;
                let empCode = "${loginInfo.empCode}";
                if (count > 0) {
                    if (confirm(count + '개 항목을 삭제하시겠습니까?')) {
                        let ids = [];
                        checkedItems.each(function() {
                            ids.push($(this).val());
                        });
                        $.ajax({
                            url: '/gaent/msg/modifyMsgStatus',
                            type: 'POST',
                            traditional: true,
                            data: {
                                msgNums: ids,
                                empCode: empCode,
                                request: 1
                            },
                            success: function(result) {
                                if (result == 0) {
                                    alert('삭제되지 않은 항목이 있습니다.');
                                } else {
                                    alert('선택된 항목이 삭제되었습니다.');
                                    location.reload();
                                }
                            },
                            error: function() {
                                alert('항목 삭제에 실패했습니다.');
                            }
                        });
                    }
                } else {
                    alert('삭제할 항목을 선택하세요.');
                }
            });
            
            
            
            			<!-- 읽기버튼-->
            $('#readButton').click(function() {
                let checkedItems = $('input[name="msgNum"]:checked');
                let count = checkedItems.length;
                let empCode = "${loginInfo.empCode}";
                if (count > 0) {
                    if (confirm(count + '개 항목을 읽음처리하시겠습니까?')) {
                        let ids = [];
                        checkedItems.each(function() {
                            ids.push($(this).val());
                        });
                        $.ajax({
                            url: '/gaent/msg/readMsg',
                            type: 'POST',
                            traditional: true,
                            data: {
                                msgNums: ids,
                                empCode: empCode
                            },
                            success: function(result) {
                                //if (result != 0) {
                                
                                    alert( result + '개가 읽음처리되었습니다');
                                    location.reload();
                            },
                            error: function() {
                                alert('항목 읽음처리에 실패했습니다.');
                            }
                        });
                    }
                } else {
                    alert('읽기처리할 항목을 선택하세요.');
                }
            });

            

            function checkNotReadMsg() {
                $.ajax({
                    url: "/gaent/msg/msgNotReadCnt", // 데이터를 가져올 URL
                    type: "GET", // GET 메서드를 사용
                    data: {'empCode': '${loginInfo.empCode}'}, // empCode 값을 문자열로 전달
                    dataType: "json", // 반환 데이터 타입은 int
                    success: function(notReadCnt) { // 요청이 성공하면 실행
                        // 서버에서 반환된 JSON 데이터에서 값을 읽어와서 msgAlert 요소에 표시
                        $("#notReadCnt").text(notReadCnt);
                    },
                    error: function() { // 요청이 실패하면 실행
                        alert("error"); // 에러 메시지 출력
                    }
                });
            }
        });
    </script>
</body>
</html>
