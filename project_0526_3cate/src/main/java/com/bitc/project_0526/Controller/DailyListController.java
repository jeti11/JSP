package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDailyDAO;
import com.bitc.project_0526.model.BoardDailyDTO;
import com.bitc.project_0526.model.BoardDramaDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/dailyList.do")
public class DailyListController extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BoardDailyDAO dao = new BoardDailyDAO();

    List<BoardDailyDTO> dailyList = dao.selectBoardList();

    dao.dbClose();

    req.setAttribute("dailyList", dailyList);

    req.getRequestDispatcher("/view/dailyList.jsp").forward(req, resp);
  }
}
