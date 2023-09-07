package com.bitc.jsp_0428;

// DAO : JAVA에서 데이터베이스에 접근하고 데이터를 CRUD하기 위해 사용하는 클래스
// View 부분과 데이터 처리 부분을 분리하여 관리하기 위함


public class MemberDAO extends JDBConnect {
  // MemberDAO 객체를 생성함과 동시에 데이터베이스 접속(JDBConnect 클래스 상속)
  public MemberDAO(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
    super(dbDriver, dbUrl, dbUserId, dbUserPw);
  }

  public MemberDTO getMemberDTO(String userId, String userPw) {
    MemberDTO dto = new MemberDTO();
    String sql = "SELECT * FROM member WHERE id=? AND pass=? ";

    try {
      pstmt = conn.prepareStatement(sql);
      // SQL 쿼리문에 있는 ?를 실제 데이터로 변환
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);
      rs = pstmt.executeQuery(); // 데이터베이스로 쿼리문 실행과 동시에 rs에 저장

      if (rs.next()) {
        dto.setId(rs.getString("id")); // rs에 저장된 데이터 를 컬럼명을 통해 데이터 가져오기
        dto.setPass(rs.getString("pass"));
        dto.setName(rs.getString(3)); // rs에 저장된 데이터 를 인덱스번호를 통해 데이터 가져오기
        dto.setRegidate(rs.getString(4));
      }
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return dto;
  }

}
