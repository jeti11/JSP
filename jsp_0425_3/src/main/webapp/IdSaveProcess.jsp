<%@ page import="com.bitc.jsp_0425_3.CookieManager" %>
<%@ page import="com.bitc.jsp_0425_3.JSFunction" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 클라이언트에서 userid, userpw, savecheck 값을 가져옴
  String user_id = request.getParameter("user_id");
  String user_pw = request.getParameter("user_pw");
  String save_check = request.getParameter("save_check");
  
  // 사용자 정보와 클라이언트에서 전송된 정보가 같으면
  if ("must".equals(user_id) && "1234".equals(user_pw)) {
    // 클라이언트에서 전송된 정보 중 saveCheck값이 "Y"이면 쿠키생성, 아니면 삭제
    if (save_check != null && save_check.equals("Y")) {
      CookieManager.makeCookie(response, "loginId", user_id, 86400);
    }
    else {
      CookieManager.deleteCookie(response, "loginId");
    }
    JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
  }
  else {
    JSFunction.alertBack("로그인에 실패했습니다.", out);
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
