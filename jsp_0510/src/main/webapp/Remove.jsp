<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--각각의 영역에 데이터가 따로 저장되기 때문에 변수명이 같아도 저장됨--%>
<c:set var="scopeVar" value="Page Value" />
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - remove</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<div class="container my-4">
  <h4>출력하기</h4>
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
    <li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
    <li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
  </ul>
  
  <h4>session 영역에서 삭제하기</h4>
<%--  JSTL을 사용하여 세션 영역에 저장된 변수 삭제--%>
  <c:remove var="scopeVar" scope="session" />
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
    <li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
    <li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
  </ul>
  
  <h4>scope 지정 없이 삭제하기</h4>
<%--  JSTL을 사용하여 저장된 변수를 삭제 시 영역 지정을 하지 않으면 모든 영역의 해당 변수를 삭제함--%>
<%--  삭제 시에는 영역을 지정하는 것이 안전함--%>
  <c:remove var="scopeVar"/>
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
    <li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
    <li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
  </ul>
</div>
</body>
</html>
