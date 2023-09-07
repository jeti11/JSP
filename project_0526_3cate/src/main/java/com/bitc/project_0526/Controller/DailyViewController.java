package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.*;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/dailyView.do")
public class DailyViewController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int idx = Integer.parseInt(req.getParameter("idx"));
    List<CommentDailyDTO> commentList;

    BoardDailyDAO daoBoard = new BoardDailyDAO();
    CommentDailyDAO daoComment = new CommentDailyDAO();

    BoardDailyDTO dto = daoBoard.viewDaily(idx);
    BoardDailyDTO dtoCommentCount = daoComment.commentCount(idx);
    commentList = daoComment.selectCommentList(idx);

    daoBoard.updateBoardVisits(idx);

    daoBoard.dbClose();
    daoComment.dbClose();

    req.setAttribute("viewDaily", dto);
    req.setAttribute("commentCount", dtoCommentCount);

    if (commentList != null) {
      req.setAttribute("commentList", commentList);
    }
    else {
      JSFunc.alertBack("댓글 작성 중 오류가 발생했습니다.", resp);
    }
    req.getRequestDispatcher("/view/dailyView.jsp").forward(req, resp);
  }
}