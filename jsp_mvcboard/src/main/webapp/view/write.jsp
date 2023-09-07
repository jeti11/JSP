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
</head>
</head>
<body>
<%--액션 태그의 include로 페이지 불러오기--%>
  <jsp:include page="/layout/header.jsp">
    <jsp:param name="pageName" value="write"/>
  </jsp:include>

<%--JSTL import 사용해서 페이지 불러오기--%>
<%--  <c:import url="/layout/header.jsp"/>--%>
  <main class="container my-4 py-4">
    <div class="row my-3">
      <div class="col-sm-4 mx-auto">
        <form action="/mvcBoard/Write.do" method="post" enctype="multipart/form-data">
          <div class="my-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
          </div>
          <div class="my-3">
            <label for="writer" class="form-label">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 ID를 입력하세요">
          </div>
          <div class="my-3">
            <label for="pass" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="글 등록 비밀번호를 입력하세요">
          </div>
          <div class="my-3">
            <label for="content" class="form-label">컨텐츠</label>
            <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력하세요"></textarea>
          </div>
          <div class="my-3">
            <label for="file" class="form-label">첨부파일</label>
            <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">
          </div>
          <div class="my-3">
            <div class="row">
              <div class="col-sm d-grid">
                <button type="submit" class="btn btn-primary">글 등록</button>
              </div>
              <div class="col-sm d-grid">
                <a href="/mvcBoard/List.do" class="btn btn-secondary">취소</a>
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
