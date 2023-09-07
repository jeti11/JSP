<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2023-05-21
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>메인 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function () {
      $("#main-drama").on("click", function () {
        location.href="/blog/dramaList.do"
      })
      $("#main-daily").on("click", function () {
        location.href="/blog/dailyList.do"
      })
      $("#main-playlist").on("click", function () {
        location.href="/blog/playList.do"
      })
		})
	</script>
</head>
<body>
	<c:import url="/layout/header.jsp"/>
	<main class="container my-4">
		<div class="row my-5">
			<div class="col-sm-6 mx-auto video-wrap">
				<iframe width="100%" height="388" src="https://www.youtube.com/embed/TJ2FQ-umdGw" title="낭만닥터 김사부 시즌 1-2 모든 에피소드를 60분 만에 결말까지 한 방에 몰아보기🩺 (by.고몽) #낭만닥터김사부3 #drromantic3｜SBSNOW" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
		</div>
		<div class="row my-5">
			<div class="col-sm-6 mx-auto">
				<div class="rounded" style="width: 100%; height: fit-content">
					<form action="/blog/intro.do"method="get">
						<textarea name="intro" id="intro" class="form-control" rows="10">${intro}</textarea>
						<div class="d-flex justify-content-end">
							<c:if test="${userGrade == 1}">
								<button type="submit" class="btn btn-success mt-3">수정하기</button>
							</c:if>
						</div>
					</form>
				</div>
			</div>
			<hr class="mt-5">
		</div>
		<div class="row">
			<div class="col-sm-8 mx-auto">
				<div class="mb-4 text-center">
					<h4>#블로그 인기글</h4>
				</div>
				<div id="hot-drama">
					<div class="row">
						<div class="col-sm">
							<a href="/blog/dramaList.do" class="text-decoration-none text-secondary">#드라마</a>
						</div>
						<div class="col-sm mx-auto d-flex justify-content-end">
							<a href="/blog/dramaList.do" class="text-decoration-none text-secondary">+전체보기</a>
						</div>
					</div>
					<div class="shadow p-3 mb-5 bg-body rounded mt-2" id="main-drama">
						<div class="d-flex justify-content-between">
							<h5 class="mt-3">${dramaHot.getTitle()}</h5>
							<p class="mt-3">view ${dramaHot.getVisits()}</p>
						</div>
						<p class="mt-3">${dramaHot.getContent()}</p>
					</div>
				</div>
				<div id="hot-daily">
					<div class="row">
						<div class="col-sm">
							<a href="/blog/dailyList.do" class="text-decoration-none text-secondary">#일상</a>
						</div>
						<div class="col-sm mx-auto d-flex justify-content-end">
							<a href="/blog/dailyList.do" class="text-decoration-none text-secondary">+전체보기</a>
						</div>
					</div>
					<div class="shadow p-3 mb-5 bg-body rounded mt-2" id="main-daily">
						<div class="d-flex justify-content-between">
							<h5 class="mt-3">${dailyHot.getTitle()}</h5>
							<p class="mt-3">view ${dailyHot.getVisits()}</p>
						</div>
						<p class="mt-3">${dailyHot.getContent()}</p>
					</div>
				</div>
				<div id="hot-playlist">
					<div class="row">
						<div class="col-sm">
							<a href="/blog/dramaList.do" class="text-decoration-none text-secondary">#플레이리스트</a>
						</div>
						<div class="col-sm mx-auto d-flex justify-content-end">
							<a href="/blog/dramaList.do" class="text-decoration-none text-secondary">+전체보기</a>
						</div>
					</div>
					<div class="shadow p-3 mb-5 bg-body rounded mt-2" id="main-playlist">
						<div class="d-flex justify-content-between">
							<h5 class="mt-3">${playHot.getTitle()}</h5>
							<p class="mt-3">view ${playHot.getVisits()}</p>
						</div>
						<p class="mt-3">${playHot.getContent()}</p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:import url="../layout/footer.jsp"/>
</body>
</html>
