<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0427.DBConnPool" %>

<%
  request.setCharacterEncoding("UTF-8");
  String postTitle = request.getParameter("title");
  String postContent = request.getParameter("content");
  String postId = request.getParameter("userId");
  
  DBConnPool pool = new DBConnPool();

  
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Quiz02 글 확인 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <%
      try {
        pool.postList();
        pool.close();
      }
      catch (Exception e) {
        out.println(e.getMessage());
      }
    %>
  </div>
</body>
</html>
