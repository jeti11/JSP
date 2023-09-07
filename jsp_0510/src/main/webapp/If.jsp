<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - if</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
<%--    JSTL로 변수 생성 및 page영역에 저장--%>
    <c:set var="number" value="100"/>
    <c:set var="string" value="JSP"/>
    
    <h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
<%--  JSTL을 사용하여 page영역에 저장된 변수 number을 가져와서 2로 나눈 나머지가 0과 같은지 확인--%>
<%--  그 결과를 page영역의 변수 result에 저장--%>
    <c:if test="${number mod 2 eq 0}" var="result">
<%--      <c:if test="${number % 2 == 0}" var="result">--%>
      ${number}는 짝수입니다. <br />
    </c:if>
    result : ${result} <br />
    <br>
    <h4>문자열 비교와 else 구문 흉내내기</h4>
  <%--로그인 상태에 따라서 화면을 다르게 표현할 때 주로 사용--%>
  
<%--  JSTL 사용하여 page 영역에 저장된 string의 값과 문자열을 비교하고 page 영역의 result2 변수에 저장--%>
<%--<c:if test="${string == 'Java'}" var="result2">--%>
    <c:if test="${string eq 'Java'}" var="result2">
      문자열은 Java입니다. <br/>
    </c:if>
<%--  JSTL을 사용하여 page영역에 저장된 result2 변수 값에 not연산자를 사용하여 if~else 문을 구현--%>
<%--<c:if test="${!result2}">--%>
    <c:if test="${not result2}">
      'Java'가 아닙니다. <br />
    </c:if>
    <br>
    <h4>조건식 주의사항</h4>
    <c:if test="100" var="result3">
      EL이 아닌 정수를 지정하면 false
    </c:if>
    result3 : ${result3} <br />
    
    <c:if test="tRuE" var="result4">
      대소문자 구분 없이 "tRuE"인 경우 true <br />
    </c:if>
    result4 : ${result4} <br />
    
<%--  EL문 안쪽의 공백은 상관없으나, EL문 밖에 공백이 있을 경우 false로 인식--%>
    <c:if test=" ${true} " var="result5">
      EL 양쪽에 빈 공백이 있는 경우 false <br />
    </c:if>
    result5 : ${result5} <br />
  </div>
</body>
</html>




























