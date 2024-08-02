<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지함</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
<style>
    .checkbox {
	text-align: center;
	width: 60px;
}

.msg-sub-size {
	width: 10rem;
	text-align: center;
}

.msg-state-size {
	width: 6rem;
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
            <h2 class="card-title" style="margin:50px 0px 0px 30px">받은쪽지함</h2>
            <div class="card-body">
                <div class="care-body" style="height:700px;">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="align-middle fs-6" colspan="2">
                                    <span id="notReadCnt"></span>개 / ${pg.totalRow}개
                                </th>
                                <th>
                                    <form action="/gaent/msg/1">
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
                                <th class="msg-sub-size">보낸사람</th>
                                <th class="msg-title-size">제목</th>
                                <th class="msg-time-size">시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty list}">
                                <tr>
                                    <td colspan="4" style="text-align:center">받은 쪽지가 없습니다</td>
                                </tr>
                            </c:if>
                            <c:forEach var="m" items="${list}">
                                <tr onclick="location.href='/gaent/msg/msgDetail/${m.msgNum}'" style="background-color: ${m.readTime == null ? 'FFFFFF' : '#F5F5F5'}">
                                    <td onclick="event.stopPropagation()" class="checkbox">
                                        <input type="checkbox" class="form-check-input form-check-input-lg" name="msgNum" value="${m.msgNum}">
                                    </td>
                                    <td class="msg-sub-size">${m.senderName}</td>
                                    <td class="msg-title-size">
                                        <a href="/gaent/msg/msgDetail/${m.msgNum}" style="color: ${m.readTime == null ? 'black' : '#A0A0A0'}">
                                            ${m.msgTitle}
                                        </a>
                                    </td>
                                    <td class="msg-time-size">${m.sendTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table><br><br>
                    <!-- 페이징 -->
                    <div>
                        <jsp:include page="/WEB-INF/view/common/paging.jsp">
                            <jsp:param name="extraParam" value="&searchMsg=${param.searchMsg}"/>
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
                    url: "/gaent/msg/msgNotReadCnt", 
                    type: "GET", 
                    dataType: "json", 
                    success: function(notReadCnt) { 
                        $("#notReadCnt").text(notReadCnt);
                    },
                    error: function() { 
                        alert("error");
                    }
                });
            }
        });
    </script>
</body>
</html>
