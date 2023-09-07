<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>LoginResult.jsp</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <div class="row">
      <div class="col-sm-4 mx-auto">
        <p><strong>${userName}${userGrade}</strong>님 반갑습니다.</p>
        <a href="/servlet/Login.jsp" class="btn btn-link">로그인 페이지로 돌아가기</a>
      </div>
    </div>
  </div>
</body>
</html>
