<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>FileUpload04</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <form action="FileUpload04Process.jsp" method="post" enctype="multipart/form-data">
      <label for="user-name" class="form-label">이름 : </label>
      <input type="text" id="user-name" name="userName" class="form-control"><br>
      <label for="title" class="form-label">제목 : </label>
      <input type="text" id="title" name="title" class="form-control"><br>
      <label for="file" class="form-label">파일 : </label>
      <input type="file" id="file" name="file" class="form-control"><br>
  
      <button type="submit" class="btn btn-primary">파일 업로드</button>
    </form>
  </div>
</body>
</html>
