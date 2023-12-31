<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JSTL - import</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
<%--    JSTL을 사용하여 request 영역에 데이터 저장 -> forward 및 include된 페이지와 공유가능--%>
    <c:set var="requestVar" value="MustHave" scope="request"/>
<%--    JSTL의 import는 액션태그의 include와 동일한 기능--%>
<%--    액션태그의 include : 해당 페이지로 이동후 실행결과를 가져옴--%>
<%--    param 태그를 사용하여 매개변수를 import할 페이지로 전달할 수 있음--%>
<%--    import할 페이지를 page 영역의 변수 contents에 저장--%>
    <c:import url="OtherPage.jsp" var="contents">
      <c:param name="user_param1" value="JSP"/>
      <c:param name="user_param2" value="기본서"/>
    </c:import>
    
    <h4>다른 문서 삽입하기</h4>
<%--    page 영역에 저장된 외부 페이지를 불러옴--%>
    ${contents}
    
    <h4>외부 자원 삽입하기</h4>
    <iframe src="GoldPage.jsp" style="width: 100%; height: 600px;"></iframe>
  
  </div>
</body>
</html>
