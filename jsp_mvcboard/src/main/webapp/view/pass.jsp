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
      $("#frm").on("submit", function () {
        const pass = $("#post-pass").val();
        
        if (pass == "" || pass == null || pass == undefined) {
          alert("비밀번호를 입력하세요.");
          $("#post-pass").focus();
        }
      })
      
      $("#btn-cancel").on("click", function () {
        history.back();
      })
    })
  </script>
</head>
</head>
<body>
  <c:import url="/layout/header.jsp">
    <c:param name="pageName" value="pass"/>
  </c:import>
  <main class="container my-4 py-4">
    <div class="row">
      <div class="col-sm-4 mx-auto">
        <form action="/mvcBoard/pass.do" method="post" id="frm">
          <div class="my-3">
            <label for="post-pass" class="form-label">비밀번호 : </label>
            <input type="password" class="form-control" id="post-pass" name="postPass" placeholder="비밀번호를 입력하세요">
          </div>
          <div>
            <input type="hidden" name="postIdx" value="${idx}">
            <input type="hidden" name="postMode" value="${mode}">
          </div>
          <div class="my-3 d-grid gap-2">
            <button type="submit" class="btn btn-primary">확인</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
        </form>
      </div>
    </div>
  </main>
  <%@ include file="/layout/footer.jsp"%>
</body>
</html>
