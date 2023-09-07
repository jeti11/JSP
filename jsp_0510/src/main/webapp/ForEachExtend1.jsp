<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - forEach2</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h4>향상된 for문 형태의 forEach 태그</h4>
<%--    스크립틀릿 사용하여 배열 생성--%>
    <%
      String[] rgba = {"Red", "Green", "Blue", "Black"};
    %>
    
    <c:forEach items="<%=rgba%>" var="c">
      <span style="color:${c}">${c}</span>
    </c:forEach>
    <br>
    <br>
    <h4>varStatus 속성 살펴보기</h4>
    <table class="table table-stripped">
      <c:forEach var="c" items="<%=rgba%>" varStatus="loop">
        <tr>
          <td>count : ${loop.count}</td>
          <td>index : ${loop.index}</td>
          <td>current : ${loop.current}</td>
          <td>first : ${loop.first}</td>
          <td>last : ${loop.last}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>
