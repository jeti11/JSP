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

@WebServlet("/blog/dramaWrite.do")
public class DramaWriteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    req.getRequestDispatcher("/view/dramaWrite.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    BoardDramaDTO dto = new BoardDramaDTO();
    dto.setCate(req.getParameter("cate"));
    dto.setTitle(req.getParameter("title"));
    dto.setContent(req.getParameter("content"));

    BoardDramaDAO dao = new BoardDramaDAO();
    int result = dao.writeDrama(dto);
    dao.dbClose();

    if (result == 1) {
      resp.sendRedirect("/blog/dramaList.do");
    }
    else {
      JSFunc.alertBack("글 쓰기 중 오류가 발생했습니다.", resp);
    }
  }
}
