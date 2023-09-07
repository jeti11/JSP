<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - forEach 1</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h4>일반 for문 형태의 forEach 태그</h4>
    <c:forEach var="i" begin="1" end="3" step="1">
      <p>반복 ${i}입니다.</p>
    </c:forEach>
    
    <h4>varStatus 속성 살펴보기</h4>
    <table border="1" class="table table-stripped">
      <c:forEach var="i" begin="3" end="5" varStatus="loop">
        <tr>
          <td>count : ${loop.count}</td>
<%--      현재 index의 값--%>
          <td>index : ${loop.index}</td>
<%--      현재 변수의 값--%>
          <td>current : ${loop.current}</td>
          <td>first : ${loop.first}</td>
          <td>last : ${loop.last}</td>
        </tr>
      </c:forEach>
    </table>
    
    <h4>1에서 100까지 정수 중 홀수의 합</h4>
    <c:forEach var="j" begin="1" end="100" step="1">
      <c:if test="${j % 2 != 0}">
        <c:set var="sum" value="${sum + j}" />
      </c:if>
    </c:forEach>
    1~100 사이의 정수 중 홀수의 합은? ${sum}
  </div>
</body>
</html>


















