<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>
<%@ page import="java.util.List" %>

<%--글쓰기 페이지 -> 처리 페이지--%>
<%--수정 페이지 -> 처리 페이지--%>
<%--삭제 페이지(필요x) -> 처리페이지--%>
<%--글읽기 페이지--%>

<%
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  
  // 게시물 전체 리스트 가져와서 boardList에 저장
  List<BoardDTO> boardList = dao.selectList();
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
      <h1 class="text-center">Model1 방식 게시판 목록</h1>
    </div>
  </header>
  <main class="container my-4">
    <table class="table table-hover table-striped">
      <thead>
        <tr>
          <th>글번호</th>
          <th>글제목</th>
          <th>글쓴이</th>
          <th>등록일</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
      <%
        // 가져온 게시물의 크기 확인
        if (boardList.size() != 0) { // 게시물이 존재하면
          for (BoardDTO dto : boardList) {
      %>
      <tr>
        <td><%=dto.getPostNum()%></td>
<%--    제목 표시 부분에 해당 글을 읽기 위한 링크를 설정--%>
        <td><a href="BoardRead.jsp?postNum=<%=dto.getPostNum()%>" class="text-decoration-none"><%=dto.getPostTitle()%></a></td>
        <td><%=dto.getPostWriteUser()%></td>
        <td><%=dto.getPostDate()%></td>
        <td><%=dto.getPostVisitcount()%></td>
      </tr>
      <%
          }
        }
        else { // 게시물이 없으면
      %>
      <tr>
        <td colspan="5">게시물이 없습니다.</td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
    <div class="container my-4 d-flex justify-content-end">
      <a href="BoardWrite.jsp" class="btn btn-primary">글쓰기</a>
    </div>
  </main>
  <footer class="container-fluid my-5 p-5 border-top">
    <p class="lead text-muted text-center">made by fullstack505</p>
  </footer>
</body>
</html>