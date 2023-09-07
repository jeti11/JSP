<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String todayStr = sdf.format(today);
    out.println("오늘 날짜 : " + todayStr);
  %>
  <p>안녕하세요</p>
  <button type="button" class="btn btn-primary">버튼</button>
</body>
</html>
