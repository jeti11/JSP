<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JDBC</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>JDBC 테스트 1</h2>
    <%
      JDBConnect jdbc1 = new JDBConnect();
      jdbc1.close();
    %>
    
    <h2>JDBC 테스트 2</h2>
    <%
      String dbDriver = application.getInitParameter("dbDriver");
      String dbUrl = application.getInitParameter("dbUrl");
      String opt1 = application.getInitParameter("dbUrlOpt1");
      String opt2 = application.getInitParameter("dbUrlOpt2");
      String opt3 = application.getInitParameter("dbUrlOpt3");
      String dbUserId = application.getInitParameter("dbUserId");
      String dbUserPw = application.getInitParameter("dbUserPw");
      
      dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;
      
      JDBConnect jdbc2 = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);
      jdbc2.close();
    %>
    

  </div>
</body>
</html>
