package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mvcBoard/pass.do")
public class PassController extends HttpServlet {
//  삭제 및 수정을 위해서 비밀번호를 입력받기 위한 view 페이지
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setAttribute("mode", req.getParameter("mode"));
    req.setAttribute("idx", req.getParameter("idx"));
    req.getRequestDispatcher("/view/pass.jsp").forward(req, resp);
  }

//  입력받은 비밀번호를 확인하고, 삭제 및 수정을 실행하는 페이지
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    1. 클라이언트에서 전달된 비밀번호, mode, 글번호 가져오기
    String postPass = req.getParameter("postPass");
    int postIdx = Integer.parseInt(req.getParameter("postIdx"));
    String postMode = req.getParameter("postMode");

//    2. 데이터베이스 연결
    MVCBoardDAO dao = new MVCBoardDAO();

//    3. 글번호를 기준으로 해당 게시물의 비밀번호와 사용자가 입력한 비밀번호가 같은지 확인 (같으면 true, 아니면 false 반환)
    boolean confirmed = dao.equalsPassword(postIdx, postPass);
    dao.dbClose();

//    4. 삭제 및 수정
    if (confirmed) {
//        수정 페이지로 이동
      if (postMode.equals("edit")) {
//        비밀번호를 EditController로 전달
//        HttpSession : 세션 영역에 데이터를 저장하기 위한 클래스, request 객체에서 세션 정보를 가져와야 함
//        HttpSession session = req.getSession();
//        session.setAttribute("postPass", postPass);
        resp.sendRedirect("/mvcBoard/Edit.do?idx=" + postIdx);
      }
//      삭제 실행
      else if (postMode.equals("delete")) {
        dao = new MVCBoardDAO();
        int result = dao.deleteBoard(postIdx);
        dao.dbClose();


//    5. 화면이동 (list페이지로 이동)
        if (result == 1) {
//          삭제 메시지 출력 및 list 페이지로 이동
          System.out.println("***** 글삭제가 완료되었습니다. *****");
          resp.sendRedirect("/mvcBoard/List.do");
        }
        else {
          resp.sendRedirect("/mvcBoard/Pass.do");
        }
      }
    }
    else {
//      String js = "<script>";
//      js += "alert('비밀번호가 틀렸습니다.');";
//      js += "history.back();";
//      js += "</script>";
//
////      JSP에서는 resp내장객체와, PrintWriter 클래스가 있기 때문에 out.println()바로 되지만
////      자바는 없기때문에 만들어줘야함
//      resp.setContentType("text/html;charset=UTF-8");
//      PrintWriter out = resp.getWriter();
//      out.println(js);

      //      자바스크립트를 출력할 클래스를 사용할 예정
      JSFunc.alertBack("비밀번호가 다릅니다.", resp);

    }
  }
}
