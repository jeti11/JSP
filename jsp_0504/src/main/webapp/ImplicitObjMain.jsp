<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  pageContext.setAttribute("scopeValue", "페이지 영역");
  request.setAttribute("scopeValue", "리퀘스트 영역");
  session.setAttribute("scopeValue", "세션 영역");
  application.setAttribute("scopeValue", "어플리케이션 영역");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>표현언어 - 내장객체</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>ImplicitObjMain 페이지</h2>
    <h3>각 영역에 저장된 속성 읽기</h3>
    <ul>
<%--      표현 언어로 내장객체 접근시 scope 라는 단어 추가됨--%>
      <li>페이지 영역 : ${pageScope.scopeValue}</li>
      <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
      <li>세션 영역 : ${sessionScope.scopeValue}</li>
<%--  속성 표시로 대괄호를 사용해도 됨--%>
      <li>어플리케이션 영역 : ${applicationScope["scopeValue"]}</li>
    </ul>
    
    <h3>영역 지정 없이 속성 읽기</h3>
    <ul>
<%--      영역 지정 없이 속성을 읽어오면 페이지영역(가장 좁은 영역부터)을 불러온다--%>
      <li>${scopeValue}</li>
    </ul>
<%--    액션태그 포워드 명령어를 통해 페이지 이동--%>
    <jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
  </div>
</body>
</html>
