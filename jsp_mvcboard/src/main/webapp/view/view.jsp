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
      $("#btn-list").on("click", function () {
        history.back();
      })
      
      $("#btn-edit").on("click", function () {
        const postIdx = $("#post-idx").val()
        location.href = "/mvcBoard/pass.do?mode=edit&idx=" + postIdx;
      })
      
      $("#btn-delete").on("click", function () {
        const postIdx = $("#post-idx").val()
        location.href = "/mvcBoard/pass.do?mode=delete&idx=" + postIdx;
      })
      
      $("#post-ofile").on("click", function () {
        const postIdx = $("#post-idx").val();
        const postOfile = $("#post-ofile").val();
        const postSfile = $("#post-sfile").val();
        
        location.href = "/mvcBoard/Download.do?ofile=" + postOfile + "&sfile=" + postSfile + "&idx=" + postIdx;
      })
    })
  </script>
</head>
</head>
<body>
  <c:import url="/layout/header.jsp">
    <c:param name="pageName" value="view"/>
  </c:import>
  <main class="container my-4 py-4">
    <div class="row my-3">
      <div class="col-sm">
        <label for="post-idx" class="form-label">글 번호</label>
        <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>
      </div>
      <div class="col-sm">
        <label for="post-writer" class="form-label">작성자</label>
        <input type="text" class="form-control" id="post-writer" name="postWriter" value="${board.postWriter}" readonly>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm">
        <label for="post-date" class="form-label">작성일</label>
        <input type="text" class="form-control" id="post-date" name="postDate" value="${board.postDate}" readonly>
      </div>
      <div class="col-sm">
        <label for="post-visits" class="form-label">조회수</label>
        <input type="text" class="form-control" id="post-visits" name="postVisits" value="${board.postVisits}" readonly>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm">
        <label for="post-title" class="form-label">제목</label>
        <input type="text" class="form-control" id="post-title" name="postTitle" value="${board.postTitle}" readonly>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm">
        <label for="post-content" class="form-label">내용</label>
        <textarea class="form-control" id="post-content" name="postContent" rows="5">${board.postContent}</textarea>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm">
        <label for="post-ofile" class="form-label">첨부파일</label>
        <input type="text" class="form-control" id="post-ofile" name="postOfile" value="${board.postOfile}" readonly>
        <input type="hidden" id="post-sfile" value="${board.postSfile}">
      </div>
      <div class="col-sm">
        <label for="post-dn-count" class="form-label">다운로드 수</label>
        <input type="text" class="form-control" id="post-dn-count" name="postDnCount" value="${board.postDnCount}" readonly>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm mx-auto">
        <button type="button" class="btn btn-success" id="btn-list">글목록</button>
      </div>
      <div class="col-sm mx-auto d-flex justify-content-end">
        <button type="button" class="btn btn-primary me-2" id="btn-edit">수정</button>
        <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
      </div>
    </div>
  </main>
<%@ include file="/layout/footer.jsp"%>
</body>
</html>
