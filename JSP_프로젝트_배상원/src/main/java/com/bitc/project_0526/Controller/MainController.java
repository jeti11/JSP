package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.*;

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

    BoardDramaDAO daoDramaHot = new BoardDramaDAO();
    BoardDramaDTO dramaHot = daoDramaHot.selectDramaHot();

    BoardDailyDAO daoDailyHot = new BoardDailyDAO();
    BoardDailyDTO dailyHot = daoDailyHot.selectDailyHot();

    BoardPlayDAO daoPlayHot = new BoardPlayDAO();
    BoardPlayDTO playHot = daoPlayHot.selectPlayHot();

    dao.dbClose();
    daoDramaHot.dbClose();
    daoDailyHot.dbClose();
    daoPlayHot.dbClose();

    String intro = dto.getIntro();

    req.setAttribute("intro", intro);
    req.setAttribute("dramaHot", dramaHot);
    req.setAttribute("dailyHot", dailyHot);
    req.setAttribute("playHot", playHot);
    req.getRequestDispatcher("/view/main.jsp").forward(req, resp);
  }
}
