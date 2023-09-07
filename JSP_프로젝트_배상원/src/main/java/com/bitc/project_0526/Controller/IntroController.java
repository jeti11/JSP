package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.IntroDAO;
import com.bitc.project_0526.model.IntroDTO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/intro.do")
public class IntroController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int result = 0;

    String intro = req.getParameter("intro").toString();

    IntroDAO dao = new IntroDAO();
    result = dao.introWrite(intro);

    if (result == 1) {
      resp.sendRedirect("/blog/main.do");
    }
    else {
      JSFunc.alertBack("소개글 수정 중 오류가 발생했습니다.", resp);
      resp.sendRedirect("/blog/main.do");
    }
  }
}
