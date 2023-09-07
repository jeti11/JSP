package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/servlet/LoginProcess.do")
public class LoginProcess extends HttpServlet {

  private MemberDAO dao;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    문자셋 설정
    req.setCharacterEncoding("UTF-8");

//    클라이언트가 전달한 정보 가져오기
    String userId = req.getParameter("userId");
    String userPw = req.getParameter("userPw");

    try {
//      DAO 객체 생성 및 DB 연결
      dao = new MemberDAO();
      dao.dbOpen();

//      클라이언트가 전달한 사용자 정보가 DB에 있는지 확인
//      DAO의 isMember는 id, pass가 동일한 count를 조회 하는 것이기 때문에 1이 나오면 회원이 존재한다는 뜻
      if (dao.isMember(userId, userPw) == 1) {
        MemberDTO member = dao.selectMember(userId, userPw);

//        관리자 인지 아닌지 확인
        if (member.getUserGrade() == 1) {
//          관리자 정보를 request 객체에 저장
          req.setAttribute("userGrade", "관리자");
        }

//        사용자 정보를 request 객체에 저장
        req.setAttribute("userId", member.getUserId());
        req.setAttribute("userName", member.getUserName());

//        지정한 페이지로 이동
        req.getRequestDispatcher("/servlet/LoginResult.jsp").forward(req, resp);
      }
      else {
//        로그인 오류 메시지를 request 객체에 저장
        req.setAttribute("errMsg", "회원 정보가 없습니다.");
        req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
      }
    }
    catch (Exception e) {
      System.out.println("로그인 시 오류가 발생했습니다.");
      req.setAttribute("errMsg", "로그인 시 오류가 발생했습니다..");

      req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
      e.printStackTrace();
    }
    finally {
      dao.dbClose();
    }
  }
}
