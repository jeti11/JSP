<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-18
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--		스크립틀릿을 사용하여 전달된 파라미터 값 가져오기--%>
		<%
			String pageName = request.getParameter("pageName");
      String result = "";
      if (pageName.equals("list")) {
        result = "게시물 목록 페이지";
      }
      else if (pageName.equals("write")) {
        result = "게시물 등록 페이지";
      }
      else if (pageName.equals("view")) {
        result = "게시물 상세 페이지";
      }
      else if (pageName.equals("pass")) {
	      result = "게시물 비밀번호 확인 페이지";
      }
      else if (pageName.equals("edit")) {
        result = "게시물 수정 페이지";
      }
		%>
	
<header class="py-4 bg-warning bg-opacity-25">
	<div class="container text-center">
		<h1 class="display-5">MVC2 방식 게시판</h1>
		<p class="fs-3"><<%=result%>></p>
<%--		EL언어 사용하여 전달된 파라미터값 가져오기--%>
<%--		<c:choose>--%>
<%--			<c:when test="${param.pageName == 'list'}">--%>
<%--				<p class="fs-3">게시물 목록 페이지</p>--%>
<%--			</c:when>--%>
<%--			<c:when test="${param.pageName == 'write'}">--%>
<%--				<p class="fs-3">게시물 등록 페이지</p>--%>
<%--			</c:when>--%>
<%--			<c:when test="${param.pageName == 'view'}">--%>
<%--				<p class="fs-3">게시물 상세 페이지</p>--%>
<%--			</c:when>--%>
<%--			<c:when test="${param.pageName == 'pass'}">--%>
<%--				<p class="fs-3">게시물 비밀번호 확인 페이지</p>--%>
<%--			</c:when>--%>
<%--			<c:when test="${param.pageName == 'edit'}">--%>
<%--				<p class="fs-3">게시물 수정 페이지</p>--%>
<%--			</c:when>--%>
<%--		</c:choose>--%>
	</div>
</header>