
package Controller.PostCRUD;

import DAO.DAOPost;
import Entities.Post;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdatePostController", urlPatterns = {"/updatepost"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 3,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdatePostController extends HttpServlet {

    public final String NOTKNOW = "dashboardlistpost";
    public final String KNOW = "view/marketer/dashboard-editpost.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String post_id = request.getParameter("id") == null ? "" : request.getParameter("id");
        if (post_id.isEmpty()) {
            response.sendRedirect(NOTKNOW);
        } else {
            try {
                DAOPost pdb = new DAOPost();
//                Slider s = sdb.getById(Integer.parseInt(slider_id));
                Post p = pdb.getById(Integer.parseInt(post_id));

                request.setAttribute("post", p);
                request.getSession().setAttribute("id", post_id);
                request.setAttribute("pagepost", "updatepost");
            } catch (Exception e) {
                response.getWriter().print(e.getMessage());
            }
            request.getRequestDispatcher(KNOW).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        DAOPost pdb = new DAOPost();
        String post_id = (String) request.getSession().getAttribute("id");
        String tittle = request.getParameter("title");
        String shortcontent = request.getParameter("shortcontent");
        String content = request.getParameter("message");
        String blog = request.getParameter("blog");
        String subject = request.getParameter("subject");
        String thumbnail = request.getParameter("upfilehide");

        try {
            String fileimg = "";
            Part part = request.getPart("upfile");
            String realPath = getServletContext().getRealPath("/upload");

            if (part != null && part.getSize() > 0) {
                fileimg = realPath + "\\" + part.getSubmittedFileName();
                thumbnail = part.getSubmittedFileName();
            } else {
                fileimg = realPath + "\\" + thumbnail;
            }

            Path directoryPath = Paths.get(realPath);
            if (!Files.isDirectory(directoryPath)) {
                Files.createDirectory(directoryPath);
            }
            if (part != null && part.getSize() > 0) {
                File file = new File(fileimg);
                if (!file.exists()) {
                    InputStream fileContent = part.getInputStream();
                    Files.copy(fileContent, Paths.get(fileimg));
                }
            }

            //check subject or blog not -1
            if ("-1".equals(subject) || "-1".equals(blog)) {
                url = KNOW;
                request.setAttribute("message", "error");
            } else {
                url = KNOW;
                pdb.updatePost(tittle, shortcontent, content, Integer.parseInt(blog), Integer.parseInt(subject), "pending", TimeCurrent(), thumbnail, Integer.parseInt(post_id));
                request.setAttribute("notification", "success");

            }
            //luu tam cac gia tri sau khi da update thanh cong !
            Post p = pdb.getById(Integer.parseInt(post_id));
            request.setAttribute("post", p);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    public Date TimeCurrent() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        return date;
    }

}
