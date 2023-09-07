package com.bitc.project_0526.model;

import java.sql.SQLException;

public class MemberDAO extends JDBConnect {

  public int join(MemberDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_member (id, pass, nickname, regidate) ";
    sql += "VALUES (?, ?, ?, NOW()) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getPass());
      pstmt.setString(3, dto.getNickname());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int checkId(String userId) {
    int result = 0;
    String sql = "SELECT COUNT(*) AS cnt FROM blog_member WHERE id = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        result = rs.getInt("cnt");
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int isMember(String userId, String userPw) {
    int result = 0;
    String sql = "SELECT COUNT(*) AS cnt FROM blog_member WHERE id = ? AND pass = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        result = rs.getInt("cnt");
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public MemberDTO login(String userId, String userPw) {
    MemberDTO dto = null;

    String sql = "SELECT id, pass, nickname, grade FROM blog_member WHERE id = ? AND pass = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new MemberDTO();
        dto.setId(rs.getString("id"));
        dto.setPass(rs.getString("pass"));
        dto.setNickname(rs.getString("nickname"));
        dto.setGrade(rs.getInt("grade"));
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return dto;
  }

  public MemberDTO userInfo(String id) {
    MemberDTO dto = null;

    String sql = "SELECT * FROM blog_member WHERE id = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new MemberDTO();
        dto.setId(rs.getString("id"));
        dto.setPass(rs.getString("pass"));
        dto.setNickname(rs.getString("nickname"));
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return dto;
  }

  public int memberUpdate(MemberDTO dto) {
    int result = 0;

    String sql = "UPDATE blog_member SET pass = ?, nickname = ? WHERE id = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getPass());
      pstmt.setString(2, dto.getNickname());
      pstmt.setString(3, dto.getId());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int memberDelete(String id) {
    int result = 0;
    String sql = "DELETE FROM blog_member WHERE id = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 DELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }
}


















