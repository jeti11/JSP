<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Login.jsp</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <div class="row">
      <div class="col-sm-4 mx-auto border rounded">
        <form action="/servlet/LoginProcess.do" method="post">
          <div class="my-3">
            <label for="user-id" class="form-label">User ID : </label>
            <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
          </div>
          <div class="my-3">
            <label for="user-pw" class="form-label">User PW : </label>
            <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호를 입력하세요">
          </div>
          <div class="my-3 d-grid gap-2">
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="reset" class="btn btn-secondary">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
