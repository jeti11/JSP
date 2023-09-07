<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>세션 사용하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<div class="container my=4">
  <%
    String userId = "";
    String userPw = "";
    
    // getAttribute()로 데이터를 가져왔는데 데이터가 null일 경우, 지정한 이름으로 세션에 저장된 데이터가 없음을 의미
    if (session.getAttribute("userId") != null) {
      userId = session.getAttribute("userId").toString(); // 오브젝트타입의 데이터를 문자열로 변경해주기 위해 toString() 붙인것
      userPw = (String)session.getAttribute("userPw");
    }
    
  %>
  <h2>세션 확인 페이지</h2>
  <p><%= userId %>님 반갑습니다.</p>
  <p>당신의 비밀번호는 <%= userPw %> 입니다.</p>
  
  <a href="./LoginForm.jsp" target="_self" class="btn btn-primary">로그인 페이지로 되돌아가기</a>
</div>
</body>
</html>
