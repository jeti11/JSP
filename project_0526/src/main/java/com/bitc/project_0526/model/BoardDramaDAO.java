package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bitc.project_0526.model.CommentDramaDTO;
import com.bitc.project_0526.model.CommentDramaDAO;

public class BoardDramaDAO extends JDBConnect {
  public List<BoardDramaDTO> selectBoardList() {
    List<BoardDramaDTO> dramaList = new ArrayList<>();

    String sql = "SELECT * FROM blog_board_drama ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        BoardDramaDTO dto = new BoardDramaDTO();
        dto.setIdxDrama(rs.getInt("idx_drama"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
        dramaList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return dramaList;
  }

//  public BoardDramaDTO selectBoardComment(int idx) {
//    BoardDramaDTO dto = null;
//
//    String sql = "SELECT COUNT(*) AS cnt FROM blog_comment_drama WHERE idx_drama = ? ";
//    try {
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setInt(1, idx);
//      rs = pstmt.executeQuery();
//
//      while (rs.next()) {
//        dto.setComments(rs.getInt("cnt"));
//      }
//    }
//    catch (SQLException e) {
//      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
//      System.out.println("***** Error : " + e.getMessage() + "*****");
//      e.printStackTrace();
//    }
//    return dto;
//  }

  public int writeDrama(BoardDramaDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_board_drama (title, content, cate, postdate) ";
    sql += "VALUES (?, ?, ?, NOW()) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getCate());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }

  public BoardDramaDTO viewDrama(int idx) {
    BoardDramaDTO dto = null;

    String sql = "SELECT idx_drama, title, content, postdate, cate, visits, respects, comments ";
    sql += "FROM blog_board_drama WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new BoardDramaDTO();
        dto.setIdxDrama(rs.getInt("idx_drama"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return dto;
  }

  public void updateBoardVisits(int idx) {
    String sql = "UPDATE blog_board_drama SET visits = visits + 1 WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
  }

  public int editDrama(BoardDramaDTO dto) {
    int result = 0;

    String sql = "UPDATE blog_board_drama SET title = ?, content = ?, postdate = NOW() ";
    sql += "WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setInt(3, dto.getIdxDrama());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }

  public int deleteDrama(int idx) {
    int result = 0;

    String sql = "DELETE FROM blog_board_drama WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 DELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int updateBoardRespects(int idx) {
    int result = 0;

    String sql = "UPDATE blog_board_drama SET respects = respects + 1 ";
    sql += "WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public BoardDramaDTO selectDramaHot() {
    BoardDramaDTO dto = null;

    String sql = "SELECT * FROM blog_board_drama WHERE visits = (SELECT MAX(visits) FROM blog_board_drama) ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new BoardDramaDTO();
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setVisits(rs.getInt("visits"));
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return dto;
  }
}














