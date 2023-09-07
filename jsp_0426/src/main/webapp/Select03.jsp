<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%--데이터베이스 접속 정보를 가지고 있는 jsp 파일을 include로 가져오기--%>
<%@ include file="dbConn.jsp"%>

<%--  --%>
<%
  Statement stmt = null;
  ResultSet rs = null;
  
  try {
    stmt = conn.createStatement();
    String sql = "SELECT id, pass, name, regidate FROM member ";
    rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>dbConn 사용하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container">
    <table class="table table-hover table-striped">
      <thead>
        <tr>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>이름</th>
          <th>등록날짜</th>
        </tr>
      </thead>
      <tbody>
        <%
          // 반복되는 UI부분 및 반복되는 데이터 가져오기 부분을 스크립틀릿으로 구현
            while (rs.next()) {
              String userId = rs.getString("id");
              String userPw = rs.getString("pass");
              String userName = rs.getString("name");
              String userRegidate = rs.getString("regidate");
        %>
<%--    표현식으로 데이터를 화면에 출력--%>
        <tr>
          <td><%=userId%></td>
          <td><%=userPw%></td>
          <td><%=userName%></td>
          <td><%=userRegidate%></td>
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
      </tbody>
    </table>
  </div>
</body>
</html>
