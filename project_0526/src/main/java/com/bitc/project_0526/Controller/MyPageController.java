package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/blog/mypage.do")
public class MyPageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession session = req.getSession();

    String id = session.getAttribute("userId").toString();
    MemberDAO dao = new MemberDAO();
    MemberDTO dto = dao.userInfo(id);
    dao.dbClose();

    CommentDramaDAO daoComment = new CommentDramaDAO();
    List<CommentDramaDTO> commentList = daoComment.selectCommentList2(id);
    daoComment.dbClose();

    req.setAttribute("userNick", dto.getNickname());
    req.setAttribute("commentList", commentList);

    req.getRequestDispatcher("/view/mypage.jsp").forward(req, resp);
  }
}
