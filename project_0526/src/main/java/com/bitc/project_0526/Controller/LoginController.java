package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.MemberDAO;
import com.bitc.project_0526.model.MemberDTO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/blog/Login.do")
public class LoginController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int result = 0;

    String userId = req.getParameter("userId");
    String userPw = req.getParameter("userPw");

    MemberDTO dto;

    MemberDAO dao = new MemberDAO();
    result = dao.isMember(userId, userPw);

    if (result == 1) {
      dto = dao.login(userId, userPw);
      dao.dbClose();

      HttpSession session = req.getSession();
      session.setAttribute("userId", dto.getId());
      session.setAttribute("userPw", dto.getPass());
      session.setAttribute("userNick", dto.getNickname());
      session.setAttribute("userGrade", dto.getGrade());

      resp.sendRedirect("/blog/main.do");
    }
    else {
      dao.dbClose();
      JSFunc.alertBack("아이디 비밀번호가 일치하지 않습니다. 다시 입력해주세요", resp);
    }
  }
}
