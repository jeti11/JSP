<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-28
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Session</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <jsp:include page="Link.jsp"></jsp:include>
    <h2>로그인 페이지</h2>
    <span style="color: red; font-size: 1.2em;">
<%--     표현식 사용, 내장객체 리퀘스트에 저장된 정보 중 LoingErrMsg라는 이름을 가지고 있는것이 있는지 확인--%>
<%--     내장객체 request에 저장된 정보가 없으면 빈문자열, 있으면 입력된 LoginErrMsg 출력--%>
      <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
    </span>
      <%
        // 내장객체 session에 저장된 정보 중 userId라는 이름의 데이터가 있는지 확인
        // 데이터가 없으면 아래의 script ~ form 실행하겠다
        if (session.getAttribute("userId") == null) {
      %>
<%--    자바스크립트로 input태그에 데이터가 있는지 없는지 확인--%>
      <script>
        function validateForm(form) {
          if (!form.user_id.value) {
            alert("아이디를 입력하세요");
            return false;
          }
          if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
          }
        }
      </script>
<%--    사용자 입력 데이터를 LoginProcess.jsp로 전달, submit 버튼 클릭시 자바스크립트로 데이터 검증 함수 실행--%>
      <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" /><br>
        패스워드 : <input type="text" name="user_pw" /><br>
        <input type="submit" value="로그인하기">
      </form>
      <%
        }
        else { // 내장객체 session에 userId라는 이름의 데이터가 있으면
          // 내장객체 session에 userName이라는 이름의 데이터를 출력
      %>
      <%= session.getAttribute("userName") %> 회원님, 로그인하셨습니다.<br>
      <a href="Logout.jsp">[로그아웃]</a>
      <%
        }
      %>
  </div>
</body>
</html>



















