<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>액션태그 - include</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4 border">
    <h2>외부파일 1</h2>
    <%
      String newVar1 = "고구려 세운 동명왕";
    %>
    <ul>
      <li>page 영역 속성 : <%= pageContext.getAttribute("pAttr")%></li>
      <li>request 영역 속성 : <%= request.getAttribute("rAttr")%></li>
    </ul>
  </div>
</body>
</html>
