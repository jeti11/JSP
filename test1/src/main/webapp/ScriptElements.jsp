<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>

<%--지시어<%@ %> --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%--스크립트 태그 선언부<%! %> --%>
<%-- servelet의 _jspService() 메소드 외부에 등록됨 --%>
<%!
	public int add(int num1, int num2) {
		return num1 + num2;
	}
%>
<html>
<head>
	<meta charset="utf-8">
	<title>스크립트 태그 사용</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<div class="container my-4">
	<%--    스크립트 태그 스크립틀릿<% %> : 변수 선언 및 사용, 메소드 호출--%>
	<%--    servelet의 소스코드 안의 _jspService() 안에 입력되는 자바 소스코드--%>
	<%
		int result = add(10, 20);
	%>
	
	<%--  스크립트 태그 표현식<%= %> : 상수, 변수 등을 사용한식 또는 반환값이 있는 메소드 호출 등--%>
	<%--  serveltet의 소스코드 안의 _jspService() 안에 입력됨--%>
	<%--  웹페이지에 직접 출력하기 위해서 사용, out.println()과 동일한 기능--%>
	<p>덧셈 결과 : <%= result%></p>
	<p>덧셈 결과 : <%= add(30, 40)%></p>
</div>
</body>
</html>
