<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <form action="/servlet/FormProcess.do" method="post">
      <div class="my-3">
        <label for="user-name" class="form-label">사용자 이름 : </label>
        <input type="text" class="form-control" id="user-name" name="userName" placeholder="사용자 이름을 입력하세요">
      </div>
      <div class="my-3">
        <label for="user-email" class="form-label">사용자 이메일 : </label>
        <input type="email" class="form-control" id="user-email" name="userEmail" placeholder="이메일 주소를 입력하세요">
      </div>
      <div class="my-3">
        <button type="submit" class="btn btn-primary">확인</button>
      </div>
    </form>
  </div>
</body>
</html>
