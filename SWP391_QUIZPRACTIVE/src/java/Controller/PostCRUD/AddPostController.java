/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.PostCRUD;

import DAO.DAOPost;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet(name = "AddPostController", urlPatterns = {"/addpost"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 3,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11,
        location = "/upload"
)
public class AddPostController extends HttpServlet {

    public final String FAILURE = "addpost";
    public final String SUCCESS = "dashboardlistpost";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("pagepost", "addpost");
       request.getRequestDispatcher("view/marketer/dashboard-addpost.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        DAOPost pdb = new DAOPost();
        String tittle = request.getParameter("title");
        String shortcontent = request.getParameter("shortcontent");
        String content = request.getParameter("message");
        String blog = request.getParameter("blog");
        String subject = request.getParameter("subject");
        
        String fileName = "";
        try {
            Part thumbnailFile = request.getPart("upfile");

            if (thumbnailFile != null && thumbnailFile.getSize() > 0) {
                fileName = Paths.get(thumbnailFile.getSubmittedFileName()).getFileName().toString();
            } else {
                fileName = "broken-image.png";
            }

            if (!Files.exists(Paths.get(fileName))) {
                Files.createDirectory(Paths.get(fileName));
            }
            if (thumbnailFile != null && thumbnailFile.getSize() > 0) {
                thumbnailFile.write(fileName);
            }

            //check subject not -1
            if ("-1".equals(subject) || "-1".equals(blog)) {
                url = FAILURE;
                request.getSession().setAttribute("message", "error");
            } else {
                url = SUCCESS;
                //execute insert post
//                pdb.insertPost(marketerid, tittle, shortcontent, content, Integer.parseInt(blog), Integer.parseInt(subject), "pending", postedPost(), fileName);
                
                
                //test execute
              pdb.insertPost(1, tittle, shortcontent, content, Integer.parseInt(blog), Integer.parseInt(subject), "pending",fileName);
            
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        response.sendRedirect(url);
        return;
    }

    
    //validation short content (250 not null)
    //validation content (not null)

}
