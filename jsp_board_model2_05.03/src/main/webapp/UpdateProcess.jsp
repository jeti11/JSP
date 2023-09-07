<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-02
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>


<%
  // 이전 페이지에서 수정할 데이터 정보 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));
  String postTitle = request.getParameter("postTitle");
  String postWriteUser = request.getParameter("postWriteUser");
  String postContent = request.getParameter("postContent");
  
  // 데이터 베이스 연결
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  
  // 가져온 데이터로 데이터 수정하기
  int updateResult = dao.updateBoard(postNum, postTitle, postContent);
  dao.dbClose();
  
  // 수정완료 시 BoardList.jsp로 이동, 아니면 이전 페이지로 이동
  if (updateResult == 1) {
//    response.sendRedirect("BoardList.jsp");
    response.sendRedirect("BoardRead.jsp?postNum=" + postNum);
  }
  else {
    String errMsg = "<script>";
    errMsg += "alert('게시글 수정 중 오류가 발생했습니다.');";
    errMsg += "history.back();";
    errMsg += "</script>";
    
    out.println(errMsg);
  }
%>