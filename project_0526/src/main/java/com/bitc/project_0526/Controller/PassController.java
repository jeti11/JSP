package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDramaDAO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/blog/dramaPass.do")
public class PassController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession session = req.getSession();
    if (session.getAttribute("userId") != null) {
      int idx = Integer.parseInt(req.getParameter("idx"));

      BoardDramaDAO dao = new BoardDramaDAO();
      int result = dao.updateBoardRespects(idx);
      dao.dbClose();

      if (result == 1) {
        resp.sendRedirect("/blog/dramaView.do?idx=" + idx);
      }
      else {
        JSFunc.alertBack("좋아요 업데이트 중 오류가 발생했습니다.", resp);
      }
    }
    else {
      JSFunc.alertLocation(resp, "회원만 이용가능한 기능입니다. 로그인 페이지로 이동합니다.", "/blog/Login.do");
    }
  }
}
