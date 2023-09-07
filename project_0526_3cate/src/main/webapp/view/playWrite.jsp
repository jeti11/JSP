<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>플레이리스트 글쓰기 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<c:import url="/layout/header.jsp"/>
<main class="container my-4">
  <div class="row">
    <div class="col-sm-5 mx-auto">
      <div class="my-5 text-center">
        <h4>#플레이리스트 게시판 글쓰기</h4>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-8 mx-auto">
      <form action="/blog/playWrite.do" method="post" enctype="multipart/form-data">
        <div class="my-4">
          <label for="cate" class="form-label">카테고리</label>
          <select class="form-select" id="cate" name="cate" aria-label="Default select example">
            <option value="플레이리스트" selected>플레이리스트</option>
            <option value="일상">일상</option>
            <option value="드라마 리뷰">드라마 리뷰</option>
          </select>
        </div>
        <div class="my-4">
          <label for="title" class="form-label">제목</label>
          <input type="text" class="form-control" id="title" name="title">
        </div>
        <div class="my-4">
          <label for="content" class="form-label">내용</label>
          <textarea class="form-control" id="content" name="content" rows="7"></textarea>
        </div>
        <div class="my-4">
          <label for="file" class="form-label">첨부파일</label>
          <input type="file" class="form-control" id="file" name="file" placeholder="첨부 파일을 선택하세요">
        </div>
        <div class="my-4 d-flex justify-content-end">
          <button type="submit" class="btn btn-primary me-2">등록</button>
          <a href="/blog/playList.do" class="btn btn-secondary">취소</a>
        </div>
      </form>
    </div>
  </div>
</main>
<c:import url="/layout/footer.jsp"/>
</body>
</html>
