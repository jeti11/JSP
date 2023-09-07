<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>MemberAuth.jsp</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>MVC 패턴으로 회원인증하기</h2>
    <p><strong>${authMessage}</strong></p>
    <br>
    <a href="/servlet/MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
    <a href="/servlet/MemberAuth.mvc?id=testuser1&pass=1234">회원인증(회원)</a>
    <a href="/servlet/MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
  </div>
</body>
</html>
