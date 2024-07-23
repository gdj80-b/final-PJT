<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품구매</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        .modal-header {
            background-color: #red;
            color: white;
        }
        .modal-body {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div id="header-area">
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </div>
    <div id="sidebar_area">
        <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/view/product/prod-sub-sidebar.jsp"></jsp:include>
    </div>
    <div id="workspace-area" class="subsidebar-from-workspace">
        <div style="display: flex">
            <c:forEach var="m" items="${list}">
                <div class="card" style="margin: 2em; width: 40em;">
                    <table class="table">
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <c:choose>
                                    <c:when test="${m.prodCategory == '식권'}">
                                        <c:set var="icon" value="bx bx-bowl-rice" />
                                    </c:when>
                                    <c:when test="${m.prodCategory == '주차권'}">
                                        <c:set var="icon" value="bx bx-credit-card-front" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="icon" value="" />
                                    </c:otherwise>
                                </c:choose>
                                <i style="font-size: 60px;" class="${icon}"></i>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>${m.prodContent}</td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td>${m.prodPrice}원</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <form id="purchase-form-${m.prodCode}" action="/gaent/prod/toss" method="post">
                                    <input type="hidden" name="prodCode" value="${m.prodCode}"> 
                                    <input type="hidden" name="prodContent" value="${m.prodContent}"> 
                                    <input type="hidden" name="prodPrice" value="${m.prodPrice}">
                                    <button type="button" class="btn btn-primary purchase-button" data-toggle="modal" data-target="#confirmModal" data-prodname="${m.prodContent}" data-prodprice="${m.prodPrice}">구매</button>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="confirmModalLabel">구매 확인</h3>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="modalProductName"></p>
                    <p id="modalProductPrice"></p>
                    <hr>
                     구매하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="confirmPurchase">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        let formId = '';

        function setFormId(id) {
            formId = id;
        }

        function submitForm() {
            $('#' + formId).submit();
        }

        $(document).ready(function() {
            $('.purchase-button').click(function() {
                let prodName = $(this).data('prodname');
                let prodPrice = $(this).data('prodprice');
                formId = $(this).closest('form').attr('id');

                $('#modalProductName').text('상품 이름: ' + prodName);
                $('#modalProductPrice').text('가격: ' + prodPrice + '원');
            });

            $('#confirmPurchase').click(function() {
                submitForm();
            });
        });
    </script>
</body>
</html>
