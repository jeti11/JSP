<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="utf-8">
  <title>내장 객체 - request</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>3. 요청 헤더 정보 출력하기</h2>
  <%
    Enumeration headers = request.getHeaderNames();
    while (headers.hasMoreElements()) {
      String headerName = (String)headers.nextElement();
      String headerValue = request.getHeader(headerName);
      out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br/>");
    }
  %>

  <p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</body>
</html>
