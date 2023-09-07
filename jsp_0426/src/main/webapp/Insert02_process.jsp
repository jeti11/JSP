<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>PrepareStatement로 SQL 쿼리 사용하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container">
    <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      
      request.setCharacterEncoding("UTF-8");
      String postTitle = request.getParameter("title");
      String postContent = request.getParameter("content");
      String postId = request.getParameter("userId");
      
      try {
        String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        String dbUserId = "full505";
        String dbUserPw = "full505";
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
        
        String sql = "INSERT INTO board (title, content, id, postdate) ";
        sql += "VALUES (?, ?, ?, NOW()) ";
        
        pstmt = conn.prepareStatement(sql); // Connection 객체를 통해서 PrepareStatement 객체 생성하면서 sql 쿼리문 전송
        pstmt.setString(1, postTitle);
        pstmt.setString(2, postContent);
        pstmt.setString(3, postId);
        
        int result = pstmt.executeUpdate();
        
        out.println("board 테이블에 데이터 추가를 성공하였습니다.<br>");
        out.println(result + "개의 데이터를 추가하였습니다.");
      }
      catch (SQLException e) {
        out.println("데이터베이스 사용 시 오류가 발생하였습니다.<br>");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        try {
          if (pstmt != null) {
            pstmt.close();
          }
          if (conn != null) {
            conn.close();
          }
        }
        catch (Exception e) {}
      }
    %>
  </div>
</body>
</html>






















