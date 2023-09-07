<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="utf-8">
  <title>내장 객체 - exception</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <%
    int status = response.getStatus();
    
    if (status == 404) {
      out.print("404 에러가 발생했습니다.");
      out.print("<br/>파일 경로를 확인해주세요");
    }
    else if (status == 405) {
      out.print("405 에러가 발생했습니다.");
      out.print("<br/>요청 방식(method)을 확인해주세요");
    }
    else if (status == 500) {
      out.print("500 에러가 발생했습니다.");
      out.print("<br/>소스코드에 오류가 없는지 확인해주세요");
    }
  %>
</body>
</html>
