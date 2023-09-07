package com.bitc.project_0526.Controller;

import com.bitc.project_0526.model.BoardDramaDAO;
import com.bitc.project_0526.model.BoardDramaDTO;
import com.bitc.project_0526.util.FileUtils;
import com.bitc.project_0526.util.JSFunc;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/blog/dramaWrite.do")
public class DramaWriteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    req.getRequestDispatcher("/view/dramaWrite.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    String saveDir = "c:\\upload_blog";
    int maxSize = 10 * 1024 * 1024;

    MultipartRequest mr = FileUtils.uploadFile(req, saveDir, maxSize);

    if (mr == null) {
      JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "/blog/dramaWrite.do");
      return;
    }

    BoardDramaDTO dto = new BoardDramaDTO();
    dto.setCate(mr.getParameter("cate"));
    dto.setTitle(mr.getParameter("title"));
    dto.setContent(mr.getParameter("content"));

    String fileName = mr.getFilesystemName("file");

    if (fileName != null) {
      String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
      String ext = fileName.substring(fileName.lastIndexOf("."));
      String newFileName = now + ext;

      File oldFile = new File(saveDir + File.separator + fileName);
      File newFile = new File(saveDir + File.separator + newFileName);
      oldFile.renameTo(newFile);

      dto.setDramaOfile(fileName);
      dto.setDramaSfile(newFileName);
    }

    BoardDramaDAO dao = new BoardDramaDAO();
    int result = dao.writeDrama(dto);
    dao.dbClose();

    if (result == 1) {
      resp.sendRedirect("/blog/dramaList.do");
    }
    else {
      JSFunc.alertBack("글 쓰기 중 오류가 발생했습니다.", resp);
    }
  }
}
