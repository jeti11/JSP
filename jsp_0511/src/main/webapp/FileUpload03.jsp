<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>FileUpload03</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <form action="FileUpload03Process.jsp" method="post" enctype="multipart/form-data">
      <label for="file">파일 : </label>
      <input type="file" id="file" name="file"><br><br>
      <button type="submit" class="btn btn-primary">파일 전송</button>
    </form>
  </div>
</body>
</html>
