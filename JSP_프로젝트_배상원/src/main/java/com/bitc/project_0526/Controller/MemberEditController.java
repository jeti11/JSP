package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.MemberDAO;
import com.bitc.project_0526.model.MemberDTO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/memberEdit.do")
public class MemberEditController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String id = req.getParameter("id");

    MemberDAO dao = new MemberDAO();
    MemberDTO dto = dao.userInfo(id);
    dao.dbClose();

    req.setAttribute("userInfo", dto);
    req.getRequestDispatcher("/view/memberEdit.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    MemberDTO dto = new MemberDTO();

    dto.setId(req.getParameter("userId"));
    dto.setPass(req.getParameter("userPw"));
    dto.setNickname(req.getParameter("userNick"));

    MemberDAO dao = new MemberDAO();
    int result = dao.memberUpdate(dto);
    dao.dbClose();

    JSFunc.alertLocation(resp, "회원 정보 수정이 완료되었습니다. 마이페이지로 돌아갑니다.", "/blog/mypage.do");
  }
}
