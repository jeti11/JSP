<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="container my-4">
<%--  JSTL을 사용하여 request영역에 데이터 저장--%>
  <c:set var="requestVar" value="MustHave" scope="request"/>
<%--  JSTL을 사용하여 OtherPage.jsp 페이지로 리다이렉트 실행--%>
  <c:redirect url="OtherPage.jsp">
<%--    매개변수로 2개의 데이터 전달함--%>
    <c:param name="user_param1" value="출판사"/>
    <c:param name="user_param2" value="골든래빗"/>
  </c:redirect>
</div>
</body>
</html>
