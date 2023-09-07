<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2023-05-24
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>드라마 게시판 글 수정 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#btn-cancel").on("click", function () {
        history.back();
      })
    })
  </script>
</head>
<body>
  <c:import url="/layout/header.jsp"/>
  <main class="container my-4">
    <div class="row">
      <div class="col-sm-5 mx-auto">
        <div class="my-5 text-center">
          <h4>#드라마 게시판 글 수정</h4>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-8 mx-auto">
        <form action="/blog/dramaEdit.do?idx=${editDrama.getIdxDrama()}" method="post" enctype="multipart/form-data">
          <div class="my-4">
            <label for="cate" class="form-label">카테고리</label>
            <input type="text" class="form-control" id="cate" name="cate" value="${editDrama.getCate()}" readonly>
          </div>
          <div class="my-4">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${editDrama.getTitle()}">
          </div>
          <div class="my-4">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control" id="content" name="content" rows="7">${editDrama.getContent()}</textarea>
          </div>
          <div class="my-4">
            <label for="file" class="form-label">첨부파일</label>
            <input type="file" class="form-control" id="file" name="file" placeholder="첨부 파일을 선택하세요">
          </div>
          <div class="my-4 d-flex justify-content-end">
            <button type="submit" class="btn btn-primary me-2">수정</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
        </form>
      </div>
    </div>
  </main>
  <c:import url="/layout/footer.jsp"/>
</body>
</html>
