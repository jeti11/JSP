<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--세션 정보 확인해서 로그인 된 상태에서만 글쓰기, 수정, 삭제 할 수 있도록 하기 위한 jsp 파일--%>
<%
  if (session.getAttribute("userId") == null) {
    String errMsg = "<script>";
    errMsg += "alert('로그인 후 이용해주세요');";
    errMsg += "location.href='Login.jsp';";
    errMsg += "</script>";
    
    out.println(errMsg);
  }
%>