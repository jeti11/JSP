package com.bitc.jsp_0427;

import java.sql.*;

public class JDBConnect {
  public String dbDriver;
  public String dbUrl;
  public String dbUserId;
  public String dbUserPw;

  public Connection conn;
  public Statement stmt;
  public PreparedStatement pstmt;
  public ResultSet rs;

  public JDBConnect() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
      String dbUserId = "full505";
      String dbUserPw = "full505";

      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("DB연결 성공");
    }
    catch (Exception e) {
      System.out.println("DB연결 실패");
      System.out.println(e.getMessage());
    }
  }

  public JDBConnect(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
    this.dbDriver = dbDriver;
    this.dbUrl = dbUrl;
    this.dbUserId = dbUserId;
    this.dbUserPw = dbUserPw;

    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("DB연결 성공");
    }
    catch (SQLException e) {
      System.out.println("DB연결 실패");
      System.out.println("SQLException : " + e.getMessage());
    }
    catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    }
  }

  public void close() {
    try {
      if (rs != null) {
        rs.close();
      }
      if (stmt != null) {
        stmt.close();
      }
      if (pstmt != null) {
        pstmt.close();
      }
      if (conn != null) {
        conn.close();
      }
    }
    catch (Exception e) {
      System.out.println(e.getMessage());
    }
  }
}
