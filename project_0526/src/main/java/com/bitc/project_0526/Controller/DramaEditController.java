package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDramaDAO;
import com.bitc.project_0526.model.BoardDramaDTO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/dramaEdit.do")
public class DramaEditController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int idx = Integer.parseInt(req.getParameter("idx"));
    BoardDramaDAO dao = new BoardDramaDAO();

    BoardDramaDTO dto = dao.viewDrama(idx);
    dao.dbClose();

    req.setAttribute("editDrama", dto);

    req.getRequestDispatcher("/view/dramaEdit.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    int idx = Integer.parseInt(req.getParameter("idx"));
    BoardDramaDTO dto = new BoardDramaDTO();
    dto.setIdxDrama(idx);
    dto.setTitle(req.getParameter("title"));
    dto.setContent(req.getParameter("content"));


    BoardDramaDAO dao = new BoardDramaDAO();
    int result = dao.editDrama(dto);
    dao.dbClose();

    if (result == 1) {
      resp.sendRedirect("/blog/dramaList.do");
    }
    else {
      JSFunc.alertBack("글 수정 중 오류가 발생했습니다.", resp);
    }
  }
}
