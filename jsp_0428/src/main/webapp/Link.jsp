<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <table class="table table-striped">
      <tr>
        <td class="text-center">
          <%
            if (session.getAttribute("userId") == null) {
          %>
          <a href="LoginForm.jsp">로그인</a>
          <%
            }
            else {
          %>
          <a href=Logout.jsp>로그아웃</a>
          <%
            }
          %>
          
          &nbsp;&nbsp;&nbsp;
          <a href="./List.jsp">게시판(페이징x)</a>
          &nbsp;&nbsp;&nbsp;
          <a href="./List.jsp">게시판(페이징O)</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>
