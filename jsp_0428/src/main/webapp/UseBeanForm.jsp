<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>액션태그 - useBean</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>액션 태그로 폼값 한 번에 받기</h2>
<%--    서버에 사용자 입력 데이터를 전송--%>
    <form method="post" action="UseBeanAction.jsp">
      이름 : <input type="text" name="name"/><br>
      나이 : <input type="text" name="age"/><br>
      <input type="submit" value="폼값 전송"/>
    </form>
  </div>
</body>
</html>
