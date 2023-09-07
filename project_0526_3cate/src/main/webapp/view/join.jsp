<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2023-05-23
  Time: 오후 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function () {
      $("#btn-cancel").on("click", function () {
        history.back();
      })
		})
	</script>
</head>
<body>
	<c:import url="/layout/header.jsp"/>
	<main class="container my-4">
		<div class="row">
			<div class="col-sm-6 mx-auto">
				<div class="my-5 text-center">
					<h4>회원가입</h4>
				</div>
				<div class="border p-3">
					<form action="/blog/join.do"method="post">
						<div class="my-4">
							<label for="user-id" class="form-label">아이디</label>
							<input type="text" id="user-id" class="form-control" name="userId" placeholder="아이디를 입력하세요">
						</div>
						<div class="my-4">
							<label for="user-pw" class="form-label">비밀번호</label>
							<input type="password" id="user-pw" class="form-control" name="userPw" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="my-4">
							<label for="user-pw-check" class="form-label">비밀번호 확인</label>
							<input type="password" id="user-pw-check" class="form-control" name="userPwCheck" placeholder="비밀번호를 한번 더 입력하세요">
						</div>
						<div class="my-4">
							<label for="user-nick" class="form-label">닉네임</label>
							<input type="text" id="user-nick" class="form-control" name="userNick" placeholder="활동하실 닉네임을 설정하세요">
						</div>
						<div class="d-grid gap-3 mt-4">
							<button type="submit" class="btn btn-primary">가입하기</button>
							<button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<c:import url="/layout/footer.jsp"/>
</body>
</html>
