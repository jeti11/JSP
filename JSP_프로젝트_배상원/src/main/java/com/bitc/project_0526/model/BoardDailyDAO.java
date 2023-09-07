package com.bitc.project_0526.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bitc.project_0526.model.CommentDailyDTO;
import com.bitc.project_0526.model.CommentDailyDAO;

public class BoardDailyDAO extends JDBConnect {
  public List<BoardDailyDTO> selectBoardList() {
    List<BoardDailyDTO> dailyList = new ArrayList<>();

    String sql = "SELECT * FROM blog_board_daily ORDER BY idx_daily DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        BoardDailyDTO dto = new BoardDailyDTO();
        dto.setIdxDaily(rs.getInt("idx_daily"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
        dto.setDailyOfile(rs.getString("daily_ofile"));
        dto.setDailySfile(rs.getString("daily_sfile"));
        dailyList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return dailyList;
  }

  public List<BoardDailyDTO> selectList(int start, int pageSize) {
    List<BoardDailyDTO> dailyList = new ArrayList<BoardDailyDTO>();

    String sql = "SELECT * FROM blog_board_daily ";
    sql += "ORDER BY idx_daily DESC ";
    sql += "LIMIT ?, ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, pageSize);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        BoardDailyDTO dto = new BoardDailyDTO();

        dto.setIdxDaily(rs.getInt("idx_daily"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
        dto.setDailyOfile(rs.getString("daily_ofile"));
        dto.setDailySfile(rs.getString("daily_sfile"));
        dailyList.add(dto);
      }
    }
    catch (SQLException e) {
      System.out.println("***** 게시물 목록 조회 중 오류가 발생했습니다. *****");
      e.printStackTrace();
    }
    return dailyList;
  }

  public int writeDaily(BoardDailyDTO dto) {
    int result = 0;

    String sql = "INSERT INTO blog_board_daily (title, content, cate, postdate, daily_ofile, daily_sfile) ";
    sql += "VALUES (?, ?, ?, NOW(), ?, ?) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getCate());
      pstmt.setString(4, dto.getDailyOfile());
      pstmt.setString(5, dto.getDailySfile());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  public BoardDailyDTO viewDaily(int idx) {
    BoardDailyDTO dto = null;

    String sql = "SELECT * FROM blog_board_daily WHERE idx_daily = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new BoardDailyDTO();
        dto.setIdxDaily(rs.getInt("idx_daily"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getString("postdate"));
        dto.setCate(rs.getString("cate"));
        dto.setVisits(rs.getInt("visits"));
        dto.setRespects(rs.getInt("respects"));
        dto.setComments(rs.getInt("comments"));
        dto.setDailyOfile(rs.getString("daily_ofile"));
        dto.setDailySfile(rs.getString("daily_sfile"));
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
    String sql = "UPDATE blog_board_daily SET visits = visits + 1 WHERE idx_daily = ? ";

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

  public int editDaily(BoardDailyDTO dto) {
    int result = 0;

    String sql = "UPDATE blog_board_daily SET title = ?, content = ?, postdate = NOW(), ";
    sql += "daily_ofile = ?, daily_sfile = ? WHERE idx_daily = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getDailyOfile());
      pstmt.setString(4, dto.getDailySfile());
      pstmt.setInt(5, dto.getIdxDaily());
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("***** 데이터베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }

  public int deleteDaily(int idx) {
    int result = 0;

    String sql = "DELETE FROM blog_board_daily WHERE idx_daily = ? ";

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

    String sql = "UPDATE blog_board_daily SET respects = respects + 1 ";
    sql += "WHERE idx_daily = ? ";

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

  public BoardDailyDTO selectDailyHot() {
    BoardDailyDTO dto = null;

    String sql = "SELECT * FROM blog_board_daily WHERE visits = (SELECT MAX(visits) FROM blog_board_daily) ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        dto = new BoardDailyDTO();
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

  public int dailyTotalCount() {
    int result = 0;

    String sql = "SELECT count(*) AS cnt FROM blog_board_daily ";

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














