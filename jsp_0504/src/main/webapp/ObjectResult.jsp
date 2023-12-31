<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0504.Person" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>표현언어 - 객체 전달</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>영역을 통해 전달된 객체 읽기</h2>
    <ul>
<%--      forward된 페이지에서 내장 객체 영역을 지정하지 않으면 request를 사용함--%>
<%--      personObj.name을 하면 getter 사용해서 필드 가져옴--%>
      <li>Person 객체 => 이름 : ${personObj.name}, 나이 : ${personObj.age}</li>
<%--  내장 객체 영역을 지정하여 데이터를 가져옴--%>
      <li>String 객체 => ${requestScope.stringObj}</li>
      <li>Integer 객체 => ${integerObj}</li>
    </ul>
    <h2>매개변수로 전달된 값 읽기</h2>
    <ul>
<%--      표현언어를 통해서 바로 연산하기--%>
      <li>${param.firstNum + param['secondNum']}</li>
      <li>${param.firstNum} + ${param['secondNum']}</li>
    </ul>
  </div>
</body>
</html>
