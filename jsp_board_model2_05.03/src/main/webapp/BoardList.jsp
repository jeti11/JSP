<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>
<%@ page import="java.util.List" %>

<%
  //
  String userId = (String)session.getAttribute("userId"); // session은 오브젝트 타입으로 저장하기때문에 강제타입변환 필요
  String userName = (String)session.getAttribute("userName");
  
%>


<%--글쓰기 페이지 -> 처리 페이지--%>
<%--수정 페이지 -> 처리 페이지--%>
<%--삭제 페이지(필요x) -> 처리페이지--%>
<%--글읽기 페이지--%>

<%
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  
  // 전체 게시물 수 구하기
  int totalCount = dao.totalCount();
  
  // 현재 페이지에서 출력할 최대 게시물 수
  int postSize = 5;
  // 현재 블룩에서 표현할 페이지 수
  int blockPage = 5;
  // 전체 페이지 수
  int totalPage = (int)Math.ceil((double)totalCount / postSize);
  
  // 현재 페이지 수 기본값
  int pageNum = 1;
  
  // 게시물 페이지 번호를 요청 매개변수로 받음
  String pageTemp = request.getParameter("pageNum");
  // 게시물 전체 리스트 가져와서 boardList에 저장
  
  // 현재 페이지 요청 시 클라이언트에서 전달된 데이터 중 pageNum의 값이 null이 아니거나 "" 이 아닐 경우 pageNum의 값을 정수로 변경하여 pageNum 변수에 저장
  if (pageTemp != null && !pageTemp.equals("")) {
    pageNum = Integer.parseInt((pageTemp));
  }
  
  // 첫번째 게시물 번호
  int startNum = (pageNum - 1) * postSize + 1;
  
  // 마지막 게시물 번호
  int end = (pageNum * postSize);
  
  // 게시물 전체 리스트 가져오기
  
  List<BoardDTO> boardList = dao.selectList(startNum, postSize);
  dao.dbClose();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>model1 방식 게시판 만들기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <%@ include file="Header.jsp"%>
  <main class="container my-4">
    <table class="table table-hover table-striped">
      <thead>
        <tr>
          <th>글번호</th>
          <th>글제목</th>
          <th>글쓴이</th>
          <th>등록일</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
      <%
        // 가져온 게시물의 크기 확인
        if (boardList.size() != 0) { // 게시물이 존재하면
          for (BoardDTO dto : boardList) {
      %>
      <tr>
        <td><%=dto.getPostNum()%></td>
<%--    제목 표시 부분에 해당 글을 읽기 위한 링크를 설정--%>
        <td><a href="BoardRead.jsp?postNum=<%=dto.getPostNum()%>" class="text-decoration-none"><%=dto.getPostTitle()%></a></td>
        <td><%=dto.getPostWriteUser()%></td>
        <td><%=dto.getPostDate()%></td>
        <td><%=dto.getPostVisitcount()%></td>
      </tr>
      <%
          }
        }
        else { // 게시물이 없으면
      %>
      <tr>
        <td colspan="5">게시물이 없습니다.</td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
    <div class="my-3">
<%--      이전 페이지 버튼--%>
      <%
        String pagingStr = ""; // 화면에 페이징 번호를 출력하기 위한 문자열 생성 부분
        // pageNum : 현재 페이지 번호
        // blockPage : 현재 블록에서 표현할 페이지수
        // temp : 계산된 페이지 번호를 저장할 변수
        int temp = (((pageNum - 1) / blockPage) * blockPage) + 1;
        if (temp != 1) {
          pagingStr += "<a href='BoardList.jsp?pageNum=" + (temp - 1) + "'>이전 블록</a>";
        }
      %>
      
<%--      각 페이지 버튼--%>
      <%
        // blockCount : 현재 블록의 카운트 기본값
        // totalPage : 전체 페이지 수
        int blockCount = 1;
        while (blockCount <= blockPage && temp <= totalPage) {
          // 현재 페이지와 계산된 페이지 값이 같으면
          if (temp == pageNum) {
            // 현재 페이지 번호만 출력하고 링크는 사용하지 않음
            // &nbsp : 한 칸 띄워주기
            pagingStr += "&nbsp;" + temp + "&nbsp;";
          }
          else {
            // 계산된 페이지 번호에 링크를 적용
            pagingStr += "&nbsp;<a href='BoardList.jsp?pageNum=" + temp + "'>" + temp + "</a>&nbsp;";
          }
          temp++;
          blockCount++;
        }
      %>
  
      <%
        if (temp <= totalPage) {
          pagingStr += "<a href='BoardList.jsp?pageNum=" + temp + "'>다음블록</a>";
        }
        out.println(pagingStr);
      %>
    </div>
    <%
      if (session.getAttribute("userId") != null) {
    %>
    <div class="container my-4 d-flex justify-content-end">
      <a href="BoardWrite.jsp" class="btn btn-primary">글쓰기</a>
    </div>
    <%
      }
    %>
  </main>
  <%@ include file="Footer.jsp"%>
</body>
</html>