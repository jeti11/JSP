package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.CommentPlayDAO;
import com.bitc.project_0526.model.CommentPlayDTO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/blog/playComment.do")

public class PlayCommentController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int no = Integer.parseInt(req.getParameter("no"));
    int idx = Integer.parseInt(req.getParameter("idx"));

    CommentPlayDAO dao = new CommentPlayDAO();
    int result = dao.commentNoDelete(no);
    dao.dbClose();

    if (result == 1) {
      JSFunc.alertLocation(resp, "선택하신 댓글이 삭제가 완료되었습니다.", "/blog/playView.do?idx=" + idx);
    }
    else {
      JSFunc.alertBack("댓글 삭제 중 오류가 발생했습니다.", resp);
    }
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(req.getParameter("idx"));
    HttpSession session = req.getSession();

    CommentPlayDTO dto = new CommentPlayDTO();
    dto.setId(session.getAttribute("userId").toString());
    dto.setComment(req.getParameter("comment"));
    dto.setIdxPlay(idx);

    CommentPlayDAO dao = new CommentPlayDAO();
    int result = dao.writeComment(dto);
    dao.dbClose();

    resp.sendRedirect("/blog/playView.do?idx=" + idx);
  }
}