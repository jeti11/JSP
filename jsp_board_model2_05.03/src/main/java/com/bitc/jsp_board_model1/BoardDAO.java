package com.bitc.jsp_board_model1;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

// 실제 데이터베이스와 연결해서 데이터를 CRUD(조작) 하기위한 클래스
public class BoardDAO extends JDBConnect {
  public BoardDAO() {

  }

  // 검색 결과 수
  public int totalCount() {
    int result = 0;

    String sql = "SELECT COUNT(*) AS CNT FROM board ";

    try {
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        rs.getInt("cnt");
      }
      return result;

    }
    catch (SQLException e) {
      System.out.println("SELECT 사용 중 오류가 발생했습니다.");
      e.printStackTrace();
    }


    return result;
  }

  // 전체 게시물 목록 출력
  public List<BoardDTO> selectList() {
    // 게시물의 목록을 저장할 빈 리스트 선언
    List<BoardDTO> dataList = new ArrayList<>();

    String sql = "SELECT num, title, id, postdate, visitcount FROM board ORDER BY num DESC "; //전체 목록이기 때문에 content는 뺐음

    try {
      // SQL 쿼리 명령을 위해서 Statement 객체를 생성 및 쿼리문 실행하여 결과를 rs에 받아옴
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      // 가져온 결과물을 하나씩 출력
      while (rs.next()) {
        // 게시물 1개의 정보를 저장할 수 있는 BoardDTO 객체 생성
        BoardDTO board = new BoardDTO();

        // 게시물 정보 저장
        board.setPostNum(rs.getInt("num"));
        board.setPostTitle(rs.getString("title"));
        board.setPostWriteUser(rs.getString("id"));
        board.setPostDate(rs.getString("postdate"));
        board.setPostVisitcount(rs.getInt("visitcount"));
        // 게시물 전체 리스트를 저장하는 dataList에 BoardDTO 객체 추가
        dataList.add(board);
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 베이스 사용 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    return dataList;
  }

  public List<BoardDTO> selectList(int startNum, int postSize) {
    // 게시물의 목록을 저장할 빈 리스트 선언
    List<BoardDTO> dataList = new ArrayList<>();

    String sql = "SELECT num, title, id, postdate, visitcount FROM board ";
    sql += "ORDER BY num DESC "; //전체 목록이기 때문에 content는 뺐음
    sql += "LIMIT ?, ? ";

    try {
      // SQL 쿼리 명령을 위해서 Statement 객체를 생성 및 쿼리문 실행하여 결과를 rs에 받아옴
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startNum);
      pstmt.setInt(2, postSize);
      rs = pstmt.executeQuery();

      // 가져온 결과물을 하나씩 출력
      while (rs.next()) {
        // 게시물 1개의 정보를 저장할 수 있는 BoardDTO 객체 생성
        BoardDTO board = new BoardDTO();

        // 게시물 정보 저장
        board.setPostNum(rs.getInt("num"));
        board.setPostTitle(rs.getString("title"));
        board.setPostWriteUser(rs.getString("id"));
        board.setPostDate(rs.getString("postdate"));
        board.setPostVisitcount(rs.getInt("visitcount"));
        // 게시물 전체 리스트를 저장하는 dataList에 BoardDTO 객체 추가
        dataList.add(board);
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 베이스 사용 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    return dataList;
  }

//   지정한 게시물 내용 출력
  public BoardDTO selectBoard(int postNum) {
    BoardDTO board = new BoardDTO();

    String sql = "SELECT num, title, content, id, postdate, visitcount ";
    sql += "FROM board ";
    sql += "WHERE num = " + postNum + " ";

    try {
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        board.setPostNum(rs.getInt("num"));
        board.setPostTitle(rs.getString("title"));
        board.setPostContent(rs.getString("content"));
        board.setPostWriteUser(rs.getString("id"));
        board.setPostDate(rs.getString("postdate"));
        board.setPostVisitcount(rs.getInt("visitcount"));
      }
    }
    catch (SQLException e) {
      System.out.println("게시글 조회 시 오류가 발생했습니다.");
      e.printStackTrace();
    }

    return board;
  }

  // 게시물 등록하기
  public int insertBoard(BoardDTO board) {
    int result = 0;

    // sql 쿼리문 생성, PreparedStatement를 사용할 것이므로 데이터 입력 부분에 ?를 대신 사용
    String sql = "INSERT INTO board (title, content, id, postdate) ";
    sql += "VALUES (?, ?, ?, now()) ";

    try {
      // PreparedStatement 객체 생성
      pstmt = conn.prepareStatement(sql);
      // SQL 쿼리문의 ? 부분에 실제 데이터 입력
      pstmt.setString(1, board.getPostTitle());
      pstmt.setString(2, board.getPostContent());
      pstmt.setString(3, board.getPostWriteUser());

      // SQL 쿼리문을 데이터 베이스에 전송하여 실행, 결과를 받아옴
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("게시물 입력 시 오류가 발생했습니다.");
      e.printStackTrace();
    }
    return result;
  }

  // 게시물 정보 수정하기
  public int updateBoard(int postNum, String postTitle, String postContent) {
    int result = 0;

    String sql = "UPDATE board SET title = ?, content = ? ";
    sql += "WHERE num = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, postTitle);
      pstmt.setString(2, postContent);
      pstmt.setInt(3, postNum);

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("글 수정 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    return result;
  }

  // 게시물 삭제하기
  public int deleteBoard(int postNum) {
    int result = 0;
    // DELETE 쿼리 작성
    String sql = "DELETE FROM board WHERE num = ? ";
    try {
      // PreparedStatement 객체 생성 및 sql 쿼리문에 실제 데이터 대입
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postNum);
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("게시물 삭제 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    return result;
  }

  // 게시물 조회수 올리기
  public void updateVisitCount(int postNum) {
    String sql = " UPDATE board SET visitcount = visitcount + 1 WHERE num = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postNum);
      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("조회수 업데이트 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }
}






















