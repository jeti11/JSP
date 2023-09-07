<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="utf-8">
  <title>내장 객체 - response</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>1. 로그인 폼</h2>
<%--  로그인 오류 정보를 받는 변수--%>
<%--  로그인 오류 정보가 null이면 --%>
  <%
    String loginErr = request.getParameter("loginErr");
    if (loginErr != null) out.print("로그인 실패");
  %>

<%--  ResponseLogin.jsp로 데이터 전송--%>
  <form action="./ResponseLogin.jsp" method="post">
    아이디 : <input type="text" name="user_id"/><br/>
    패스워드 : <input type="text" name="user_pwd" /><br/>
    <input type="submit" value="로그인" />
  </form>

  <h2>2. HTTP 응답 헤더 설정하기</h2>
  <form action="./ResponseHeader.jsp" method="get">
    날짜 형식 : <input type="text" name="add_date" value="2023-04-24 09:00" /><br/>
    숫자 형식 : <input type="text" name="add_int" value="8282" /><br/>
    문자 형식 : <input type="text" name="add_str" value="홍길동" /><br/>
    <input type="submit" value="응답 헤더 설정 & 출력"/>
  </form>
</body>
</html>
