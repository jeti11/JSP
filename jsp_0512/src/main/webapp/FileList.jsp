<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-12
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.bitc.jsp_0512.dto.MyfileDTO" %>
<%@ page import="com.bitc.jsp_0512.dao.MyfileDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>FileUpload</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h2>DB에 등록된 파일 목록 보기</h2>
    <a href="FileUploadMain.jsp">파일 등록하기</a>
    <%
      List<MyfileDTO> fileList = null;
      
      MyfileDAO dao = new MyfileDAO();
      
      dao.open();
      fileList = dao.myFileList();
      dao.close();
    %>
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>idx</th>
        <th>작성자</th>
        <th>제목</th>
        <th>카테고리</th>
        <th>원본 파일명</th>
        <th>사본 파일명</th>
        <th>작성일</th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <%
        for (MyfileDTO file : fileList) {
      %>
      <tr>
        <td><%=file.getIdx()%></td>
        <td><%=file.getName()%></td>
        <td><%=file.getTitle()%></td>
        <td><%=file.getCate()%></td>
        <td><%=file.getOfile()%></td>
        <td><%=file.getSfile()%></td>
        <td><%=file.getPostdate()%></td>
        <td><a href='Download.jsp?oName=<%=URLEncoder.encode(file.getOfile(), "UTF-8")%>&sName=<%=URLEncoder.encode(file.getSfile(), "UTF-8")%>'>[다운로드]</a></td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>
</body>
</html>



















