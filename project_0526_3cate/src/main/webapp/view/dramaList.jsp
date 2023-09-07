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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
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
		<div class="row mt-5">
			<div class="col-sm-8 mx-auto">
				<table class="table border table-hover table-striped text-center">
					<colgroup>
						<col style="width: 10%">
						<col style="width: 40%">
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>등록날짜</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>첨부파일</th>
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
									<td class="text-start"><a href="/blog/dramaView.do?idx=${item.getIdxDrama()}" class="text-decoration-none text-black fw-bold">${item.getTitle()}</a></td>
									<td>${item.getPostdate()}</td>
									<td>${item.getVisits()}</td>
									<td>${item.getRespects()}</td>
									<td>
										<c:if test="${not empty item.getDramaOfile()}">
											<a href="/blog/dramaDown.do?ofile=${item.dramaOfile}&sfile=${item.dramaSfile}&idx=${item.idxDrama}"><i class="bi bi-file-earmark-arrow-down"></i></a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<c:if test="${userGrade == 1}">
					<c:set var="item" value="${dramaList}"/>
					<div class="d-flex justify-content-end">
						<a href="/blog/dramaWrite.do" class="btn btn-primary">글쓰기</a>
					</div>
				</c:if>
			</div>
		</div>
	</main>
	<c:import url="/layout/footer.jsp"/>
</body>
</html>
