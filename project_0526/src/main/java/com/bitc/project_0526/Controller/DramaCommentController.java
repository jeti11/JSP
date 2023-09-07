package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.CommentDramaDAO;
import com.bitc.project_0526.model.CommentDramaDTO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/blog/dramaComment.do")
public class DramaCommentController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(req.getParameter("idx"));
    HttpSession session = req.getSession();

    CommentDramaDTO dto = new CommentDramaDTO();
    dto.setId(session.getAttribute("userId").toString());
    dto.setComment(req.getParameter("comment"));
    dto.setIdxDrama(idx);

    CommentDramaDAO dao = new CommentDramaDAO();
    int result = dao.writeComment(dto);
    dao.dbClose();

    resp.sendRedirect("/blog/dramaView.do?idx=" + idx);
  }
}
