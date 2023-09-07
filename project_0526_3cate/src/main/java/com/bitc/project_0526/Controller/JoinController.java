package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.MemberDAO;
import com.bitc.project_0526.model.MemberDTO;
import com.bitc.project_0526.util.JSFunc;
import com.mysql.cj.xdevapi.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/blog/join.do")
public class JoinController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getRequestDispatcher("/view/join.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int isMemberResult = 0;
    int result = 0;
    req.setCharacterEncoding("UTF-8");
    String userId = req.getParameter("userId");
    String userPw = req.getParameter("userPw");
    String userPwCheck = req.getParameter("userPwCheck");
    String userNick = req.getParameter("userNick");

    if (userPw.equals(userPwCheck) ) {
      MemberDTO member = new MemberDTO();
      member.setId(req.getParameter("userId"));
      member.setPass(req.getParameter("userPw"));
      member.setNickname(req.getParameter("userNick"));

      MemberDAO dao = new MemberDAO();
      isMemberResult = dao.checkId(userId);

      if (isMemberResult != 1) {
        result = dao.join(member);

        MemberDTO dto2 = dao.userInfo(userId);
        dao.dbClose();

        HttpSession session = req.getSession();
        session.setAttribute("userId", userId);
        session.setAttribute("userNick", userNick);
        session.setAttribute("userGrade", dto2.getGrade());

        if (result == 1) {
          resp.sendRedirect("/blog/main.do");
        }
      }
      else {
        JSFunc.alertBack("이미 존재하는 아이디 입니다. 다시 입력해주세요", resp);
      }
    }
    else {
      JSFunc.alertBack("비밀번호가 일치하지 않습니다. 다시 입력해주세요", resp);
    }
  }
}
