<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오전 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>마이페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// $(document).ready(function () {
    //   $("#main-drama").on("click", function () {
    //     var idx = $("#comment-idx").val();
	  //     location.href ="/blog/dramaView.do?idx=" + idx;
    //   })
		// })
	</script>
</head>
</head>
<body>
	<c:import url="/layout/header.jsp"/>
	<main class="container my-4">
		<div class="row">
			<div class="col-sm-10 mx-auto">
				<div class="my-5 text-center">
					<h4>마이페이지</h4>
					<h5><%=request.getAttribute("userNick")%> 회원님 방문해주셔서 감사합니다.</h5>
				</div>
				<div class="row">
					<div class="col-sm">
						<div class="my-5 text-center">
							<p>회원정보 수정을 원하신다면 아래 <strong>회원정보 수정</strong> 버튼을 클릭해주세요</p>
							<a href="/blog/memberEdit.do?id=${userId}" class="btn btn-success">회원정보 수정</a>
						</div>
					</div>
					<div class="col-sm">
						<div class="my-5 text-center">
							<p>회원 탈퇴를 원하신다면 아래 <strong>회원 탈퇴</strong> 버튼을 클릭해주세요</p>
							<a href="/blog/memberDeletePass.do?id=${userId}" class="btn btn-secondary">회원 탈퇴</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-4">
			<div class="col-sm-12 mx-auto">
				<p class="fw-semibold fs-5">※ 나의 최근 활동</p>
				<p class="text-secondary text-center my-3">회원님이 작성하신 댓글을 최신 순으로 3개씩 보여드립니다.<br>댓글을 작성하신 글을 읽기 원하시면 댓글 내용을 클릭하세요.</p>
				<div class="row">
					<div class="col-sm">
						<p class="fw-semibold mt-3">#드라마 리뷰 게시판</p>
						<c:choose>
							<c:when test="${empty dramaCommentList}">
								<p class="text-center text-secondary">활동 내역이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${dramaCommentList}" var="item" varStatus="loop">
									<div class="shadow p-2 mb-5 bg-body rounded mt-2" id="main-drama">
										<div class="d-flex justify-content-between">
											<p class="mt-1">${item.getPostdate()}</p>
											<p class="mt-1">${item.getCate()}</p>
										</div>
										<a href="/blog/dramaView.do?idx=${item.getIdxDrama()}" class="mt-3 text-decoration-none text-black">${item.getComment()}</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm">
						<p class="fw-semibold mt-3">#일상 게시판</p>
						<c:choose>
							<c:when test="${empty dailyCommentList}">
								<p class="text-center text-secondary">활동 내역이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${dailyCommentList}" var="item2" varStatus="loop">
									<div class="shadow p-2 mb-5 bg-body rounded mt-2" id="main-daily">
										<div class="d-flex justify-content-between">
											<p class="mt-1">${item2.getPostdate()}</p>
											<p class="mt-1">${item2.getCate()}</p>
										</div>
										<a href="/blog/dailyView.do?idx=${item2.getIdxDaily()}" class="mt-3 text-decoration-none text-black">${item2.getComment()}</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm">
						<p class="fw-semibold mt-3">#플레이리스트 게시판</p>
						<c:choose>
							<c:when test="${empty playCommentList}">
								<p class="text-center text-secondary">활동 내역이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${playCommentList}" var="item3" varStatus="loop">
									<div class="shadow p-2 mb-5 bg-body rounded mt-2" id="main-daily">
										<div class="d-flex justify-content-between">
											<p class="mt-1">${item3.getPostdate()}</p>
											<p class="mt-1">${item3.getCate()}</p>
										</div>
										<a href="/blog/playView.do?idx=${item3.getIdxPlay()}" class="mt-3 text-decoration-none text-black">${item3.getComment()}</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:import url="../layout/footer.jsp"/>
</body>
</html>
