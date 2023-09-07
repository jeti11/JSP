<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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
    <h2>폼값 전송하기</h2>
    <form action="FormResult.jsp" name="frm" method="post">
      이름 : <input type="text" name="name"><br>
      성별 : <input type="radio" name="gender" value="Man">남자
      <input type="radio" name="gender" value="Woman">여자<br>
      학력 :
      <select name="grade">
        <option value="ele">초딩</option>
        <option value="mid">중딩</option>
        <option value="high">고딩</option>
        <option value="uni">대딩</option>
      </select><br>
      관심사항 :
      <input type="checkbox" name="inter" value="pol">정치
      <input type="checkbox" name="inter" value="eco">경제
      <input type="checkbox" name="inter" value="ent">연예
      <input type="checkbox" name="inter" value="spo">운동
      <input type="submit" value="전송하기">
    </form>
  </div>
</body>
</html>
