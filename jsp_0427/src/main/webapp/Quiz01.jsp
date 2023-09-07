<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<%@ page import="java.sql.SQLException" %>

<%
  String dbDriver = application.getInitParameter("dbDriver");
  String dbUrl = application.getInitParameter("dbUrl");
  String opt1 = application.getInitParameter("dbUrlOpt1");
  String opt2 = application.getInitParameter("dbUrlOpt2");
  String opt3 = application.getInitParameter("dbUrlOpt3");
  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");
  
  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;
  
  JDBConnect jdbc = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);
  
  String sql = "SELECT * FROM board ";
  jdbc.stmt = jdbc.conn.createStatement();
  jdbc.rs = jdbc.stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Quiz01</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<div class="container my-4">
  <table class="table table-hover table-striped">
    <thead>
      <tr>
        <th>num</th>
        <th>title</th>
        <th>content</th>
        <th>id</th>
        <th>postdate</th>
        <th>visitcount</th>
      </tr>
    </thead>
    <tbody>
      <%
        try {
          while (jdbc.rs.next()) {
            int postNum = jdbc.rs.getInt("num");
            String postTitle = jdbc.rs.getString("title");
            String postContent = jdbc.rs.getString("content");
            String postUserId = jdbc.rs.getString("id");
            String postDate = jdbc.rs.getString("postdate");
            int visitCount = jdbc.rs.getInt("visitcount");
      %>
      <tr>
        <td><%=postNum%></td>
        <td><%=postTitle%></td>
        <td><%=postContent%></td>
        <td><%=postUserId%></td>
        <td><%=postDate%></td>
        <td><%=visitCount%></td>
      </tr>
      <%
          }
        }
        catch (SQLException e) {
          out.println("데이터베이스 사용 중 오류가 발생했습니다.");
          out.println("SQLException : " + e.getMessage());
        }
        finally {
            jdbc.close();
          }
      %>
    </tbody>
  </table>
</div>
<%--    문제 1) JDBConnect 클래스와 Statement 클래스 및 ResultSet을 사용하여 데이터베이스 정보를 가져오는 프로그램을 작성하세요--%>
<%--    board 테이블의 정보를 가져와서 화면에 table 태그로 출력--%>
</body>
</html>
