<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  // 등록된 userId, userName 이라는 이름의 세션 정보를 삭제
  session.removeAttribute("userId");
  session.removeAttribute("userName");
  
  // 등록된 모든 세션 정보를 삭제
  session.invalidate();
  
  String msg = "<script>";
  msg += "alert('로그아웃 했습니다.');";
  msg += "location.href='BoardList.jsp';";
  msg += "</script>";
  
  out.println(msg);
%>