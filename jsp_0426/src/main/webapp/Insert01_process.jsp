<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Statement로 SQL문 실행하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <%
      // 데이터베이스와 접속 정보를 저장할 Connection 클래스의 변수 생성
      Connection conn = null;
      // SQL 쿼리문을 번역하여 데이터베이스로 전달할 Statement 클래스의 변수 생성
      Statement stmt = null;
      
      request.setCharacterEncoding("UTF-8");
      //
      String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      String userName = request.getParameter("userName");
      
      try {
        String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        String dbUserId = "full505";
        String dbUserPw = "full505";
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
        
        // Statement 에서 사용하는 SQL 문자열
        // Statement 에서는 String 클래스 타입의 문자열로 SQL 문자열을 완성하고 해당 SQL 쿼리문을 사용함
        String sql = "INSERT INTO member (id, pass, name, regidate) "; // (뒤에 공백 한 칸 넣어주기)
        sql += "VALUES ('" + userId + "', '" + userPw + "', '" + userName + "', NOW()) "; // (뒤에 공백 한 칸 넣어주기)
        
        // Connection 객체를 통해서 Statement 객체를 생성
        stmt = conn.createStatement();
        // 데이터베이스로 SQL 쿼리문을 전달
        int result = stmt.executeUpdate(sql);
        out.println("테이블에 데이터 추가가 성공했습니다.");
        out.println(result + "개의 데이터 추가");
      }
      catch (SQLException e) {
        out.println("데이터베이스 사용 시 오류가 발생했습니다. <br>");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        try {
          if (stmt != null) {
            stmt.close();
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
