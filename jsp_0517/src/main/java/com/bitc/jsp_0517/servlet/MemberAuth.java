package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/MemberAuth.mvc")
public class MemberAuth extends HttpServlet {
  private MemberDAO dao;

//  원래는 doGet() 또는 doPost() 에서 실행해야 하는데, 생명주기 배운거 활용한다고 init, service 등에서 구현함
  @Override
  public void init() throws ServletException {
    dao = new MemberDAO(); // dao 객체 생성
    dao.dbOpen(); // 데이터베이스 연결
  }

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    관리자 계정 정보 가져오기
    String admin_id = "nakja";

//    클라이언트에서 전달한 사용자 id, pw 전달 받기
    String id = req.getParameter("id");
    String pass = req.getParameter("pass");

//    DB에서 해당 사용자 정보 가져오기
//    DB의 정보 중 id, pw가 일치하지 않으면 null 반환
    MemberDTO member = dao.selectMember(id, pass);

    String memberName = member.getUserName();

//    DB에 사용자 이름이 있을 경우, 일반 사용자
    if (memberName != null) {
      req.setAttribute("authMessage", memberName + " 회원님 방가방가");
    }
//    DB에 사용자 이름이 없을 경우, 관리자 혹은 비회원
    else {
      if (admin_id.equals(id)) {
        req.setAttribute("authMessage", admin_id + "는 관리자입니다.");
      }
      else {
        req.setAttribute("authMessage", "당신은 회원이 아닙니다.");
      }
    }
//    화면 출력을 위한 view 역할을 하는 jsp 페이지로 이동
    req.getRequestDispatcher("/servlet/MemberAuth.jsp").forward(req, resp);
  }

  @Override
  public void destroy() {
    dao.dbClose();
  }
}























