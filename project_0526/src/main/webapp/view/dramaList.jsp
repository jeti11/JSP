<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>드라마 게시판 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
	<c:import url="/layout/header.jsp"/>
	<main class="container my-4">
		<div class="row">
			<div class="col-sm-5 mx-auto">
				<div class="my-5 text-center">
					<h4>#드라마 리뷰 게시판</h4>
				</div>
			</div>
		</div>
		<div class="row my-5">
			<div class="col-sm-8 mx-auto">
				<table class="table table-hover table-striped text-center">
					<colgroup>
						<col style="width: 5%">
						<col style="width: 50%">
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 8%">
					</colgroup>
					<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>등록날짜</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty dramaList}">
							<tr>
								<td colspan="6">등록된 글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${dramaList}" var="item" varStatus="loop">
								<tr>
									<td>${item.getIdxDrama()}</td>
									<td class="text-start"><a href="/blog/dramaView.do?idx=${item.getIdxDrama()}">${item.getTitle()}</a></td>
									<td>${item.getPostdate()}</td>
									<td>${item.getVisits()}</td>
									<td>${item.getRespects()}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<div class="d-flex justify-content-end">
			<c:if test="${userGrade == 1}">
				<c:set var="item" value="${dramaList}"/>
				<a href="/blog/dramaWrite.do" class="btn btn-primary">글쓰기</a>
			</c:if>
		</div>
	</main>
	<c:import url="/layout/footer.jsp"/>
</body>
</html>
