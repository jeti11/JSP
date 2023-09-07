<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-27
  Time: 오후 3:51
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
  <div class="container">
    <%
      String script = "<script>";
      // 클라이언트에서 전송한 사용자 정보
      request.setCharacterEncoding("UTF-8");
      String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      
      // 클라이언트에서 전송한 사용자 정보와 로그인 정보가 같으면 세션에 데이터 추가
      if (userId.equals("test1") && userPw.equals("1234")) {
        // 세션에 데이터 추가 (키, 데이터), 모든 데이터는 오브젝트 타입으로 저장됨
        session.setAttribute("userId", userId);
        session.setAttribute("userPw", userPw);
        // 서버에 해당 세션을 유지할 시간 설정
        session.setMaxInactiveInterval(10);
        
        script += "alert('세션 설정에 성공했습니다.');";
        script += "location.href='/LoginInfo.jsp';";
        script += "</script>";
  
        out.println(script);
      }
      else {
        script += "alert('세션 설정에 실패했습니다.');";
        script += "history.back();";
        script += "</script>";
        
        out.println(script);
      }
    %>
  
    <a href="./LoginInfo.jsp">세션 정보 확인 페이지</a>
  </div>
</body>
</html>
