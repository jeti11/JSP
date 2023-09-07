<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-26
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>비밀번호 확인 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
	<c:import url="/layout/header.jsp"/>
	<main class="container my-4">
		<div class="row">
			<div class="col-sm-6 mx-auto">
				<div class="my-5 text-center">
					<h4>비밀번호 확인</h4>
				</div>
				<div>
					<p>회원 탈퇴를 위한 비밀번호 검증이 필요합니다. 회원님의 비밀번호를 입력해주세요</p>
				</div>
				<div class="border rounded p-3">
					<form action="/blog/memberDelete.do" method="post">
						<div class="my-2">
							<label for="user-pw" class="form-label">비밀번호</label>
							<input type="password" id="user-pw" class="form-control" name="userPw" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="d-grid gap-3 my-3">
							<button type="submit" class="btn btn-primary">확인</button>
							<button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<c:import url="../layout/footer.jsp"/>
</body>
</html>
