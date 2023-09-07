<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Quiz02 글 등록 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<%

%>
<%--문제2) JDBConnect 클래스에 게시판의 글을 등록하는 postWrite(글쓰기), postList(글전체목록 불러오기) 메소드를 추가하고, 해당 메소드를 사용하여 게시판의 글 목록을 확인하는 프로그램을 작성하세요--%>
<%--해당 클래스의 필드의 접근제한자를 모두 private로 수정--%>
<%--글등록 페이지, 리스트 확인 페이지--%>
  <div class="container my-4">
    <div class="row">
      <div class="col-sm-6 mx-auto border p-3">
        <form action="Quiz02List.jsp">
          <label class="form-label" for="title">글 제목</label>
          <input type="text" class="form-control" name="title" id="title" placeholder="글 제목을 입력하세요"><br>
          <label class="form-label" for="content">글 내용</label>
          <input type="text" class="form-control" name="content" id="content" placeholder="글 내용을 입력하세요"><br>
          <label class="form-label" for="userId">글쓴이 ID</label>
          <input type="text" class="form-control" name="userId" id="userId" placeholder="ID를 입력하세요"><br>
          
          <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-primary me-1">등록</button>
            <button type="submit" class="btn btn-danger">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
