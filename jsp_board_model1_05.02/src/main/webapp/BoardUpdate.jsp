<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>

<%
  // 이전 페이지에서 전달한 현재 글 번호 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));
  
  // 데이터베이스 연결
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  // 현재 글 내용 불러오기
  
  BoardDTO board = dao.selectBoard(postNum);
  dao.dbClose();
  
  
%>
<%--현재 페이지에 글내용을 가져오기가 필요함--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>model1 방식 게시판</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <script>
    $(document).ready(function () {
      $('#btn-cancel').on('click', function () {
        history.back();
      })
    })
  </script>
</head>
</head>
<body>
<header class="mb-4">
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
    <ul class="navbar-nav">
      <li class="nav-item"><a href="#" class="nav-link">메뉴 1</a></li>
    </ul>
  </nav>
  <div class="container my-4 py-5 bg-secondary bg-opacity-50">
    <h1 class="text-center">Model1 방식 게시판 글 수정 페이지</h1>
  </div>
</header>
<main class="container my-4">
  <form action="UpdateProcess.jsp" method="post">
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-num" class="form-label">글 번호 : </label>
        <input type="text" class="form-control" id="post-num" name="postNum" value="<%= board.getPostNum()%>" readonly>
      </div>
    </div>
    <%--  글제목--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-title" class="form-label">글 제목 : </label>
        <input type="text" class="form-control" id="post-title" name="postTitle" value="<%= board.getPostTitle()%>" placeholder="제목을 입력해주세요">
      </div>
    </div>
    <%--  글쓴이--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-write-user" class="form-label">글쓴이 : </label>
        <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%= board.getPostWriteUser()%>" readonly>
      </div>
    </div>
    <%--  글내용--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-content" class="form-label">글 내용 : </label>
        <textarea name="postContent" id="post-content" rows="5" class="form-control" placeholder="내용을 입력해주세요"><%= board.getPostContent()%></textarea>
      </div>
    </div>
    <%--  글번호--%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto d-flex justify-content-end">
        <button type="submit" class="btn btn-primary me-2">등록</button>
        <button type="reset" class="btn btn-danger" id="btn-cancel">취소</button>
      </div>
    </div>
  </form>
</main>
<footer class="container-fluid my-5 p-5 border-top">
  <p class="lead text-muted text-center">made by fullstack505</p>
</footer>
</body>
</html>
