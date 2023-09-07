<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 등록된 userId, userName이라는 이름의 세션 정보를 삭제
  session.removeAttribute("userId");
  session.removeAttribute("userName");
  
  // 등록된 모든 세션 정보를 삭제
  session.invalidate();
  
  response.sendRedirect("LoginForm.jsp");
%>