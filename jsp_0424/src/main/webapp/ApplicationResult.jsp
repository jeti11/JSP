<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<html>
<head>
  <meta charset="utf-8">
  <title>application 영역</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>application 영역의 속성 읽기</h2>
<%--  session은 웹브라우저 종료하고나면 데이터 삭제되는데, application은 웹브라우저 종료하고난 후에도 데이터가 그대로 남아있음--%>
  <%
    Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
    Set<String> keys = maps.keySet();
    for (String key : keys) {
      Person person = maps.get(key);
      out.print(String.format("이름 : %s, 나이 : %d<br>", person.getName(), person.getAge()));
    }
  %>
</body>
</html>
