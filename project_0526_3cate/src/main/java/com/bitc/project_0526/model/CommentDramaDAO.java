package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDramaDAO extends JDBConnect {

  public List<CommentDramaDTO> selectCommentList(int idx) {
    List<CommentDramaDTO> commentList = new ArrayList<>();

    String sql = "SELECT * FROM blog_comment_drama WHERE idx_drama = ? ORDER BY no DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        CommentDramaDTO dto = new CommentDramaDTO();
        dto.setNo(rs.getInt("no"));
        dto.setId(rs.getString("id"));
        dto.setComment(rs.getString("comment"));
        dto.setCate(rs.getString("cate"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setIdxDrama(rs.getInt("idx_drama"));
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

  public List<CommentDramaDTO> selectCommentList2(String id) {
    List<CommentDramaDTO> commentList = new ArrayList<>();

    String sql = "SELECT * FROM blog_comment_drama WHERE id = ? ORDER BY no DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        CommentDramaDTO dto = new CommentDramaDTO();
        dto.setId(rs.getString("id"));
        dto.setComment(rs.getString("comment"));
        dto.setCate(rs.getString("cate"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setIdxDrama(rs.getInt("idx_drama"));
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

  public BoardDramaDTO commentCount(int idx) {
    BoardDramaDTO dto = null;

    String sql = "SELECT COUNT(*) AS cnt FROM blog_comment_drama WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        dto = new BoardDramaDTO();
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

  public int writeComment(CommentDramaDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_comment_drama (id, comment, postdate, idx_drama) ";
    sql += "VALUES (?, ?, NOW(), ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getComment());
      pstmt.setInt(3, dto.getIdxDrama());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
    }

  public int dramaCommentMemberDelete(String id) {
    int result = 0;

    String sql = "DELETE FROM blog_comment_drama WHERE id = ? ";

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
    String sql = "DELETE FROM blog_comment_drama WHERE no = ? ";

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










