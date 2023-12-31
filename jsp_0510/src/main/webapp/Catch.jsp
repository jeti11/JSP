<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - catch</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    
    <h4>자바 코드에서의 예외</h4>
    <%
      int num1 = 100;
    %>
    <c:catch var="eMessage">
      <%
        int result = num1 / 0;
      %>
    </c:catch>
    예외 내용 : ${eMessage}
    
    <h4>EL에서의 예외</h4>
    <c:set var="num2" value="200"/>
    
    <c:catch var="eMessage">
      ${"일" + num2}
    </c:catch>
    예외 내용 : ${eMessage}
  </div>
</body>
</html>
























