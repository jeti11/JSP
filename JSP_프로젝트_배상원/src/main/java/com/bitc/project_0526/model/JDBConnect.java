package com.bitc.project_0526.model;

import java.sql.*;

public class JDBConnect {
  protected Connection conn;
  protected PreparedStatement pstmt;
  protected ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUserId;
  private String dbUserPw;

  public JDBConnect() {
    this("com.mysql.cj.jdbc.Driver", "jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC", "full505", "full505");
  }

  public JDBConnect (String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("***** 데이터베이스 연결 성공 *****");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void dbClose() {
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
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}
