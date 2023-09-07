<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0424.Person" %>

<%
  // request 내장 객체에 데이터 저장
  request.setAttribute("requestString", "request 영역의 문자열");
  request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<html>
<head>
  <meta charset="utf-8">
  <title>request 영역</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <h2>request 영역의 속성값 삭제하기</h2>
  <%
    // request 내장 객체에 저장된 데이터 삭제
    request.removeAttribute("requestString");
    // request 내장 객체에 requestInteger 라는 이름의 데이터가 없기 때문에 삭제되지 않음(오류는 발생 하지 않음)
    request.removeAttribute("requestInteger");
  %>
  <h2>request 영역의 속성값 읽기</h2>
  <%
    // request 내장 객체에 저장된 데이터 가져오기
    Person rPerson = (Person)(request.getAttribute("requestPerson"));
  %>
  <ul>
<%--    request 내장 객체에 저장된 데이터 출력하기--%>
<%--    requestString 이름의 데이터는 위에서 삭제해서 null나옴--%>
    <li>String 객체 : <%= request.getAttribute("requestString")%></li>
    <li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge()%></li>
  </ul>
  <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
  <%
    // forward : 다른 페이지로 이동
    // include : 지정한 파일을 복사붙여넣기 하여 현재 페이지에 넣는 개념
    // forward : 지정한 페이지로 이동하여 실행(출력)시킨 후 다시 원래 페이지의 내용을 실행(출력)
//    request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
  %>
</body>
</html>
