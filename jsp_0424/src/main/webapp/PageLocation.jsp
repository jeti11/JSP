<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0424.Person"%>
<html>
<head>
  <meta charset="utf-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>이동 후 page 영역의 속성값 읽기</h2>
<%
  // page가 변경되었으므로 기존에 가지고 있는 page 내장객체는 현재페이지의 page 내장 객체와 다른 객체임
  // page 내장 객체가 가지고 있던 데이터를 출력 시 내용이 없음
  Object pInteger = pageContext.getAttribute("pageInteger");
  Object pString = pageContext.getAttribute("pageString");
  Object pPerson = pageContext.getAttribute("pagePerson");
%>

  <ul>
<%--    (조건) ? true일 경우 반환값 : false일 경우 반환값 --%>
    <li>Integer 객체 : <%= (pInteger == null) ? "값 없음" : pInteger %></li>
    <li>String 객체 : <%= (pString == null) ? "값 없음" : pString %></li>
    <li>Person 객체 : <%= (pPerson == null) ? "값 없음" : ((Person)pPerson).getName()%></li>
  </ul>
</body>
</html>
