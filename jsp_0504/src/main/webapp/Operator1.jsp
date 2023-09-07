<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  int num1 = 3; // 스크립틀릿에서 변수를 직접선언, 표현언어(EL)에서는 사용불가
  pageContext.setAttribute("num2", 4);
  pageContext.setAttribute("num3", "5");
  pageContext.setAttribute("num4", "8");
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
    <h3>변수 선언 및 할당</h3>
<%--    내장객체 영역에 저장된 변수가 아니기 때문에 null임--%>
    스크립틀릿에서 선언한 변수 : ${num1}<br>
    page 영역에 저장된 변수 : ${num2}<br>
<%--    page 내장객체에 저장과 동시에 출력--%>
    변수 할당 및 즉시 출력 : ${num1 = 7}<br>
    변수 할당 및 별도 출력 : ${num2 = 8;''} => ${num2}<br>
    num1 = ${num1}, num2 = ${num2}, num3 = ${num3}, num4 = ${num4}
    <h3 class="mt-3">산술 연산자</h3>
    num1 + num2 : ${num1 + num2}<br>
    num1 - num2 : ${num1 - num2}<br>
    num1 * num2 : ${num1 * num2}<br>
    num3 / num4 : ${num3 / num4}<br>
    num3 / div num4 : ${num3 div num4}<br>
    num3 % num4 : ${num3 % num4}<br>
    num3 mod num4 : ${num3 mod num4}

    <h3 class="mt-3">+ 연산자는 덧셈만 가능</h3>
<%--    기존 자바 문법에서는 문자열과 다른 타입을 연산 시 문자열 연결 연산자로 동작--%>
<%--    jsp의 표현언어에서는 타입변환이 자유롭기 때문에 아래의 연산이 정수끼리의 연산으로 동작--%>
    num1 + "34" : ${num1 + "34"}<br>
    num2 + "이십" : \${num2 + "이십"}<br> <%--에러 발생(주석처리)--%>
    "삼십" + "사십" : \${"삼십" + "사십"} <%--에러 발생(주석처리)--%>

    <h3 class="mt-3">비교 연산자</h3>
    num4 > num3 : ${num4 gt num3}<br>
    num1 < num3 : ${num1 lt num3}<br>
    num2 >= num4 : ${num2 ge num4}<br>
    num1 == num4 : ${num1 eq num4}

    <h3 class="mt-3">논리 연산자</h3>
    num3 <= num4 && num3 == num4 : ${num3 <= num4 && num3 == num4}<br>
    num3 >= num4 || num3 != num4 : ${num3 >= num4 || num3 != num4}
  </div>
</body>
</html>




























