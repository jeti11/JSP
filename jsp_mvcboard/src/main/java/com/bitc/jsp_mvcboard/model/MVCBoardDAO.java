package com.bitc.jsp_mvcboard.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MVCBoardDAO extends JDBConnect {
//  부모의 기본 생성자가 있었기 때문에 컴파일이 자동으로 아래의 기본 생성자 만들어줌
  public MVCBoardDAO() {
    super();
  }

//  전체 게시물 목록 가져오기
  public List<MVCBoardDTO> selectBoardList() {
    List<MVCBoardDTO> boardList = new ArrayList<>();

    try {
      String sql = "SELECT post_idx, post_writer, post_title, post_date, post_visits, post_ofile, post_sfile FROM mvcboard ";
        sql += "ORDER BY post_idx DESC ";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        MVCBoardDTO board = new MVCBoardDTO();
        board.setPostIdx(rs.getInt("post_idx"));
        board.setPostWriter(rs.getString("post_writer"));
        board.setPostTitle(rs.getString("post_title"));
        board.setPostDate(rs.getString("post_date"));
        board.setPostVisits(rs.getInt("post_visits"));
        board.setPostOfile(rs.getString("post_ofile"));
        board.setPostSfile(rs.getString("post_sfile"));
        boardList.add(board);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return boardList;
  }

//  데이터 베이스에 글 등록하기
  public int insertBoard(MVCBoardDTO board) {
    int result = 0;

    String sql = "INSERT INTO mvcboard (post_writer, post_title, post_content, post_date, post_pass, post_ofile, post_sfile) ";
      sql +="VALUES (?, ?, ?, NOW(), ?, ?, ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getPostWriter());
      pstmt.setString(2, board.getPostTitle());
      pstmt.setString(3, board.getPostContent());
      pstmt.setString(4, board.getPostPass());
      pstmt.setString(5, board.getPostOfile());
      pstmt.setString(6, board.getPostSfile());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

//  게시물 상세정보 가져오기
  public MVCBoardDTO selectBoardDetails(int idx) {
    MVCBoardDTO board = new MVCBoardDTO();

    String sql = "SELECT post_idx, post_title, post_content, post_writer, post_date, post_ofile, post_sfile, ";
    sql += "post_dn_count, post_visits FROM mvcboard WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        board.setPostIdx(rs.getInt("post_idx"));
        board.setPostTitle(rs.getString("post_title"));
        board.setPostContent(rs.getString("post_content"));
        board.setPostWriter(rs.getString("post_writer"));
        board.setPostDate(rs.getString("post_date"));
        board.setPostOfile(rs.getString("post_ofile"));
        board.setPostSfile(rs.getString("post_sfile"));
        board.setPostVisits(rs.getInt("post_visits"));
        board.setPostDnCount(rs.getInt("post_dn_count"));
//      한개의 데이터라 List에 추가할 필요없음
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return board;
  }

  public boolean equalsPassword(int postIdx, String postPass) {
    boolean result = false;

    String sql = "SELECT COUNT(*) AS cnt FROM mvcboard WHERE post_idx = ? AND post_pass = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      pstmt.setString(2, postPass);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        if (rs.getInt("cnt") == 1) {
          result = true;
        }
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 비밀번호 확인 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int deleteBoard(int postIdx) {
    int result = 0;

    String sql = "DELETE FROM mvcboard WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 DELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int updateBoard(MVCBoardDTO board) {
    int result = 0;

    String sql = "UPDATE mvcboard SET post_title = ?, post_writer = ?, post_pass = ?, ";
      sql += "post_content = ?, post_date = NOW() WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getPostTitle());
      pstmt.setString(2, board.getPostWriter());
      pstmt.setString(3, board.getPostPass());
      pstmt.setString(4, board.getPostContent());
      pstmt.setInt(5, board.getPostIdx());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public void updateBoardVisits(int postIdx) {
    String sql = "UPDATE mvcboard SET post_visits = post_visits + 1 WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
  }

  public void updateBoardDownCount(int postIdx) {
    String sql = "UPDATE mvcboard SET post_dn_count = post_dn_count + 1 WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
  }
}
































