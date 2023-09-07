package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentPlayDAO extends JDBConnect {

  public List<CommentPlayDTO> selectCommentList(int idx) {
    List<CommentPlayDTO> commentList = new ArrayList<>();

    String sql = "SELECT * FROM blog_comment_play WHERE idx_play = ? ORDER BY no DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        CommentPlayDTO dto = new CommentPlayDTO();
        dto.setNo(rs.getInt("no"));
        dto.setId(rs.getString("id"));
        dto.setComment(rs.getString("comment"));
        dto.setCate(rs.getString("cate"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setIdxPlay(rs.getInt("idx_play"));
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

  public List<CommentPlayDTO> selectCommentList2(String id) {
    List<CommentPlayDTO> commentList = new ArrayList<>();

    String sql = "SELECT * FROM blog_comment_play WHERE id = ? ORDER BY no DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        CommentPlayDTO dto = new CommentPlayDTO();
        dto.setId(rs.getString("id"));
        dto.setComment(rs.getString("comment"));
        dto.setCate(rs.getString("cate"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setIdxPlay(rs.getInt("idx_play"));
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

  public BoardPlayDTO commentCount(int idx) {
    BoardPlayDTO dto = null;

    String sql = "SELECT COUNT(*) AS cnt FROM blog_comment_play WHERE idx_play = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        dto = new BoardPlayDTO();
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

  public int writeComment(CommentPlayDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_comment_play (id, comment, postdate, idx_play) ";
    sql += "VALUES (?, ?, NOW(), ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getComment());
      pstmt.setInt(3, dto.getIdxPlay());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public int playCommentMemberDelete(String id) {
    int result = 0;

    String sql = "DELETE FROM blog_comment_play WHERE id = ? ";

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
    String sql = "DELETE FROM blog_comment_play WHERE no = ? ";

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










