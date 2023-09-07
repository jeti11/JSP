<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-03
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  // request.getRequestURI()는 쿼리스트링과 관계없이 파일명까지만 알려줌 (뒤에 있는 쿼리스트링 까지 얻고싶으면 request.getQueryString() 사용해야함
  String uri = request.getRequestURI();
//  String url = String.valueOf(request.getRequestURL());
  
//  out.println(uri + "<br>");
//  out.println(url + "<br>");
  
  String title = "";
  
  switch (uri) {
    case "/BoardWrite.jsp" :
      title = "Model1 방식 게시판 글 등록 페이지";
      break;
      
    case "/BoardRead.jsp" :
      title = "Model1 방식 게시판 글 확인 페이지";
      break;
      
    case "/BoardUpdate.jsp" :
      title = "Model1 방식 게시판 글 수정 페이지";
      break;
      
    case "/Login.jsp" :
      title = "Model1 방식 게시판 로그인 페이지";
      
    default:
      title = "Model1 방식 게시판 목록 페이지";
      break;
  }
%>

<header class="mb-4">
  <%
    if (session.getAttribute("userId") != null) {
      String logName = (String)session.getAttribute("userName");
  %>
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
    <ul class="navbar-nav">
      <li class="nav-item"><a href="BoardList.jsp" class="nav-link">메뉴 1</a></li>
    </ul>
    <ul class="navbar-nav ms-auto">
      <li class="nav-item"><p class="text-white me-2 pt-3" style="font-size: 12px"><%=logName%>님 환영합니다.</p></li>
      <li class="nav-item"><a href="LogoutProcess.jsp" class="nav-link btn btn-danger mt-1 me-3">로그아웃</a></li>
    </ul>
  </nav>
  <div class="container my-4 py-5 bg-secondary bg-opacity-50">
    <h1 class="text-center"><%=title%></h1>
  </div>
</header>
  <%
    }
    else {
  %>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
  <ul class="navbar-nav">
    <li class="nav-item"><a href="BoardList.jsp" class="nav-link">메뉴 1</a></li>
  </ul>
  <div class="ms-auto">
    <a href="Login.jsp" class="btn btn-success me-2">로그인</a>
  </div>
</nav>
<div class="container my-4 py-5 bg-secondary bg-opacity-50">
  <h1 class="text-center"><%=title%></h1>
</div>
</header>
  <%
    }
  %>
