<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - forTokens</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <%
      // 스크립틀릿 사용하여 문자열 변수 생성
      String rgba = "Red,Green,Blue,Black";
//      String[] arrStr = rgba.split(","); 자바의 스플릿 실행 후 forEach 작업 해주면 결과 똑같음
    %>
    <h4>JSTL의 forTokens 태그 사용</h4>
<%--    JSTL을 사용하여 스크립틀릿에서 생성한 변수를 호출--%>
<%--    forTokens를 사용하여 문자열을 분해하고 page영역의 변수 color에 저장--%>
<%--    forTokens를 사용 시 String 클래스의 split() 메소드를 사용하여 지정한 문자로 문자열을 분해하여 배열에 저장하는 부분과 for문을 사용하여 출력하는 부분을 한번에 수행할 수 있음--%>
    <c:forTokens var="color" items="<%=rgba%>" delims=",">
      <span style="color: ${color}">${color}</span><br>
    </c:forTokens>
  </div>
</body>
</html>
