<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - out</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <c:set var="iTag">
<%--      value="" 대신 아래 형태로도 값을 저장할 수 있음--%>
      i 태그는 <i>기울임</i>을 표현합니다.
    </c:set>
    
    <h4>기본 사용</h4>
<%--    escapeXml이 기본값인 true가 되었기 때문에 입력되어 있는 내용을 그대로 데이터로 인식하여 출력--%>
    <c:out value="${iTag}"/>
    
    <h4>escapeXml 속성</h4>
<%--    escapeXml이 false가 되어있기 때문에 입력되어 있는 내용 중 특수기호의 기능을 사용해서 출력--%>
    <c:out value="${iTag}" escapeXml="false"/>
    
    <h4>default 속성</h4>
<%--    JSTL을 사용하여 default 속성에 데이터 지정--%>
<%--    value 속성의 값이 null일 경우에만 default의 데이터를 출력함--%>
    <c:out value="${param.name}" default="이름 없음"/>
<%--    value="" 빈 문자열도 값이기 때문에(null 아님) default값 출력 안됨--%>
    <c:out value="" default="빈 문자열도 값입니다."/>
  </div>
</body>
</html>
