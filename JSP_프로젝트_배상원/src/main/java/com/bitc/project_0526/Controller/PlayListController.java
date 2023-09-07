package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardPlayDAO;
import com.bitc.project_0526.model.BoardPlayDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/playList.do")
public class PlayListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BoardPlayDAO dao = new BoardPlayDAO();
    int totalCount = dao.playTotalCount();
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

    List<BoardPlayDTO> playList = dao.selectList(start, pageSize);
    dao.dbClose();



    req.setAttribute("pageNum", pageNum);
    req.setAttribute("blockPage", blockPage);
    req.setAttribute("totalPage", totalPage);
    req.setAttribute("end", end);

    req.setAttribute("playList", playList);

    req.getRequestDispatcher("/view/playList.jsp").forward(req, resp);
  }
}
