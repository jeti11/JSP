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
			<div class="col-sm-5 mx-auto">
				<div class="my-5 text-center">
					<h4>마이페이지</h4>
				</div>
				<div class="my-5 text-center">
					<h5><%=request.getAttribute("userNick")%> 회원님 방문해주셔서 감사합니다.</h5>
					<p>회원정보 수정을 원하신다면 아래 수정 버튼을 클릭해주세요</p>
					<a href="/blog/memberEdit.do?id=${userId}" class="btn btn-success">회원정보 수정</a>
				</div>
			</div>
		</div>
		<div class="row my-4">
			<div class="col-sm-6 mx-auto">
				<p class="fw-semibold">나의 활동</p>
				<c:choose>
					<c:when test="${empty commentList}">
						<p>활동 내역이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${commentList}" var="item" varStatus="loop">
							<div class="shadow p-2 mb-5 bg-body rounded mt-2" id="main-drama">
								<div class="d-flex justify-content-between">
									<p class="mt-3">${item.getPostdate()}</p>
									<p class="mt-3">${item.getCate()}</p>
								</div>
								<a href="/blog/dramaView.do?idx=${item.getIdxDrama()}" class="mt-3 text-decoration-none text-black">${item.getComment()}</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>
	<c:import url="../layout/footer.jsp"/>
</body>
</html>
