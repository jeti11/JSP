<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#btn-cancel").on("click", function () {
        history.back();
      })
    })
  </script>
</head>
</head>
<body>
  <c:import url="/layout/header.jsp">
    <c:param name="pageName" value="edit"/>
  </c:import>
  <main class="container my-4 py-4">
    <div class="row">
      <div class="col-sm-4 mx-auto">
        <form action="/mvcBoard/Edit.do" method="post">
          <div class="my-3">
            <label for="post-idx" class="form-label">글번호</label>
            <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>
          </div>
          <div class="my-3">
            <label for="post-title" class="form-label">제목</label>
            <input type="text" class="form-control" id="post-title" name="postTitle" placeholder="제목을 입력하세요" value="${board.postTitle}">
          </div>
          <div class="my-3">
            <label for="post-writer" class="form-label">작성자</label>
            <input type="text" class="form-control" id="post-writer" name="postWriter" placeholder="작성자 ID를 입력하세요" value="${board.postWriter}">
          </div>
          <div class="my-3">
            <label for="post-pass" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="post-pass" name="postPass" placeholder="글 등록 비밀번호를 입력하세요">
          </div>
          <div class="my-3">
            <label for="post-content" class="form-label">내용</label>
            <textarea class="form-control" id="post-content" name="postContent" rows="5">${board.postContent}</textarea>
          </div>
          <div class="my-3">
            <label for="file" class="form-label">첨부파일</label>
            <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">
          </div>
          <div class="my-3">
            <div class="row">
              <div class="col-sm d-grid">
                <button type="submit" class="btn btn-primary">수정</button>
              </div>
              <div class="col-sm d-grid">
                <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </main>
  <%@ include file="/layout/footer.jsp"%>
</body>
</html>
