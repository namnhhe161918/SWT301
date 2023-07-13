/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.SliderCRUD;

import DAO.DAOSlider;
import Entities.Slider;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateSliderController", urlPatterns = {"/updateslider"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 3,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateSliderController extends HttpServlet {

    public final String NOTKNOW = "listslider";
    public final String KNOW = "view/marketer/dashboard-editslider.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String slider_id = request.getParameter("id") == null ? "" : request.getParameter("id");
        if (slider_id.isEmpty()) {
            response.sendRedirect(NOTKNOW);
        } else {
            try {
                DAOSlider sdb = new DAOSlider();
                Slider s = sdb.getById(Integer.parseInt(slider_id));

                request.setAttribute("slider", s);
                request.getSession().setAttribute("id", slider_id);
                request.setAttribute("pageslider", "updateslider");
            } catch (Exception e) {
                response.getWriter().print(e.getMessage());
            }
            request.getRequestDispatcher(KNOW).forward(request, response);
        }
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "";
        DAOSlider sdb = new DAOSlider();
        String slider_id = (String) request.getSession().getAttribute("id");
        String content = request.getParameter("content");
        String note = request.getParameter("note");
        String subject = request.getParameter("subject");
        String status = request.getParameter("status");

        String fileName = request.getParameter("upfilehide");;

        try {
            String fileimg = "";
            Part part = request.getPart("upfile");
            String realPath = getServletContext().getRealPath("/uploadslider");

            if (part != null && part.getSize() > 0) {
                fileimg = realPath + "\\" + part.getSubmittedFileName();
                fileName = part.getSubmittedFileName();
            } 
            else{
                fileimg = realPath + "\\" + fileName;
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

            //check subject not -1
            if ("-1".equals(subject)) {
                url = KNOW;
                request.setAttribute("message", "error");
            } else {
                url = KNOW;
                //execute insert
                sdb.updateSlider(Integer.parseInt(slider_id), Integer.parseInt(subject), fileName, content, note, status == "1" ? true : false);

                //session temporary
                Slider s = sdb.getById(Integer.parseInt(slider_id));

                request.setAttribute("slider", s);

                request.setAttribute("notification", "success");
            }
            request.getRequestDispatcher(KNOW).forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
 
}

