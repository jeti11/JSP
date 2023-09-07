<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>서블릿으로 데이터 처리 후 View 로 전달 시 보여줄 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>서블릿 사용 후 View로 사용되는 JSP 페이지</h2>
    <ul>
      <li>사용자 이름 : ${userName}</li>
      <li>사용자 이메일 : ${userEmail}</li>
      <li>사용한 방식 : ${type}</li>
    </ul>
  
    <a href="/servlet/Form.jsp" class="btn btn-link">Form.jsp로 이동</a>
  </div>
</body>
</html>
