<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/msg-card.css"/>
    </head>
    <body>
        <div class="msg-card">
            <div class="card msg">
                <div class="card-body">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <i class="bx bxs-inbox fs-4 me-2"></i>
                            <h4>쪽지함</h4>
                        </div>
                        <div class="d-flex">
                            <label>안읽은 쪽지함&nbsp;</label>
                            <span id="unreadMessageCnt"></span>개
                            <span>&nbsp;/&nbsp;</span>
                            <span id="messageCnt"></span>개
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap d-flex flex-column align-items-center justify-content-between text-center">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>보낸이</th>
                                    <th>내용</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody id="messageTableBody" class="table-border-bottom-0"></tbody>
                        </table>
                        <div class="mt-2">
                            <nav aria-label="Page navigation" style="">
                                <ul class="pagination">
                                    <li id="messagePrev" class="page-item prev">
                                        <button id="messagePrevBtn" class="page-link"><i class="tf-icon bx bx-chevron-left"></i></button>
                                    </li>
                                    <li id="messageNowPage" class="page-item">
                                    </li>
                                    <li id="messageNext" class="page-item next">
                                        <button id="messageNextBtn" class="page-link"><i class="tf-icon bx bx-chevron-right"></i></button>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // 첫 번째, 마지막 페이지 초기값
            let messageFirstPage = 1;
            let messageTotalPage = 0;
        
            $(document).ready(function() {
                
                // 현재 페이지 초기값
                let messagePage = 1;
                
                // 쪽지함 조회
                getHomeMessage(messagePage);
                
                // 읽지 않은 쪽지 갯수 조회
                ureadMessage();
                
                // 받은 쪽지의 총 갯수 조회
                getMessageCnt();
                
                // 현재 페이지
                updatePageDisplay(messagePage);
                
                // 이전 버튼
                $('#messagePrevBtn').click(function() {
                    if(messagePage > messageFirstPage) {
                        messagePage--;
                        messageUpdatePage(messagePage);
                    }
                });
                
                // 다음 버튼
                $('#messageNextBtn').click(function() {
                    if(messagePage < messageTotalPage) {
                        messagePage++;
                        messageUpdatePage(messagePage);
                    }
                });
            });
            
            function messageUpdatePage(messageNewPage) {
                messagePage = messageNewPage;
                getHomeMessage(messagePage);
                getMessageCnt(messagePage);
                updatePageDisplay(messagePage);
            }
            
            function updatePageDisplay(messagePage) {
                $('#messageNowPage').html('<a class="page-link">' + messagePage + '</a>');
                $('#messagePrevBtn').toggleClass('disabled', messagePage <= messageFirstPage);
                $('#messageNextBtn').toggleClass('disabled', messagePage >= messageTotalPage);
            }
            
            function getHomeMessage(messagePage) {
                $.ajax({
                    url: '/gaent/home/message?currentPage=' + messagePage,
                    type: 'GET',
                    success: function(data) {
                        // console.log(data);
                        const tableBody = $('#messageTableBody');
                        tableBody.empty();
                        
                        data.slice(0, 5).forEach((el) => {
                            const row = $('<tr>').css('cursor', 'pointer').on('click', function() {
                                location.href = `/gaent/msg/msgDetail/${el.msgNum}`;
                            });

                            const senderCell = $('<td>').append(
                                $('<div>').addClass('text-light msg-sender').text(el.senderName)
                            );

                            const titleCell = $('<td>').addClass('text-end').append(
                                $('<div>').addClass('msg-title').text(el.msgTitle.trim().length > 0 ? (el.msgTitle.trim().length > 12 ? `${el.msgTitle.trim().substring(0, 12)}...` : el.msgTitle.trim()) : '제목 없음')
                            );

                            const dateCell = $('<td>').append(
                                $('<div>').addClass('text-light msg-date ms-2').text(el.sendTime.substring(0, 10))
                            );

                            row.append(senderCell, titleCell, dateCell);
                            tableBody.append(row);
                        });
                    },
                    error: function(e) {
                        alert('쪽지함 내용을 불러오는데 실패했습니다.');
                    }
                });
            }
            
            function ureadMessage() {
                $.ajax({
                    url: '/gaent/unreadMessage',
                    type: 'GET',
                    success: function(data) {
                        $('#unreadMessageCnt').text(data);
                    },
                    error: function(e) {
                        console.log(e);
                        alert('error');
                    }
                });
            }
            
            function getMessageCnt(messagePage) {
                $.ajax({
                    url: '/gaent/home/message/page',
                    type: 'GET',
                    data: messagePage,
                    success: function(data) {
                        // console.log(data);
                        $('#messageCnt').text(data.lastRow);
                        messageTotalPage = data.totalPage;
                    },
                    error: function(e) {
                        console.log(e);
                        alert('error');
                    }
                });
            }
        </script>
    </body>
</html>
