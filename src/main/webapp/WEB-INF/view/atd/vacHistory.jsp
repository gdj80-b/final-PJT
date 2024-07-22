<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
<style>
    
    .vacCard {
        max-width: 100%;
        height: 50rem;
        overflow-x: hidden;
        overflow-y: auto;
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
    
    .vacInfo{
        display: flex;
        flex-direction: column;
        align-items: center;
    
    }
    
</style>
</head>
<body>
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/atd/atd-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace ">
        <div class="card vacCard">
            <h2 class="card-title" style="margin:50px 0px 0px 40px"><strong>휴가내역</strong></h2>
            <div class="vacInfo" style="padding:0em 14em; margin-top:3em;">
                    <table class="table" style="border:1px solid black;">
                        <tr>
                            <td>총연차</td>
                            <td>사용연차</td>
                            <td>잔여연차</td> 
                        </tr>
                        <tr>
                            <td>${loginInfo.totalLeave}일</td>
                            <td>${loginInfo.useLeave}일</td>
                            <td>${loginInfo.totalLeave-loginInfo.useLeave}일</td> 
                        </tr>
                    
                    </table>
            
            </div>
            <div class="card-body" style="padding:2em 6em 0em 6em ;">
               <table class="inbox-table">
                  <thead class="">
                    <tr>
                        <th style="width:">이름</th>
                        <th style="width:">휴가종류</th>
                        <th style="width:">연차사용기간</th>
                        <th style="width:">사용 연차</th>
                        <th style="width:">사유</th>
                    </tr>
                  </thead>
                    <tbody>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="5" style="text-align:center">휴가 내역이 없습니다</td>
                            </tr>
                        </c:if>
                        <c:forEach var="m" items="${list}">
                            
                            <tr>
                                <td>${loginInfo.korName}</td>
                                <td>${m.vacType}</td>
                                <td>${m.vacStartDate}~${m.vacEndDate}</td>
                                <td>${m.vacPeriod}일</td>
                                <td>${m.vacReason}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- 페이징시작 -->
               <div>
                    <jsp:include page="/WEB-INF/view/common/paging.jsp">
                        <jsp:param name="pageUrl" value="/gaent/atd/vacation"/>
                        <jsp:param name="extraParam" value=""/>
                    </jsp:include>
               </div>
               <!-- 페이징끝 -->
            </div>
        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
      	vacationStatus();
      
 
    });
</script>
</body>
</html>
