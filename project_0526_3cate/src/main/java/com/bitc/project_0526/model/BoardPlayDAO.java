package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bitc.project_0526.model.CommentPlayDTO;
import com.bitc.project_0526.model.CommentPlayDAO;

public class BoardPlayDAO extends JDBConnect {
  public List<BoardPlayDTO> selectBoardList() {
    List<BoardPlayDTO> playList = new ArrayList<>();

    String sql = "SELECT * FROM blog_board_play ORDER BY idx_play DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        BoardPlayDTO dto = new BoardPlayDTO();
        dto.setIdxPlay(rs.getInt("idx_play"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
        dto.setPlayOfile(rs.getString("play_ofile"));
        dto.setPlaySfile(rs.getString("play_sfile"));
        playList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return playList;
  }

  public int writePlay(BoardPlayDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_board_play (title, content, cate, postdate, play_ofile, play_sfile) ";
    sql += "VALUES (?, ?, ?, NOW(), ?, ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getCate());
      pstmt.setString(4, dto.getPlayOfile());
      pstmt.setString(5, dto.getPlaySfile());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public BoardPlayDTO viewPlay(int idx) {
    BoardPlayDTO dto = null;

    String sql = "SELECT * FROM blog_board_play WHERE idx_play = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new BoardPlayDTO();
        dto.setIdxPlay(rs.getInt("idx_play"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
        dto.setPlayOfile(rs.getString("play_ofile"));
        dto.setPlaySfile(rs.getString("play_sfile"));
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
    String sql = "UPDATE blog_board_play SET visits = visits + 1 WHERE idx_play = ? ";

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

  public int editPlay(BoardPlayDTO dto) {
    int result = 0;

    String sql = "UPDATE blog_board_play SET title = ?, content = ?, postdate = NOW(), ";
    sql += "play_ofile = ?, play_sfile = ? WHERE idx_play = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getPlayOfile());
      pstmt.setString(4, dto.getPlaySfile());
      pstmt.setInt(5, dto.getIdxPlay());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }

  public int deletePlay(int idx) {
    int result = 0;

    String sql = "DELETE FROM blog_board_play WHERE idx_play = ? ";

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

    String sql = "UPDATE blog_board_play SET respects = respects + 1 ";
    sql += "WHERE idx_play = ? ";

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

  public BoardPlayDTO selectPlayHot() {
    BoardPlayDTO dto = null;

    String sql = "SELECT * FROM blog_board_play WHERE visits = (SELECT MAX(visits) FROM blog_board_play) ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new BoardPlayDTO();
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

  public int playTotalCount() {
    int result = 0;

    String sql = "SELECT count(*) AS cnt FROM blog_board_play ";

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














