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
        body {
            font-family: Arial, sans-serif;
        }
        
        .inbox-container {
            margin-top: 20px;
        }
        .inbox-header {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .inbox-actions span, .inbox-actions button {
            margin-right: 15px;
        }
        .inbox-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .inbox-table th, .inbox-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .inbox-table th {
            background-color: #f9f9f9;
        }
        .inbox-table tr:hover {
            background-color: #f1f1f1;
        }
        .checkbox {
            text-align: center;
            width: 60px;
        }
        .msg-sub-size {
            width: 140px;
            text-align: center;
        }
        .msg-state-size {
            width: 80px;
            text-align: center;
        }
        .msg-time-size {
            width: 200px;
            text-align: right;
        }
        .msg-sh-btn{
            text-decoration: none;   /* 링크의 기본 밑줄 제거 */
            padding: 5px 5px;      /* 버튼의 패딩 조정 */
            color: white;            /* 버튼의 텍스트 색상 */
            border-radius: 5px;      /* 버튼의 모서리 둥글게 */
            display: inline-block;   /* 버튼이 줄바꿈 없이 나란히 위치하도록 설정 */
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
            <h2 class="card-title" style="margin:50px 0px 0px 30px">전체쪽지함</h2>            
            <div class="card-body inbox-container">            
                <div class="care-body" style="height:600px; position: relative;">
                    <table class="inbox-table">
                        <thead>
                            <tr>
                                <th colspan="3">
                                    전체 : ${pg.lastRow}개
                                </th>
                                <th style="padding-left:80px">
                                    <form class="d-flex align-items-center" action="/gaent/msg/0">
                                        <span style="width:600px">
                                        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요..." aria-label="Search" name="searchMsg">
                                        </span>
                                        <button class="btn btn-secondary msg-sh-btn" type="submit">검색</button>
                                    </form>
                                </th>
                                <th style="text-align:right">
                                    <button type="button" id="readButton" class="btn btn-success">읽음</button>
                                    <button type="button" id="deleteButton" class="btn btn-danger">삭제</button>
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
                                    <td colspan="4" style="text-align:center">쪽지가 없습니다</td>
                                </tr>
                            </c:if>
                            <c:forEach var="m" items="${list}">
                                <tr>
                                    <td class="checkbox">
                                        <input type="checkbox" class="form-check-input form-check-input-lg" name="msgNum" value="${m.msgNum}">
                                    </td>
                                    <td class="msg-state-size">
                                        ${m.receiver == m.sender ? '<span style="color:skyblue">자신</span>' :
                                         (m.receiver == loginInfo.empCode ? '<span style="color:purple">수신</span>'
                                         : '<span style="color:orange">발신</span>') }
                                     </td>                                    
                                    <td class="msg-sub-size">${m.receiver == m.sender ? '내게쓰기' : (m.receiver == loginInfo.empCode ? m.receiverName : m.senderName) }</td>
                                    <td class="msg-title-size">
                                        <a href="/gaent/msg/msgDetail/${m.msgNum}" style="color: ${m.readTime == null ? 'black' : '#A0A0A0'}">
                                            ${m.msgTitle}
                                        </a>
                                    </td>
                                    <td class="msg-time-size">${m.sendTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- 페이징 -->
                    <nav aria-label="Page navigation" style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%);">
                        <ul class="pagination">
                            <li class="page-item first <c:if test="${pg.currentPage==1}">disabled</c:if>">
                                <a class="page-link" href="/gaent/msg/0?currentPage=1">
                                    <i class="tf-icon bx bx-chevrons-left"></i>
                                </a>
                            </li>
                            <li class="page-item prev <c:if test="${pg.currentPage==1}">disabled</c:if>">
                                <a class="page-link" href="/gaent/msg/0?currentPage=${pg.currentPage-1}">
                                    <i class="tf-icon bx bx-chevron-left"></i>
                                </a>
                            </li>
                            <c:forEach var="i" begin="${pg.firstPage}" end="${pg.lastPage}">
                                <li class="page-item <c:if test="${pg.currentPage==i}"> active</c:if>">
                                    <a class="page-link" href="/gaent/msg/0?currentPage=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item next <c:if test="${pg.currentPage==pg.totalPage}">disabled</c:if>">
                                <a class="page-link" href="/gaent/msg/0?currentPage=${pg.currentPage+1}">
                                    <i class="tf-icon bx bx-chevron-right"></i>
                                </a>
                            </li>
                            <li class="page-item last <c:if test="${pg.currentPage==pg.totalPage}">disabled</c:if>">
                                <a class="page-link" href="/gaent/msg/0?currentPage=${pg.totalPage}">
                                    <i class="tf-icon bx bx-chevrons-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
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
