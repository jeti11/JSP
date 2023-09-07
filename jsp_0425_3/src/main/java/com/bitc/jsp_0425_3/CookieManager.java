package com.bitc.jsp_0425_3;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
  // 쿠키 생성
  // 클라이언트로 데이터를 전송하기 위한 response 내장 객체와 쿠키 이름, 쿠키 값, 쿠키 유지 시간을 매개변수로 받음
  public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
    Cookie cookie = new Cookie(cName, cValue);
    cookie.setPath("/");
    cookie.setMaxAge(cTime);
    response.addCookie(cookie); // 클라이언트로 전송하기 위해 response 내장 객체에 쿠키 추가
  }

  // 쿠키 읽어오기
  // 클라이언트에서 전송된 데이터를 가지고 있는 request 내장 객체와 쿠키 이름을 매개변수로 받음
  public static String readCookie(HttpServletRequest request, String cName) {
    String cookieValue = "";

    // 모든 쿠키 데이터 가져오기
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie c : cookies) {
        String cookieName = c.getName();
        if (cookieName.equals(cName)) {
          cookieValue = c.getValue();
        }
      }
    }
    return cookieValue;
  }
  // 쿠키정보 삭제
  // 클라이언트에게 데이터를 전달할 response 내장 객체와 쿠키 이름을 매개변수로 받음
  public static void deleteCookie(HttpServletResponse response, String cName) {
    // 미리 만들어 놓은 makeCookie 메소드를 이용하여 쿠키 정보를 삭제
    makeCookie(response, cName, "", 0); // 쿠키 유지시간을 0으로 설정하여 쿠키 정보 삭제
  }
}
