<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<%
  ArrayList<String> lists = new ArrayList<>();
  lists.add("리스트");
  lists.add("컬렉션");
  session.setAttribute("lists", lists);
%>
<html>
<head>
  <meta charset="utf-8">
  <title>session 영역</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>페이지 이동 후 session 영역의 속성 읽기</h2>
  <a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>
