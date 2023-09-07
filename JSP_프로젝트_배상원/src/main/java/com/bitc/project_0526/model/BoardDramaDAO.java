package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bitc.project_0526.model.CommentDramaDTO;
import com.bitc.project_0526.model.CommentDramaDAO;

public class BoardDramaDAO extends JDBConnect {
  public List<BoardDramaDTO> selectBoardList() {
    List<BoardDramaDTO> dramaList = new ArrayList<>();

    String sql = "SELECT * FROM blog_board_drama ORDER BY idx_drama DESC ";

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
        dto.setDramaOfile(rs.getString("drama_ofile"));
        dto.setDramaSfile(rs.getString("drama_sfile"));
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

  public List<BoardDramaDTO> selectList(int start, int pageSize) {
    List<BoardDramaDTO> dramaList = new ArrayList<BoardDramaDTO>();

    String sql = "SELECT * FROM blog_board_drama ";
    sql += "ORDER BY idx_drama DESC ";
    sql += "LIMIT ?, ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, pageSize);

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
        dto.setDramaOfile(rs.getString("drama_ofile"));
        dto.setDramaSfile(rs.getString("drama_sfile"));
        dramaList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 게시물 목록 조회 중 오류가 발생했습니다. *****");
      e.printStackTrace();
    }
    return dramaList;
  }

  public int writeDrama(BoardDramaDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_board_drama (title, content, cate, postdate, drama_ofile, drama_sfile) ";
    sql += "VALUES (?, ?, ?, NOW(), ?, ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getCate());
      pstmt.setString(4, dto.getDramaOfile());
      pstmt.setString(5, dto.getDramaSfile());
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

    String sql = "SELECT * FROM blog_board_drama WHERE idx_drama = ? ";

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
        dto.setDramaOfile(rs.getString("drama_ofile"));
        dto.setDramaSfile(rs.getString("drama_sfile"));
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

    String sql = "UPDATE blog_board_drama SET title = ?, content = ?, postdate = NOW(), ";
    sql += "drama_ofile = ?, drama_sfile = ? WHERE idx_drama = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getDramaOfile());
      pstmt.setString(4, dto.getDramaSfile());
      pstmt.setInt(5, dto.getIdxDrama());
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

  public int dramaTotalCount() {
    int result = 0;

    String sql = "SELECT count(*) AS cnt FROM blog_board_drama ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery(sql);

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

}














