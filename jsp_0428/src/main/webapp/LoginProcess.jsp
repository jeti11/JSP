
<%--데이터베이스를 사용하기 때문에 DTO, DAO 클래스를 임포트 해줘야 함--%>
<%@ page import="com.bitc.jsp_0428.MemberDAO" %>
<%@ page import="com.bitc.jsp_0428.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  // 클라이언트에서 전달된 데이터를 가져오기
  String userId = request.getParameter("user_id");
  String userPw = request.getParameter("user_pw");
  
  String dbDriver = application.getInitParameter("dbDriver");
  String dbUrl = application.getInitParameter("dbUrl");
  String opt1 = application.getInitParameter("dbUrlOpt1");
  String opt2 = application.getInitParameter("dbUrlOpt2");
  String opt3 = application.getInitParameter("dbUrlOpt3");
  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");
  
  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;
  
  //DB 객체 생성과 동시에 연결
  MemberDAO dao = new MemberDAO(dbDriver, dbUrl, dbUserId, dbUserPw);
  
  // 데이터베이스와 데이터를 주고받을 DTO 클래스 타입의 객체 생성
  // DAO를 통해서 데이터 가져오기
  MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
  dao.close();
  
  // 가져온 DTO 객체에 데이터가 있는지 확인
  if (memberDTO.getId() != null) {
    // 데이터가 있을 경우 세션에 데이터 추가
    session.setAttribute("userId", memberDTO.getId());
    session.setAttribute("userName", memberDTO.getName());
    response.sendRedirect("LoginForm.jsp");
  }
  else {
    // 데이터가 있을 경우 내장객체 request에 오류 메시지 추가
    request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
    request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
  }
%>

