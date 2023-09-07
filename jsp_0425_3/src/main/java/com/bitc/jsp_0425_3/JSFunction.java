package com.bitc.jsp_0425_3;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
  public static void alertLocation(String msg, String url, JspWriter out) {
    try {
      // location.href = 자바스크립트에서 지원하는 원하는 페이지로 이동 명령
      String script = "" + "<script>" + "   alert('" + msg + "');" + "   location.href='" + url + "';" + "</script>";
    }
    catch (Exception e) {}
  }

  public static void alertBack(String msg, JspWriter out) {
    try {
      String script = "" + "<script>" + "   alert('" + msg + "');" + "   history.back();" + "</script>";
      out.println(script);
    }
    catch (Exception e) {}
  }
}
