<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0504.MyELClass" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>

<%
  MyELClass myClass = new MyELClass();
  pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>표현언어 - 메소드 호출</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h3>영역에 저장 후 메소드 호출하기</h3>
    001225-3000000 => ${myClass.getGender("001225-3000000")}<br>
    001225-2000000 => ${myClass.getGender("001225-2000000")}
    
<%--    최신 EL 언어의 정적 메소드 호출 방식--%>
<%--    기존 자바 문법에서의 정적 메소드 호출하는 것과 동일--%>
    <h3>클래스명을 통해 정적 메소드 호출하기</h3>
    ${MyELClass.showGugudan(7)}
    
    <h3>TLD를 이용한 정적 메소드 호출</h3>
    <li>mytag:isNumber("100") => ${mytag:isNumber("100")}</li>
    <li>mytag:isNumber("이백") => ${mytag:isNumber("이백")}</li>
  </div>
</body>
</html>
