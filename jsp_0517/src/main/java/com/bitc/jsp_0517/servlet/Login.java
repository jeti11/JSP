package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/login.two")
public class Login extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String uri = req.getRequestURI();
    int lastSlash = uri.lastIndexOf("/");
    String commandStr = uri.substring(lastSlash);

    req.setAttribute("uri", uri);
    req.setAttribute("commandStr", commandStr);
    req.setAttribute("resultValue", "<h4>로그인 (개별 서블릿)</h4>");

    // View 처리를 위해서 지정한 jsp 파일로 페이지 이동
    req.getRequestDispatcher("/servlet/FrontController.jsp").forward(req, resp);
  }
}
