<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  // 요청받은 페이지인 ParamMain.jsp에서 생성한 변수
  String pValue = "방랑시인";
%>
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
<%--    액션태그 useBean으로 자바빈즈 생성, 생성한 자바빈즈의 스코프(데이터영역)를 request로 설정--%>
<%--    액션태그의 include와 forward로 다시 요청한 페이지에서도 자바빈즈를 공유--%>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request" />
<%--  액션태그 setProperty로 데이터 입력--%>
    <jsp:setProperty name="person" property="name" value="김삿갓" />
    <jsp:setProperty name="person" property="age" value="56"/>
<%--  액션태그 forward로 ParamForward.jsp로 이동--%>
<%--  이동 주소에 param1이라는 변수명으로 데이터를 추가하여 get방식으로 전송--%>
    <jsp:forward page="ParamForward.jsp?param1=김병연">
      <%--  액션태그 param으로 param2, param3이라는 변수명으로 데이터를 get방식으로 전송--%>
      <jsp:param name="param2" value="경기도 양주"/>
      <jsp:param name="param3" value="<%=pValue%>"/>
    </jsp:forward>
  </div>
</body>
</html>
