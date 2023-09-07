<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="utf-8">
  <title>내장 객체 - response</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<%-- 클라이언트에서 전송한 사용자 id, pw를 가져옴 --%>
  <%
    String id = request.getParameter("user_id");
    String pwd = request.getParameter("user_pwd");
    
//    현재 데이터베이스 연결 부분이 없기 때문에 단순 문자열 비교로 로그인 id, pw를 구분
//  equalsIgnoreCase() : id, pw 문자열의 데이터를 대문자 구분없이 비교한다.
//  sendRedirect(URL) : 지정한 웹페이지로 이동, 클라이언트에서 다시 지정한 페이지로 접속을 하는 것처럼 데이터 처리를 함(클라이언트가 주소창에 새로운 사이트 입력해서 이동하는 것과 동일한 방식)
//  -> 현재 페이지에서 가지고 있던 request 정보를 공유하지 못함

//  getRequestDispatcher(URL) : 지정한 웹페이지로 이동, 서버에서 직접 지정한 페이지로 이동(클라이언트 거치지 않고)
//  -> 현재 페이지의 request정보를 가지고 이동함(데이터를 공유)
    if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
//      ResponseWelcome.jsp 페이지로 이동
      response.sendRedirect("ResponseWelcome.jsp");
    }
    else {
//      ResponseWelcome.jsp 페이지로 이동
      request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
    }
  %>
</body>
</html>
