<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - choose/when/otherwise</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
<div class="container my-4">
<%--  JSTL을 사용하여 변수 number에 정수 100을 page영역에 저장--%>
  <c:set var="number" value="100" />
  
  <h4>choose 태그로 홀짝 판단하기</h4>
  <c:choose>
    <c:when test="${number % 2 == 0}">
      ${number}는 짝수입니다.
    </c:when>
    <c:otherwise>
      ${number}는 홀수입니다.
    </c:otherwise>
  </c:choose>
  
  <h4>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h4>
<%--  form태그 사용 시 action 속성을 지정하지 않으면 현재 페이지로 접속--%>
<%--  데이터는 get 방식으로 전송됨--%>
  <form>
    국어 : <input type="text" name="kor"/><br>
    영어 : <input type="text" name="eng"/><br>
    수학 : <input type="text" name="math"/><br>
    <input type="submit" value="학점 구하기">
  </form>
<%--  JSTL의 if문 사용하여 데이터가 있으면 화면 출력--%>
<%--  empty 연산자 : 비었으면 true를 나타내는 EL의 명령어 --%>
<%--  param : getParameter()와 동일한 역할을 하는 EL의 명령어--%>
<%--  EL의 param을 사용하여 전달된 데이터 가져오기, empty로 데이터 확인 및 or 연산--%>
  <c:if test="${!(empty param.kor or empty param.eng or empty param.math)}">
<%--   전달된 데이터를 JSTL을 사용하여 연산 후 page 영역의 변수 avg에 저장--%>
    <c:set var="avg" value="${(param.kor + param.eng + param.math) / 3}"/>
    평균 점수는 ${avg}으로
<%--   JSTL의 choose/when/otherwise를 통해서 if ~ else if ~ else 문을 구현--%>
    <c:choose>
      <c:when test="${avg >= 90}">A 학점</c:when>
      <c:when test="${avg >= 80}">B 학점</c:when>
      <c:when test="${avg >= 70}">C 학점</c:when>
      <c:when test="${avg >= 60}">D 학점</c:when>
      <c:otherwise>F 학점</c:otherwise>
    </c:choose>
    입니다.
  </c:if>
</div>
</body>
</html>































