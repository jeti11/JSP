package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDramaDAO;
import com.bitc.project_0526.model.BoardDramaDTO;
import com.bitc.project_0526.model.IntroDAO;
import com.bitc.project_0526.model.IntroDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/main.do")
public class MainController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    IntroDAO dao = new IntroDAO();
    IntroDTO dto = dao.selectIntro();
    BoardDramaDAO daoHot = new BoardDramaDAO();
    BoardDramaDTO dramaHot = daoHot.selectDramaHot();

    dao.dbClose();
    daoHot.dbClose();

    String intro = dto.getIntro();

    req.setAttribute("intro", intro);
    req.setAttribute("dramaHot", dramaHot);
    req.getRequestDispatcher("/view/main.jsp").forward(req, resp);
  }
}
