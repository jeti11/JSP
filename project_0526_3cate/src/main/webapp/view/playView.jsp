<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2023-05-24
  Time: 오후 5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
  <title>플레이리스트 글읽기 페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <script>
    $(document).ready(function () {
      $("#btn-delete").on("click", function () {
        alert("삭제가 완료되었습니다.");
      })
    })
  </script>
</head>
<body>
<c:import url="/layout/header.jsp"/>
<main class="container my-4">
  <div class="row">
    <div class="col-sm-8 mx-auto">
      <div class="my-5 text-center">
        <h4>#플레이리스트 게시판</h4>
      </div>
      <div class="row">
        <div class="col-sm">
          <p class="text-secondary">No.${viewPlay.getIdxPlay()} ${viewPlay.getTitle()}</p>
        </div>
        <div class="col-sm d-flex justify-content-end">
          <p class="text-secondary">조회수 : ${viewPlay.getVisits()}</p>
        </div>
      </div>
      <div class="row">
        <div class="col-sm my-3">
          <p class="text-secondary">Posted : ${viewPlay.getPostdate()}</p>
        </div>
        <div class="col-sm d-flex justify-content-end">
          <c:if test="${not empty viewPlay.playOfile}">
            <a href="/blog/playDown.do?ofile=${viewPlay.playOfile}&sfile=${viewPlay.playSfile}&idx=${viewPlay.idxPlay}">${viewPlay.playOfile}<i class="bi bi-file-earmark-arrow-down ms-2" style="font-size: 2rem"></i></a>
          </c:if>
        </div>
      </div>
      
      <div class="my-5 p-2 border rounded">
        <p class="">${viewPlay.getContent()}</p>
      </div>
      <div class="row my-4">
        <div class="col-sm d-flex justify-content-start">
          <a href="/blog/playList.do" class="btn btn-info">목록</a>
        </div>
        <c:if test="${userGrade == 1}">
          <div class="col-sm d-flex justify-content-end">
            <a href="/blog/playEdit.do?idx=${viewPlay.getIdxPlay()}" class="btn btn-primary me-2">수정</a>
            <a href="/blog/playDelete.do?idx=${viewPlay.getIdxPlay()}" class="btn btn-secondary" id="btn-delete">삭제</a>
          </div>
        </c:if>
      </div>
      <div class="border mt-5 mb-2" style="width: 100%"></div>
      <div>
        <a href="/blog/playPass.do?idx=${viewPlay.getIdxPlay()}" class="btn"><i class="bi bi-heart" style="font-size: 2rem"></i></a>
        <span>${viewPlay.getRespects()}</span>
        <span class="btn ms-3"><i class="bi bi-chat-left-dots" style="font-size: 2rem"></i></span>
        <span>${commentCount.getComments()}</span>
      </div>
    </div>
    <div class="col-sm-6 mx-auto">
      <form action="/blog/playComment.do" method="post">
        <c:choose>
          <c:when test="${empty commentList}">
            <p>댓글이 없습니다.</p>
          </c:when>
          <c:otherwise>
            <c:forEach items="${commentList}" var="item" varStatus="loop">
              <div class="my-4">
                <div class="d-flex justify-content-between">
                  <p>${item.getId()}</p>
                  <p>${item.getPostdate()}</p>
                </div>
                <div class="input-group">
                  <input type="text" class="form-control rounded-3", id="user-comment" name="userComment" value="${item.getComment()}" readonly>
                  <c:if test="${userId == item.getId()}">
                    <a href="/blog/playComment.do?no=${item.getNo()}&idx=${item.getIdxPlay()}" id="btn-comment-delete"><i class="bi bi-x-square-fill ms-2" style="font-size: 2rem"></i></a>
                  </c:if>
                </div>
              </div>
            </c:forEach>
          </c:otherwise>
        </c:choose>
        <c:if test="${userGrade == 2 || userGrade == 1}">
          <div class="input-group my-3">
            <input type="text" class="form-control" name="comment" placeholder="댓글을 입력하세요">
            <input type="hidden" name="idx" value="${viewPlay.getIdxPlay()}">
            <button type="submit" class="btn btn-outline-success" id="button-addon2">댓글 작성</button>
          </div>
        </c:if>
      </form>
    </div>
  </div>
</main>
<c:import url="/layout/footer.jsp"/>
</body>
</html>
