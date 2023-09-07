<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - fmt3</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h4>로케일 설정</h4>
    <c:set var="today" value="<%=new java.util.Date()%>"/>
    
<%--    setLocale : value 속성에 언어 정보와 지역 정보를 함께 입력하여 설정--%>
<%--    iso-639(언어정보)를 앞에 입력, 중간에 _ 사용, iso-3166(지역정보)을 끝에 입력하여 사용 --%>
    한글로 설정 : <fmt:setLocale value="ko_kr"/>
    <fmt:formatNumber value="10000" type="currency"/> /
    <fmt:formatDate value="${today}" />
    <br>
    
    일어로 설정 : <fmt:setLocale value="ja_jp"/>
    <fmt:formatNumber value="10000" type="currency"/> /
    <fmt:formatDate value="${today}" />
    <br>

    영어로 설정 : <fmt:setLocale value="en_us"/>
    <fmt:formatNumber value="10000" type="currency"/> /
    <fmt:formatDate value="${today}" />
  </div>
</body>
</html>



































