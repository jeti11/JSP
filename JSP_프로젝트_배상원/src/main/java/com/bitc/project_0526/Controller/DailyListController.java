package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDailyDAO;
import com.bitc.project_0526.model.BoardDailyDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/dailyList.do")
public class DailyListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BoardDailyDAO dao = new BoardDailyDAO();
    int totalCount = dao.dailyTotalCount();
    int pageSize = 10;
    int blockPage = 5;
    int totalPage = (int)Math.ceil((double) totalCount / pageSize);

    int pageNum = 1;
    String pageTemp = req.getParameter("pageNum");

    if (pageTemp != null && !pageTemp.equals("")) {
      pageNum = Integer.parseInt(pageTemp);
    }

    int start = (pageNum - 1) * pageSize + 1;
    int end = pageNum * pageSize;

    List<BoardDailyDTO> dailyList = dao.selectList(start, pageSize);
    dao.dbClose();



    req.setAttribute("pageNum", pageNum);
    req.setAttribute("blockPage", blockPage);
    req.setAttribute("totalPage", totalPage);
    req.setAttribute("end", end);

    req.setAttribute("dailyList", dailyList);

    req.getRequestDispatcher("/view/dailyList.jsp").forward(req, resp);
  }
}
