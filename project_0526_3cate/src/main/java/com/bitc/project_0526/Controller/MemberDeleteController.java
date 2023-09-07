package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.CommentDailyDAO;
import com.bitc.project_0526.model.CommentDramaDAO;
import com.bitc.project_0526.model.MemberDAO;
import com.bitc.project_0526.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/blog/memberDelete.do")
public class MemberDeleteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String id = req.getParameter("id");

    MemberDAO dao = new MemberDAO();
    int result = dao.memberDelete(id);
    dao.dbClose();

    if (result == 1) {
      HttpSession session = req.getSession();
      session.invalidate();

      CommentDramaDAO dramaCMD = new CommentDramaDAO();
      int result2 = dramaCMD.dramaCommentMemberDelete(id);
      dramaCMD.dbClose();

      CommentDailyDAO dailyCMD = new CommentDailyDAO();
      int result3 = dailyCMD.dailyCommentMemberDelete(id);
      dailyCMD.dbClose();

      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();

      JSFunc.alertLocation(resp, "회원 정보가 삭제되었습니다." ,"/blog/main.do");
//      String js = "<script>";
//      js += "alert('회원 정보가 삭제되었습니다.');";
//      js += "</script>";
//      out.println(js);
//
//      resp.sendRedirect("/blog/main.do");
    }
    else {
      JSFunc.alertBack("회원 정보 삭제 중 오류가 발생했습니다.", resp);
    }
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession session = req.getSession();
    String id = session.getAttribute("userId").toString();
    String pw = req.getParameter("userPw");

    MemberDAO dao = new MemberDAO();
    int result = dao.isMember(id, pw);
    dao.dbClose();

    if (result == 1) {
      resp.sendRedirect("/blog/memberDelete.do?id=" + id);
    }
    else {
      JSFunc.alertBack("비밀번호가 틀립니다. 다시 입력해주세요", resp);
    }
  }
}
