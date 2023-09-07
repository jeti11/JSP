package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardPlayDAO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/playDelete.do")
public class PlayDeleteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int idx = Integer.parseInt(req.getParameter("idx"));

    BoardPlayDAO dao = new BoardPlayDAO();
    int result = dao.deletePlay(idx);
    dao.dbClose();

    if (result == 1) {
      resp.sendRedirect("/blog/playList.do");
    }
    else {
      JSFunc.alertBack("글 삭제 중 오류가 발생했습니다.", resp);
    }
  }

}
