package com.bitc.jsp_board_model1;

import java.sql.SQLException;

// 회원 정보에 대한 데이터를 DB에 저장 및 가져오기 위한 클래스
public class MemberDAO extends JDBConnect {
  // 지정한 사용자가 존재하는지 여부만 확인
  public int isMember(String userId, String userPw) {
    int result = 0;

    // 사용자 입력 id와 pw를 가지고 해당 정보가 데이터베이스에 있는지 확인하는 sql 쿼리문 생성
    String sql = "SELECT count(id) AS cnt FROM member ";
      sql += "WHERE id = ? ";
      sql += "AND pass = ? ";
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
      System.out.println("SELECT 사용 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    return result;
  }

  // 실제 사용자 정보를 가져오기
  public MemberDTO selectMember(String userId, String userPw) {
    MemberDTO member = new MemberDTO();

    String sql = "SELECT id, pass, name FROM member ";
      sql += "WHERE id = ? ";
      sql += "AND pass = ? ";

      try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, userPw);
        rs = pstmt.executeQuery();

        while (rs.next()) {
          member.setUserId(rs.getString("id"));
          member.setUserPw(rs.getString("pass"));
          member.setUserName(rs.getString("name"));
        }
      }
      catch (SQLException e) {
        System.out.println("SELECT 사용 중 오류가 발생했습니다.");
        e.printStackTrace();
      }
    return member;
  }

}























