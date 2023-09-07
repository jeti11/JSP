package com.bitc.project_0526.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JSFunc {
  public static void alertBack(String msg, HttpServletResponse resp) {
    try {
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();

      String js = "<script>";
      js += "alert('" + msg + "');";
      js += "history.back();";
      js += "</script>";

      out.println(js);
    }
    catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public static void alertLocation(HttpServletResponse resp, String msg, String url) {
    try {
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();

      String js = "<script>";
      js += "alert('" + msg + "');";
      js += "location.href = '" + url + "' ";
      js += "</script>";

      out.println(js);
    }
    catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
}
