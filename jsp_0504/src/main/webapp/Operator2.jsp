<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<%
  pageContext.setAttribute("num1", 9);
  pageContext.setAttribute("num2", "10");
  
  pageContext.setAttribute("nullStr", null);
  pageContext.setAttribute("emptyStr", "");
  // int 타입의 배열을 크기 0으로 생성
  pageContext.setAttribute("lengthZero", new Integer[0]);
  pageContext.setAttribute("sizeZero", new ArrayList());
  
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>표현언어 - 연산자</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h3>empty 연산자</h3>
<%--    null, 빈문자열, 길이0인 배열, size가 0인 컬렉션--%>
    empty nullStr : ${empty nullStr}<br>
    empty emptyStr : ${empty emptyStr}<br>
    empty lengthZero : ${empty lengthZero}<br>
    empty sizeZero : ${empty sizeZero}<br>
    
    <h3 class="mt-4">삼항 연산자</h3>
    num1 gt num2 ? "참" : "거짓" => ${num1 gt num2 ? "num1이 크다" : "num2가 크다"}
    
    <h3 class="mt-4">null 연산</h3>
<%--    기본 자바문법에서는 null과 연산시 오류--%>
<%--    EL에서는 null은 0으로 인식--%>
    null + 10 : ${null + 10}<br>
    nullStr + 10 : ${nullStr + 10}<br>
<%--    만들어진적이 없는것 -> null --%>
    param.noVar > 10 : ${param.noVar > 10}
    
  </div>
</body>
</html>
























