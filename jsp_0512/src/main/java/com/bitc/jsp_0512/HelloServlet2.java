package com.bitc.jsp_0512;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet2 extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    request 영역에 message라는 이름으로 데이터 추가
    req.setAttribute("message", "Hello Servlet2..!!");
//    지정한 페이지(HelloServlet2.jsp)로 이동
//    JSP 파일을 뷰로써 사용하고 있다(주소창에는 servlet 주소로 되어있지만 화면은 JSP 파일이 출력됨
    req.getRequestDispatcher("/HelloServlet2.jsp").forward(req, resp);
  }
}
