<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
  // 클라이언트에서 전송한 데이터를 가져옴
  String chkVal = request.getParameter("inactiveToday");
  
  // 클라이언트에서 전송한 값이 1이면 아래를 실행하라
  if (chkVal != null && chkVal.equals("1")) {
    Cookie cookie = new Cookie("PopupClose", "off");
    cookie.setPath(request.getContextPath());
    cookie.setMaxAge(60*60*24);
    response.addCookie(cookie);
    out.println("쿠키 : 하루 동안 열지 않음"); // 클라이언트로 내용 전송
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>

</body>
</html>
