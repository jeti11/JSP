<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-11
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>FileUpload04</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <%
      request.setCharacterEncoding("UTF-8");
      
      String path = "C:\\upload";
      
//      클라이언트에서 전송된 request 정보를 가지고 데이터를 분석할 클래스의 객체 생성
      DiskFileUpload upload = new DiskFileUpload();
//      업로드할 파일의 최대 크기 설정
      upload.setFileSizeMax(10 * 1024 * 1024);
//      메모리 크기 설정
      upload.setSizeThreshold(4096);
//      임시 폴더 설정
      upload.setRepositoryPath(path);
  
//      request 정보를 파싱하여 List 타입으로 저장
      List<FileItem> items = upload.parseRequest(request);
//      방식으 통일하기 위해 Iterator 변수에 저장
      Iterator<FileItem> params = items.iterator();
      
      while (params.hasNext()) {
//        List에 저장된 데이터 1개 가져옴
        FileItem item = params.next();
        
//        가져온 정보가 일반 input 필드인지 아니면 file 인지 확인
        if (item.isFormField()) {
//          일반 필드의 이름 가져오기
          String name = item.getFieldName();
//          일반 필드의 값 가져오기
          String value = item.getString("UTF-8");
          out.println(name + " = " + value + "<br>");
        }
        
//        가져온 정보가 file 일 경우
        else {
//          input 태그의 name 속성 을 가져옴
          String fileFieldName = item.getFieldName();
//          파일명 가져오기
          String fileName = item.getName();
          String contentType = item.getContentType();
          
//          파일명만 사용할 수 있도록 파일 경로 제거
          fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
          
//          파일 크기 가져오기 (byte 크기로 가져옴)
          long fileSize = item.getSize();
          
//          서버에 저장할 파일 경로 및 이름 설정
          File file = new File(path + "\\" + fileName);
//          서버의 저장장치에 파일을 쓰기
          item.write(file);
          
          out.print("------------------------<br>");
          out.print("요청 파라미터 이름 : " + fileFieldName + "<br>");
          out.print("저장 파일 이름 : " + fileName + "<br>");
          out.print("파일 콘텐츠 유형 : " + contentType + "<br>");
          out.print("파일 크기 : " + fileSize + "<br>");
        }
      }
    %>
  </div>
</body>
</html>






















