<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - xml</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
<%--    xml 정보가 있는 파일 내용 가져오기--%>
<%--    page영역의 변수 booklist에 저장--%>
    <c:import url="http://localhost:8080/BookList.xml" var="booklist" charEncoding="UTF-8"/>
  
<%--  변수 booklist에 저장된 xml정보를 파싱, page영역의 변수 blist에 저장--%>
    <x:parse xml="${booklist}" var="blist" />
    
    <h4>파싱 1</h4>
<%--  select 속성을 사용하여 xml내용 중 특정 태그를 선택해서 화면에 출력(out)--%>
    제목 : <x:out select="$blist/booklist/book[1]/name"/><br>
    저자 : <x:out select="$blist/booklist/book[1]/author"/><br>
    가격 : <x:out select="$blist/booklist/book[1]/price"/><br>
    <br>
    
    <h4>파싱 2</h4>
    <table class="table table-stripped">
      <tr>
        <th>제목</th>
        <th>저자</th>
        <th>가격</th>
      </tr>
<%--      반복 실행을 위해서 select 속성을 태그로 지정, 아래에서 사용할 변수를 설정--%>
      <x:forEach select="$blist/booklist/book" var="item">
        <tr>
          <td><x:out select="$item/name"/></td>
          <td><x:out select="$item/author"/></td>
          <td>
<%--            choose, when, otherwise를 사용하여 if ~ else 문 구현--%>
            <x:choose>
              <x:when select="$item/price >= 20000">2만원 이상</x:when>
              <x:otherwise>2만원 미만</x:otherwise>
            </x:choose>
          </td>
        </tr>
      </x:forEach>
    </table>
    
    <h4>파싱 3</h4>
    <table class="table table-stripped">
      <x:forEach select="$blist/booklist/book" var="item">
        <tr>
          <td><x:out select="$item/name"/></td>
          <td><x:out select="$item/author"/></td>
          <td><x:out select="$item/price"/></td>
          <td><x:if select="$item/name = '총,균,쇠'">구매함</x:if></td>
        </tr>
      </x:forEach>
    </table>
  </div>
</body>
</html>





















