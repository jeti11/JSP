package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardPlayDAO;
import com.bitc.project_0526.model.BoardPlayDTO;
import com.bitc.project_0526.model.BoardDramaDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/playList.do")
public class PlayListController extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BoardPlayDAO dao = new BoardPlayDAO();

    List<BoardPlayDTO> playList = dao.selectBoardList();

    dao.dbClose();

    req.setAttribute("playList", playList);

    req.getRequestDispatcher("/view/playList.jsp").forward(req, resp);
  }
}
