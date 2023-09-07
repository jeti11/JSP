<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.namespace.QName" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Statement로 SQL 쿼리 사용하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <table class="table table-hover table-striped">
      <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null; // Statement를 통해서 데이터베이스 서버에서 전달받은 데이터를 저장하는 클래스
        
        try {
          String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
          String dbUserId = "full505";
          String dbUserPw = "full505";
          
          Class.forName("com.mysql.cj.jdbc.Driver");
          conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
          
          stmt = conn.createStatement();
          
          String sql = "SELECT id, pass, name, regidate FROM member "; // 기존의 SQL 쿼리문 사용, SELECT 쿼리문 생성
          // Statement를 통해서 데이터베이스에 SELECT 쿼리문을 실행 후, 그 결과를 받아옴
          rs = stmt.executeQuery(sql);
          
          // rs.next() : 데이터가 없을 경우 false, 있으면 데이터를 가져옴
          
          while (rs.next()) {
            String userId = rs.getString("id"); // 컬럼명을 직접 적는게 직관적임
            String userPw = rs.getString("pass");
            String userName = rs.getString("name");
            String userRegidate = rs.getString("regidate");
      %>
        <tr>
          <td><%=userId%></td>
          <td><%=userPw%></td>
          <td><%=userName%></td>
          <td><%=userRegidate%></td>
        </tr>
      <%
      // getString("컬럼명") : 지정한 컬럼명에 해당하는 데이터를 가져옴
          }
        }
        catch (SQLException e) {
        out.println("데이터베이스 사용 중 오류가 발생했습니다.");
        out.println("SQLException : " + e.getMessage());
        }
        finally {
          try {
          // ResultSet > Statement > Connection 순으로 close()를 사용
            if (rs != null) {
            rs.close();
            }
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
    </table>
  </div>
</body>
</html>
