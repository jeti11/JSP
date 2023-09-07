<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오전 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <h2>ImplicitForwardResult 페이지</h2>
    <h3>각 영역에 저장된 속성 읽기</h3>
    <ul>
<%--      페이지가 이동되었으므로 페이지 영역의 속성은 삭제됨--%>
      <li>페이지 영역 : ${pageScope.scopeValue}</li>
<%--        포워드 : 하나의 요청으로 서버에 접속 후 지정한 페이지로 서버내에서 이동되는 것이기 때문에 리퀘스트 영역의 속성은 살아있음--%>
      <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
      <li>세션 영역 : ${sessionScope.scopeValue}</li>
      <li>어플리케이션 영역 : ${applicationScope["scopeValue"]}</li>
    </ul>
    <h3>영역 지정 없이 속성 읽기</h3>
    <ul>
<%--      이동된 페이지에서 영역 지정없이 속성을 읽으면 리퀘스트 영역의 데이터를 출력--%>
      <li>${scopeValue}</li>
    </ul>
  </div>
</body>
</html>
