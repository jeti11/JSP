<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Cookie</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container">
    <h2>1. 쿠키(Cookie) 설정</h2>
    <%
      // Cookie 클래스 타입의 변수 선언과 동시에 객체 생성
      // Cookie 객체 생성시 쿠키 이름과 값을 설정
      Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
      cookie.setPath(request.getContextPath());
      cookie.setMaxAge(3600); // 쿠키 유지 시간 (1초 단위), 유지시간 지나면 쿠키가 자동삭제됨
      // 클라이언트에 쿠키를 전송하기 위해서 response 내장 객체에 추가
      response.addCookie(cookie);
    %>
    
    <h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
    <%
      Cookie[] cookies = request.getCookies();
      if (cookies != null) {
        for (Cookie c : cookies) {
          String cookieName = c.getName();
          String cookieValue = c.getValue();
          out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
//          String str = cookieName + " : " + cookieValue + "<br>"; 동일함
        }
      }
    %>
    
    <h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
    <a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
  </div>
</body>
</html>
