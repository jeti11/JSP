<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-10
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--JSTL의 import 혹은 액션태그의 include를 통해서 다른 파일에 포함 될 페이지--%>
<h4>OtherPage.jsp</h4>
<ul>
<%--  이전 페이지에서 request영역에 저장한 requestVar 변수를 출력--%>
  <li>저장된 값 : ${requestVar}</li>
  <li>매개변수 1 : ${param.user_param1}</li>
  <li>매개변수 2 : ${param.user_param2}</li>
</ul>

