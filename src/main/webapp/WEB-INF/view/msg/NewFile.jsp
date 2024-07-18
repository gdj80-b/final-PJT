<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div>
        <img src="/gaent/upload/msgfile/thumbs.jpeg">
        <form action="/gaent/msg/test22" method="post" enctype="multipart/form-data">
            <input type="file" name="gaFile">
<!--             <input type="text" name="test"> -->
            <button type="submit">전송</button>
        </form>
    </div>
</body>
</html>