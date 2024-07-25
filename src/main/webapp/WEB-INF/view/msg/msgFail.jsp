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
        <h1>※ 열람권한이 없습니다 ※</h1>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
      
    </script>
</body>
</html>
