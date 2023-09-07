<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-04
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
  <div class="container my-4">
    <h3>순수 JSP로 구구단 출력</h3>
    <table border="1">
      <%
        for (int dan = 2; dan < 10; dan++) {
      %>
      <tr>
        <%
          for (int su = 1; su <= 9; su++) {
        %>
        <td>
          <%=dan%> * <%=su%> = <%=dan * su%>
        </td>
        <%
          }
        %>
      </tr>
      <%
        }
      %>
    </table>
    <br>
    <hr>
    <br>
    
    <h3>JSTL로 구구단 출력</h3>
    <table border="1">
      <c:forEach begin="2" end="9" var="dan">
        <tr>
          <c:forEach begin="1" end="9" var="su">
            <td>
              ${dan} * ${su} = ${dan * su}
            </td>
          </c:forEach>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>
