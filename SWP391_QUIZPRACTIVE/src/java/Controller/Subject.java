/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOSubject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 3,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)

@WebServlet(name = "Subject", urlPatterns = {"/Subject"})
public class Subject extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            DAOSubject dao = new DAOSubject();

            String service = request.getParameter("service");

            if (service == null) {
                service = "show";
            }

            if (service.equals("show")) {
                ResultSet rsSubject = dao.getData("SELECT [Subject].subject_name, [Subject].subject_id, [Subject].[image], COUNT(Course.course_id) AS quantity_of_course\n"
                        + "FROM Subject\n"
                        + "LEFT JOIN Course ON Subject.subject_id = Course.subject_id\n"
                        + "GROUP BY [Subject].subject_id,  [Subject].subject_name, [Subject].[image]");
                request.setAttribute("rsSubject", rsSubject);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }

            if (service.equals("delete")) {
                int delete = Integer.parseInt(request.getParameter("subject_id"));
                int rowsAffected = dao.deleteSubject(delete);

                // Chuyển hướng về trang HomeForAdmin.jsp sau khi xóa
                response.sendRedirect("Subject");

            }
            if (service.equals("add")) {
                // Lấy thông tin từ form
                String name = request.getParameter("name");
                Part imagePath = request.getPart("file");
                String fileName = imagePath.getSubmittedFileName();
                String relativePath = "./assets/images/categories/" + fileName;
                String absolutePath = getServletContext().getRealPath(relativePath);
                imagePath.write(absolutePath);

                // Khởi tạo đối tượng Subject
                Entities.Subject newSubject = new Entities.Subject(name, relativePath);

                // Thêm môn học mới vào database
                int result = dao.addSubject(newSubject);

                // Xử lý kết quả trả về
                if (result > 0) {
                    System.out.println("Thêm môn học thành công!");
                } else {
                    System.out.println("Thêm môn học thất bại!");
                }

                response.sendRedirect("Subject");
            }

            if (service.equals("search")) {
                String name = request.getParameter("name");
                ResultSet rsSubject = dao.getData("SELECT [Subject].subject_name, [Subject].subject_id, [Subject].[image], COUNT(Course.course_id) AS quantity_of_course\n"
                        + "FROM Subject\n"
                        + "LEFT JOIN Course ON Subject.subject_id = Course.subject_id\n"
                        + "where [Subject].subject_name like N'%" + name + "%'\n"
                        + "GROUP BY [Subject].subject_id,  [Subject].subject_name, [Subject].[image]");
                request.setAttribute("rsSubject", rsSubject);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }

            if (service.equals("edit")) {
                int subject_id = Integer.parseInt(request.getParameter("subject_id"));
                String submit = request.getParameter("submit");
                if (submit == null) {
                    ResultSet rsSubject = dao.getData("select * from Subject where subject_id = " + subject_id);
                    request.setAttribute("rsSubject", rsSubject);
                    request.getRequestDispatcher("jspClient/UpdateSubject.jsp").forward(request, response);
                } else {
                    String notifi = "";
                    String name = request.getParameter("subject_name");
                    Part imagePath = request.getPart("file");
                    String fileName = imagePath.getSubmittedFileName();
                    String relativePath = "./assets/images/categories/" + fileName;
                    String absolutePath = getServletContext().getRealPath(relativePath);
                    imagePath.write(absolutePath);
                    String title = request.getParameter("title");
                    boolean status = Boolean.parseBoolean(request.getParameter("status"));
                    String description = request.getParameter("description");
                    Entities.Subject sub = new Entities.Subject(subject_id, name, relativePath, title, description, status);
                    int n = dao.updateSubject(sub);
                    if (n > 0) {
                        notifi = "Update subject successfully!!";
                        request.setAttribute("notifi", notifi);
                        request.getRequestDispatcher("jspClient/UpdateSubject.jsp").forward(request, response);
                    }
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
