package com.bitc.project_0526.model;

import java.sql.SQLException;

public class IntroDAO extends JDBConnect {
  public int introWrite(String intro) {
    int result = 0;

    String sql = "INSERT INTO blog_intro (content) ";
    sql += "VALUES (?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, intro);
      result = pstmt.executeUpdate();

    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public IntroDTO selectIntro() {
    IntroDTO dto = null;

    String sql = "SELECT content FROM blog_intro WHERE idx = (SELECT MAX(idx) FROM blog_intro) ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto = new IntroDTO();
        dto.setIntro(rs.getString("content"));
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 select 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return dto;
  }
}













