package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDailyDAO extends JDBConnect {

  public List<CommentDailyDTO> selectCommentList(int idx) {
    List<CommentDailyDTO> commentList = new ArrayList<>();

    String sql = "SELECT * FROM blog_comment_daily WHERE idx_daily = ? ORDER BY no DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        CommentDailyDTO dto = new CommentDailyDTO();
        dto.setNo(rs.getInt("no"));
        dto.setId(rs.getString("id"));
        dto.setComment(rs.getString("comment"));
        dto.setCate(rs.getString("cate"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setIdxDaily(rs.getInt("idx_daily"));
        commentList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return commentList;
  }

  public List<CommentDailyDTO> selectCommentList2(String id) {
    List<CommentDailyDTO> commentList = new ArrayList<>();

    String sql = "SELECT * FROM blog_comment_daily WHERE id = ? ORDER BY no DESC ";
    sql += "LIMIT 1, 3 ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        CommentDailyDTO dto = new CommentDailyDTO();
        dto.setId(rs.getString("id"));
        dto.setComment(rs.getString("comment"));
        dto.setCate(rs.getString("cate"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setIdxDaily(rs.getInt("idx_daily"));
        commentList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return commentList;
  }

  public BoardDailyDTO commentCount(int idx) {
    BoardDailyDTO dto = null;

    String sql = "SELECT COUNT(*) AS cnt FROM blog_comment_daily WHERE idx_daily = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        dto = new BoardDailyDTO();
        dto.setComments(rs.getInt("cnt"));
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return dto;
  }

  public int writeComment(CommentDailyDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_comment_daily (id, comment, postdate, idx_daily) ";
    sql += "VALUES (?, ?, NOW(), ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getComment());
      pstmt.setInt(3, dto.getIdxDaily());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }


  public int dailyCommentMemberDelete(String id) {
    int result = 0;

    String sql = "DELETE FROM blog_comment_daily WHERE id = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 DELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int commentNoDelete(int no) {
    int result = 0;
    String sql = "DELETE FROM blog_comment_daily WHERE no = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 DELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }
}










