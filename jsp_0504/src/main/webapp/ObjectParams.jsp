<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 10:39
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
  <%
    // 내장객체 request에 데이터 저장
    request.setAttribute("personObj", new Person("홍길동", 33));
    request.setAttribute("stringObj", "나는 문자열");
    request.setAttribute("integerObj", 99);
  %>
<%--  forward 시 액션태그의 param을 사용하여 매개변수로 데이터 2개 전달--%>
  <jsp:forward page="ObjectResult.jsp">
    <jsp:param name="firstNum" value="10"/>
    <jsp:param name="secondNum" value="20"/>
  </jsp:forward>
</body>
</html>
