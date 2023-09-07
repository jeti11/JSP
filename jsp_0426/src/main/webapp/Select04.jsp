<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%@ include file="dbConn.jsp" %>

<%
  PreparedStatement pstmt = null;
  ResultSet rs = null;
%>

<%--문제 1) PreparedStatement를 사용하여 SQL 쿼리문을 실행하고 화면에 그 결과를 출력하는 프로그램을 작성하세요--%>
<%--데이터베이스 접속정보가 있는 dbconn.jsp를 include하여 사용하는 방식으로 구현하세요--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JDBConnect 사용하기 </title>
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
          <th>글번호</th>
          <th>글제목</th>
          <th>글내용</th>
          <th>글쓴이 ID</th>
          <th>등록날짜</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
      <%
        try {
          String sql = "SELECT * FROM board ";
          pstmt = conn.prepareStatement(sql);
          rs = pstmt.executeQuery();
  
          while (rs.next()) {
            int postNum = rs.getInt("num");
            String postTitle = rs.getString("title");
            String postContent = rs.getString("content");
            String postId = rs.getString("id");
            String postDate = rs.getString("postdate");
            int visitcount = rs.getInt("visitcount");
      %>
      <tr>
        <td><%=postNum%></td>
        <td><%=postTitle%></td>
        <td><%=postContent%></td>
        <td><%=postId%></td>
        <td><%=postDate%></td>
        <td><%=visitcount%></td>
      </tr>
      <%
          }
        }
        catch (SQLException e) {
          out.println("데이터베이스 사용 중 오류가 발생했습니다.");
          out.println("SQLException : " + e.getMessage());
        }
        finally {
          try {
            if (rs != null) {
              rs.close();
            }
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
      </tbody>
    </table>
  </div>
</body>
</html>












