<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">쪽지쓰기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                     <!-- 쪽지쓰기 폼 -->
                    <form id="messageForm">
                            <!-- 숨겨진 필드에 로그인한 사용자의 ID -->
                            <input type="text" name="sender" value="${loginInfo.empCode}">
                        <div class="mb-3">
                            <label for="receiver" class="form-label">받는이</label>
                            <input type="text" class="form-control" id="receiver" name="receiver" required>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
<!--                            <label for="title" class="form-label">첨부파일</label> -->
<!--                            <input type="file" class="form-control" id="file" name="file" required> -->
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">보내기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>

</script>
</html>