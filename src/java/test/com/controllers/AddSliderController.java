package test.com.controllers;

import com.sun.org.slf4j.internal.LoggerFactory;
import test.com.daos.DAOSlider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 3,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)

public class AddSliderController extends HttpServlet {
    private static final com.sun.org.slf4j.internal.Logger logger = LoggerFactory.getLogger(AddSliderController.class);

    public final String FAILURE = "addslider";
    public final String SUCCESS = "listslider";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("pageslider", "addslider");
        request.getRequestDispatcher("view/marketer/dashboard-addslider.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException {
        String url = "";
        DAOSlider sdb = new DAOSlider();
        String content = request.getParameter("content");
        String note = request.getParameter("note");
        String subject = request.getParameter("subject");
        String status = request.getParameter("status");

        String fileName = "";
        try {
            Part part = request.getPart("upfile");
            String realPath = getServletContext().getRealPath("/uploadslider");

            if (part != null && part.getSize() > 0) {
                fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            } else {
                fileName = "broken-image.png";
            }

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            if (part != null && part.getSize() > 0) {
                part.write(realPath + "/" + fileName);
            }

            //check subject not -1
            if ("-1".equals(subject)) {
                url = FAILURE;
                request.getSession().setAttribute("message", "error");
                response.sendRedirect(url);
            } else {
                url = SUCCESS;
                //execute insert
                sdb.insertSilder(Integer.parseInt(subject), fileName, content, note, status.equals("1") ? true : false);
                response.sendRedirect(url);

            }
        } catch (Exception e) {
           logger.error(e.getMessage());
        }
//          response.sendRedirect(url);
//          return;
    }

}
