<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0424.Person" %>

<html>
<head>
  <meta charset="utf-8">
  <title>request 영역</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>포워드로 전달된 페이지</h2>
  <h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
  <%
    // forward로 인해 이전 페이지의 request, response 내장 객체를 가져와서 사용함
    Person pPerson = (Person)(request.getAttribute("requestPerson"));
  %>
  <ul>
    <li>String 객체 : <%= request.getAttribute("requestString")%></li>
    <li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
  </ul>
  <h4>매개변수로 전달된 값 출력하기</h4>
  <%
    request.setCharacterEncoding("UTF-8");
    out.println(request.getParameter("paramHan"));
    out.println(request.getParameter("paramEng"));
  %>
</body>
</html>
