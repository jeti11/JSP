package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDramaDAO;
import com.bitc.project_0526.util.FileUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/dramaDown.do")
public class DramaDownController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String ofile = req.getParameter("ofile");
    String sfile = req.getParameter("sfile");
    int postIdx = Integer.parseInt(req.getParameter("idx"));

    FileUtils.download(req, resp, "c:\\upload_blog", sfile, ofile);
  }
}
