<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2023-05-21
  Time: 오후 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>로그인 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:import url="/layout/header.jsp"/>
	<main class="container my-4">
		<div class="row">
			<div class="col-sm-5 mx-auto">
				<div class="my-5 text-center">
					<h4>로그인</h4>
				</div>
				<div class="">
					<form action="/blog/Login.do" method="post">
						<div class="form-floating my-3">
							<input type="text" id="user-id" class="form-control" name="userId" placeholder="아이디를 입력하세요">
							<label for="user-id" class="form-label">ID : </label>
						</div>
						<div class="form-floating my-3">
							<input type="password" id="user-pw" class="form-control" name="userPw" placeholder="비밀번호를 입력하세요">
							<label for="user-pw" class="form-label">PW : </label>
						</div>
						<div class="d-grid gap-3 mt-4">
							<button type="submit" class="btn btn-primary">로그인</button>
							<a href="/blog/join.do" class="btn btn-secondary">회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<c:import url="/layout/footer.jsp"/>
</body>
</html>