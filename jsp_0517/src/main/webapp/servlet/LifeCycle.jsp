<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-17
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>LifeCycle.jsp</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <script>
    function requestAction(frm, met) {
      // 매개변수에 따라 method 결정
      if (met == 1) {
        frm.method = 'get';
      }
      else {
        frm.method = 'post';
      }
      // 자바스크립트를 이용하여 submit 동작
      frm.submit();
    }
  </script>

  <div class="container my-4">
    <h2>서블릿 생명주기(Life Cycle) 메소드</h2>
    <form action="/servlet/LifeCycle.do">
      <div class="my-3">
<%--        button에 클릭 이벤트로 자바스크립트 함수 requestAction()를 설정--%>
        <button type="button" class="btn btn-primary" onclick="requestAction(this.form, 1)">Get 방식 요청하기</button>
        <button type="button" class="btn btn-success" onclick="requestAction(this.form, 2)">Post 방식 요청하기</button>
      </div>
    </form>
  </div>
</body>
</html>






















