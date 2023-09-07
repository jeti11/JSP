<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.*" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - set2</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h4>List 컬렉션 이용하기</h4>
    <%
      ArrayList<Person> pList = new ArrayList<>();
      pList.add(new Person("성삼문", 55));
      pList.add(new Person("박팽년", 60));
    %>
<%--    value에 표현식<%= %>사용하는 이유는 pList 변수를 생성했지만 내장객체에 저장하지 않았기 때문에 표현언어 사용불가능하여 표현식으로 출력함--%>
    <c:set var="personList" value="<%= pList%>" scope="request"/>
    <ul>
      <li>이름 : ${requestScope.personList[0].name}</li>
      <li>나이 : ${personList[0].age}</li>
    </ul>
    
    <h4>Map 컬렉션 이용하기</h4>
    <%
      Map<String, Person> pMap = new HashMap<>();
      pMap.put("personArgs1", new Person("하위지", 65));
      pMap.put("personArgs2", new Person("이개", 67));
    %>
    <c:set var="personMap" value="<%=pMap%>" scope="request"/>
    <ul>
      <li>이름1 : ${requestScope.personMap.personArgs1.name}</li>
      <li>나이1 : ${personMap.personArgs1.age}</li>
  
<%--      <li>이름 : <%=pMap.get("personArgs2").getName()%></li>--%>
      <li>이름2 : ${personMap.personArgs2.name}</li>
      <li>나이2 : ${personMap.personArgs2.age}</li>
    </ul>
    
    <p>이름 : ${requestScope.personVar2.name}</p>
    
  </div>
</body>
</html>























