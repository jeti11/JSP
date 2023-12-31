package com.bitc.jsp_mvcboard.model;

import java.sql.*;

public class JDBConnect {
  protected Connection conn;
  protected PreparedStatement pstmt;
  protected ResultSet rs;


  public JDBConnect() {
    this("com.mysql.cj.jdbc.Driver", "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC", "full505", "full505");
  }

  public JDBConnect(String driver, String url, String id, String pw) {
    try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, id, pw);
      System.out.println("***** DB is open *****");
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
      System.out.println("***** DB is closed *****");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}























