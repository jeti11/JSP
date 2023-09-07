<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Model1 방식 게시판 로그인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
</head>
<body>
<%@ include file="Header.jsp"%>
  <div class="container my-4">
    <div class="row">
      <div class="col-sm-4 mx-auto">
        <form action="LoginProcess.jsp" method="post">
          <div class="form-floating my-3">
            <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
            <label for="user-id" class="form-label">User ID</label>
          </div>
          <div class="form-floating my-3">
            <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호를 입력하세요">
            <label for="user-pw" class="form-label">User Pw</label>
          </div>
          <div class="my-3 d-grid gap-3">
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="button" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
<%@ include file="Footer.jsp"%>
</body>
</html>
