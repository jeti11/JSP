<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>

<%
  // BoardList에서 넘겨준 글번호 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));
  
  // 데이터베이스 연결을 위해 BoardDAO 객체 생성
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  
  // select문 실행 전에 조회수가 올라가야 하기 때문에 selectBoard 메소드 앞에 위치해야 함
  //
  dao.updateVisitCount(postNum);
  
  // 글 번호를 매개변수로 하여 게시글의 모든 해당 글 내용을 가져오기
  BoardDTO board = dao.selectBoard(postNum);
  dao.dbClose();
  
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>model1 방식 게시판 만들기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <script>
    // BoardRead 페이지에서 목록 누르면 되돌아가는 J-Query 문법
    $(document).ready(function () {
      $('#btn-list').on('click', function () {
        history.back();
      })
  
      $('#btn-delete').on('click', function () {
        let confirmed = confirm("정말로 삭제하시겠습니까?")
        
        if (confirmed) {
          // 단순 링크를 사용하여 DeleteProcess.jsp로 이동하여 삭제
          const postNum = $('#post-num').val();
          let url = "DeleteProcess.jsp?postNum=" + postNum;
          location.href = url;
        }
      })
      
      $('#btn-edit').on('click', function () {
        // id값이 post-num인 html 태그의 value값을 가져오기
        const postNum = $('#post-num').val();
        // 이동하려고 하는 url 만들기
        let url = "BoardUpdate.jsp?postNum=" + postNum;
        // 자바스크립트의 페이지 이동 명령을 사용한 페이지 이동
        location.href = url;
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
    <h1 class="text-center">Model1 방식 게시판 글확인</h1>
  </div>
</header>
<main class="container my-4">
<%--  글번호, 글제목--%>
  <div class="row">
    <div class="col-sm-2">
      <label for="post-num" class="form-label">글 번호 : </label>
      <input type="text" class="form-control" id="post-num" name="postNum" value="<%= board.getPostNum()%>" disabled>
    </div>
    <div class="col-sm">
      <label for="post-title" class="form-label">글 제목 : </label>
      <input type="text" class="form-control" id="post-title" name="postTitle" value="<%= board.getPostTitle()%>">
    </div>
  </div>
<%--  글쓴이, 등록시간, 조회수--%>
  <div class="row my-3">
    <div class="col-sm">
      <label for="post-write-user" class="form-label">글쓴이 : </label>
      <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%= board.getPostWriteUser()%>" readonly>
    </div>
    <div class="col-sm">
      <label for="post-date" class="form-label">등록시간 : </label>
      <input type="text" class="form-control" id="post-date" name="postDate" value="<%= board.getPostDate()%>" readonly>
    </div>
    <div class="col-sm">
      <label for="post-visit-count" class="form-label">조회수 : </label>
      <input type="text" class="form-control" id="post-visit-count" name="postVisitcount" value="<%= board.getPostVisitcount()%>" readonly>
    </div>
  </div>
<%-- 글내용 --%>
  <div class="row my-3">
    <div class="col-sm">
      <label for="post-content" class="form-label">글내용 : </label>
      <textarea class="form-control" id="post-content" name="postContent" rows="10"><%= board.getPostContent()%></textarea>
    </div>
  </div>
<%-- 버튼 --%>
<%--  float--%>
<%--  <div class="row">--%>
<%--    <div class="col-sm clearfix">--%>
<%--      <button type="button" class="btn btn-success float-start" id="btn-list">목록</button>--%>
<%--      <button type="button" class="btn btn-primary float-end" id="btn-edit">수정</button>--%>
<%--      <button type="button" class="btn btn-danger float-end me-2" id="btn-delete">삭제</button>--%>
<%--    </div>--%>
<%--  </div>--%>

<%--  flex-box 사용하는 방식--%>
  <div class="row my-3">
    <div class="col-sm d-flex justify-content-start">
      <button type="button" class="btn btn-success" id="btn-list">목록</button>
    </div>
    <div class="col-sm d-flex justify-content-end">
<%--      1. form을 사용한 방식--%>
<%--      form태그 안에 자식 태그로 포함되어 있는 input태그의 데이터만 지정한 서버로 전송--%>
      <form action="DeleteProcess.jsp" method="post">
        <input type="hidden" name="postNum" value="<%= board.getPostNum()%>">
        <button type="submit" class="btn btn-danger me-2">1번 방식 삭제</button>
      </form>
  
<%--      2. a태그 사용한 방식--%>
      <a href="DeleteProcess.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-danger me-2">2번 방식 삭제</a>
      
<%--      3. JavaScript를 사용한 방식--%>
      <button type="button" class="btn btn-danger me-2" id="btn-delete">3번 방식 삭제</button>
  
<%--      1. a태그를 사용하여 BoardUpdate.jsp로 이동하는 방식--%>
<%--  <a href="BoardUpdate.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-primary">1번 수정</a>--%>
<%--      2. 자바스크립트 사용하여 BoardUpadate.jsp로 이동하는 방식--%>
      <button type="button" class="btn btn-primary" id="btn-edit">수정</button>
    </div>
  </div>
</main>
<footer class="container-fluid my-5 p-5 border-top">
  <p class="lead text-muted text-center">made by fullstack505</p>
</footer>
</body>
</html>
