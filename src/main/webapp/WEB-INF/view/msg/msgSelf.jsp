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
            <h2 class="card-title" style="margin:30px">내게쓴쪽지함</h2>
            <div class="card-header">${loginInfo.email}</div>
            <div class="card-body">
                <div>
                    <table class="table table-bordered">
                        <tr>
                            <td style="padding-left:100px">
                                <span><a href="">읽음</a></span>
                                <span><a href="">삭제</a></span>
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
                                        <input type="checkbox">
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
</html>