<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>model1 방식 게시판 만들기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <script>
    $(document).ready(function () {
      $('#btn-reset').on('click', function () {
        history.back();
      })
    })
  </script>
</head>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="container my-4">
  <div class="row">
    <div class="col-sm-6 mx-auto">
      <form name="writeFrm" method="post" action="WriteProcess.jsp">
        <div class="my-3">
          <label for="post-title" class="form-label">제목 : </label>
          <input type="text" class="form-control" id="post-title" name="postTitle" placeholder="제목을 입력하세요">
        </div>
        <div class="my-3">
          <label for="post-content" class="form-label">내용 : </label>
          <textarea class="form-control" id="post-content" name="postContent" rows="5" placeholder="내용을 입력하세요"></textarea>
        </div>
        <div class="my-3 d-grid gap-3">
          <button type="submit" class="btn btn-primary">글 등록</button>
          <button type="reset" class="btn btn-secondary" id="btn-reset">취소</button>
        </div>
      </form>
    </div>
  </div>
</main>
<%@ include file="Footer.jsp"%>
</body>
</html>
