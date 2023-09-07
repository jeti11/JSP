<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>한 번의 요청으로 여러가지 요청 처리</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h3>한 번의 매핑으로 여러 가지 요청 처리하기</h3>
<%--    EL언어 사용, 내용이 없을 경우 표시 안함--%>
    ${resultValue}
    <ol>
      <li>URI : ${uri}</li>
      <li>요청명 : ${commandStr}</li>
    </ol>
    <ul>
<%--      a태그를 사용한 페이지 이동은 get방식임--%>
      <li><a href="/servlet/regist.one" class="btn btn-link">회원가입</a></li>
      <li><a href="/servlet/login.one" class="btn btn-link">로그인</a></li>
      <li><a href="/servlet/freeboard.one" class="btn btn-link">자유게시판</a></li>
    </ul>
    
    <h4>여러가지의 요청을 여러개의 servlet으로 처리</h4>
    <ul>
      <li><a href="/servlet/regist.two" class="btn btn-link">회원가입</a></li>
      <li><a href="/servlet/login.two" class="btn btn-link">로그인</a></li>
      <li><a href="/servlet/freeboard.two" class="btn btn-link">자유게시판</a></li>
    </ul>
  </div>
</body>
</html>
