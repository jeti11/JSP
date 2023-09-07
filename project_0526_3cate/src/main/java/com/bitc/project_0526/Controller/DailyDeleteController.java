package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDailyDAO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/dailyDelete.do")
public class DailyDeleteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int idx = Integer.parseInt(req.getParameter("idx"));

    BoardDailyDAO dao = new BoardDailyDAO();
    int result = dao.deleteDaily(idx);
    dao.dbClose();

    if (result == 1) {
      resp.sendRedirect("/blog/dailyList.do");
    }
    else {
      JSFunc.alertBack("글 삭제 중 오류가 발생했습니다.", resp);
    }
  }

}
