<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오후 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>PrepareStatement로 SQL 쿼리 사용하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <div class="row">
      <div class="col-sm-6 mx-auto">
        <form action="Insert02_process.jsp" method="post">
          <div class="my-3">
            <label for="title" class="form-label">글 제목 : </label>
            <input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력하세요">
          </div>
          <div class="my-3">
            <label for="user-id" class="form-label">사용자 ID : </label>
            <input type="text" class="form-control" id="user-id" name="userId" placeholder="글쓴이의 ID를 입력해주세요">
          </div>
          <div class="my-3">
            <label for="content" class="form-label">글 내용 : </label>
            <textarea type="text" class="form-control" id="content" name="content" rows="5"></textarea>
          </div>
          <div class="my-3 d-flex justify-content-end">
            <button type="submit" class="btn btn-primary me-1">글 등록</button>
            <button type="reset" class="btn btn-secondary">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
