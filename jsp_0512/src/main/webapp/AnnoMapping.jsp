<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-12
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>AnnoMapping.jsp</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>애너테이션으로 매핑하기</h2>
    <p>
      <strong>${message}</strong>
      <br>
      <a href="<%=request.getContextPath()%>/Servlet/AnnoMapping.do" class="btn btn-link">바로 가기</a>
    </p>
  </div>
</body>
</html>
