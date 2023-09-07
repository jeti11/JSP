package com.bitc.jsp_0512.dao;

import java.sql.*;
public class JDBConnect {
  protected Connection conn;
  protected Statement stmt;
  protected PreparedStatement pstmt;
  protected ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUserId;
  private String dbUserPw;

  public JDBConnect() {
    dbDriver = "com.mysql.cj.jdbc.Driver";
    dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    dbUserId = "full505";
    dbUserPw = "full505";
  }

  public void open() {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("***** 데이터 베이스 연결 *****");
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스 연결 중 오류가 발생했습니다. *****");
      System.out.println("SQLException : " + e.getMessage());
      e.printStackTrace();
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
      if (pstmt != null) {
        pstmt.close();
      }
      if (stmt != null) {
        stmt.close();
      }
      if (conn != null) {
        conn.close();
      }
      System.out.println("***** 데이터 베이스 연결 해제 *****");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }

}




























