<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2023-05-21
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<header class="container-fluid sticky-top border-bottom bg-white">
		<div class="my-4 d-flex justify-content-around align-items-center">
			<a href="#cate" data-bs-toggle="offcanvas"><i class="bi bi-list" style="color: black; font-size: 3rem;"></i></a>
			<div>
				<h1 style="margin-left: 90px"><a href="/blog/main.do" class="text-decoration-none text-black">배상원님의 블로그</a></h1>
			</div>
			<div>
				<c:choose>
					<c:when test="${empty userNick}">
						<a href="/blog/join.do" class="text-black me-3">회원가입</a>
						<a href="/blog/Login.do" class="text-black">로그인</a>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${userGrade == 1}">
								<p>${userNick} 관리자님 환영합니다.^^</p>
								<a href="/blog/logout.do" class="text-black">로그아웃</a>
							</c:when>
							<c:otherwise>
								<p>${userNick} 회원님 반갑습니다.^^</p>
								<a href="/blog/mypage.do" class="text-black me-3">마이페이지</a>
								<a href="/blog/logout.do" class="text-black">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="offcanvas offcanvas-start" id="cate">
			<div class="offcanvas-header mt-5">
				<h5 class="offcanvas-title fw-bold fs-2" id="offcanvasExampleLabel">Category</h5>
				<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul style="list-style-type: none">
					<li class="my-3 fs-5"><a href="/blog/dramaList.do" class="text-decoration-none text-black">#드라마 리뷰</a></li>
					<li class="my-3 fs-5"><a href="#" class="text-decoration-none text-black">#일상</a></li>
					<li class="my-3 fs-5"><a href="#" class="text-decoration-none text-black">#플레이리스트</a></li>
				</ul>
				<div class="dropdown mt-3">
				</div>
			</div>
		</div>
	</header>
</body>
</html>