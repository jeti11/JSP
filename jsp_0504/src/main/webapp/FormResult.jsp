<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--<%--%>
<%--  request.setCharacterEncoding("UTF-8");--%>
<%--%>--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>표현언어 - 폼값 처리</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h3>EL로 폼값 받기</h3>
    <ul>
      <li>이름 : ${param.name}</li>
      <li>성별 : ${param.gender}</li>
      <li>학력 : ${param.grade}</li>
      <li>관심사항 : ${paramValues.inter[0]}
      ${paramValues.inter[1]}
      ${paramValues.inter[2]}
      ${paramValues.inter[3]}</li>
    </ul>
  </div>
</body>
</html>
