<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오후 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>액션태그 - forward</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>포워드 결과</h2>
    <ul>
      <li>
        <%-- 액션태그의 forward 명령으로 페이지가 이동했기 때문에 page영역은 공유 안됨 --%>
        page 영역 : <%= pageContext.getAttribute("pAttr")%>
      </li>
      <li>
        <%-- 액션태그의 forward 명령으로 페이지가 이동했지만, 클라이언트를 거치지 않고 서버끼리 페이지 이동이기 때문에 request 내장 객체를 공유하고 있음 --%>
        request 영역 : <%= request.getAttribute("rAttr")%>
      </li>
    </ul>
  </div>
</body>
</html>
