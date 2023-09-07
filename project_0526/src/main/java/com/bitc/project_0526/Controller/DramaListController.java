package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDramaDAO;
import com.bitc.project_0526.model.BoardDramaDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/dramaList.do")
public class DramaListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BoardDramaDAO dao = new BoardDramaDAO();

    List<BoardDramaDTO> dramaList = dao.selectBoardList();

    dao.dbClose();

    req.setAttribute("dramaList", dramaList);

    req.getRequestDispatcher("/view/dramaList.jsp").forward(req, resp);
  }
}
