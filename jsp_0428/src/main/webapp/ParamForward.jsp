<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>액션태그 - param</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
<%--    포워드된 페이지에서 액션태그 useBean로 자바빈즈 생성, 데이터 범위를 request로 설정--%>
<%--    이전 페이지인 ParamMain.jsp에서 생성한 자바빈즈의 내용이 그대로 존재함--%>
<%--  만약 scope에 page가 들어가면 새로운 페이지에서 객체를 생성한 것이기 때문에 이전 페이지에서 생성한 자바빈즈의 내용이 존재하지 않음--%>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request" />
    <h2>포워드된 페이지에서 매개변수 확인</h2>
    <ul>
<%--      액션태그 getProperty로 자바빈즈의 데이터 가져옴--%>
      <li>이름 : <jsp:getProperty name="person" property="name"/></li>
      <li>나이 : <jsp:getProperty name="person" property="age"/></li>
<%--  액션태그 param으로 전달한 데이터 가져오기--%>
      <li>본명 : <%= request.getParameter("param1")%></li>
      <li>출생 : <%= request.getParameter("param2")%></li>
      <li>특징 : <%= request.getParameter("param3")%></li>
    </ul>
    
    <jsp:include page="ParamInclude.jsp">
      <jsp:param name="loc1" value="강원도 영월"/>
      <jsp:param name="loc2" value="김삿갓면"/>
    </jsp:include>
    
  </div>
</body>
</html>




















