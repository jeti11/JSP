<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bitc.jsp_0510.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - forEach 2</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h4>List 컬렉션 사용하기</h4>
    <%
      LinkedList<Person> lists = new LinkedList<>();
      lists.add(new Person("맹사성", 34));
      lists.add(new Person("장영실", 44));
      lists.add(new Person("신숙주", 54));
    %>
<%--    JSTL을 사용하여 리스트 객체를 page 영역에 저장--%>
    <c:set var="lists" value="<%=lists%>"/>
    <c:forEach var="list" items="${lists}">
      <li>
        이름 : ${list.name}, 나이 : ${list.age}
      </li>
    </c:forEach>
    <br>
    <h4>Map 컬렉션 사용하기</h4>
    <%
      Map<String, Person> maps = new HashMap<>();
      maps.put("1st", new Person("맹사성", 34));
      maps.put("2nd", new Person("장영실", 44));
      maps.put("3rd", new Person("신숙주", 54));
    %>
    
    <c:set var="maps" value="<%=maps%>"/>
    <c:forEach var="map" items="${maps}">
      <li>Key => ${map.key}<br>
      Value => 이름 : ${map.value.name}, 나이 : ${map.value.age}</li>
    </c:forEach>
    
  </div>
</body>
</html>























