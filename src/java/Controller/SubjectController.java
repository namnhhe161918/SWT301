/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOCourse;
import DAO.DAOSubject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
@WebServlet(name = "SubjectController", urlPatterns = {"/SubjectController"})
public class SubjectController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            DAOSubject daoSubject = new DAOSubject();
            DAOCourse daoCourse = new DAOCourse();

            String service = request.getParameter("service");

            if (service.equals("details")) {
                //Lấy ra id của subject mà mình muốn xem list
                int subject_id = Integer.parseInt(request.getParameter("subject_id"));
                //câu lệnh sql lấy ra phần subject list
                ResultSet rsSubject = daoSubject.getData("SELECT [Subject].subject_name, [Subject].subject_id, [Subject].[image], COUNT(Course.course_id) AS quantity_of_course\n"
                        + "FROM Subject\n"
                        + "LEFT JOIN Course ON Subject.subject_id = Course.subject_id\n"
                        + "GROUP BY [Subject].subject_id,  [Subject].subject_name, [Subject].[image]");
                //câu lệnh sql lấy ra phần list courses
                ResultSet rsCourse = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.subject_id = " + subject_id);

                //subject details
                ResultSet rsSubjectDetails = daoSubject.getData("select * from [Subject]  where subject_id = " + subject_id);
                ResultSet countCourse = daoCourse.getData("select count(course_id) from Course where subject_id = " + subject_id);
                
                
                
                request.setAttribute("countCourse", countCourse);
                request.setAttribute("rsSubjectDetails", rsSubjectDetails);
                request.setAttribute("subject_id", subject_id);
                request.setAttribute("rsSubject", rsSubject);
                request.setAttribute("rsCourse", rsCourse);
                request.getRequestDispatcher("/jspClient/SubjectDetails.jsp").forward(request, response);
            }

            if (service.equals("search")) {
                //lấy ra phần text nhập vào
                String course_name = request.getParameter("course_name");
                int subject_id = Integer.parseInt(request.getParameter("subject_id"));
                //câu lệnh sql để select course có ở trong khóa học đó
                ResultSet rsCourseOfSubject = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.subject_id = " + subject_id + " and c.course_name like N'%" + course_name + "%'");
                //setAtribute lại cho phần Subject list
                ResultSet rsSubject = daoSubject.getData("SELECT [Subject].subject_name, [Subject].subject_id, [Subject].[image], COUNT(Course.course_id) AS quantity_of_course\n"
                        + "FROM Subject\n"
                        + "LEFT JOIN Course ON Subject.subject_id = Course.subject_id\n"
                        + "GROUP BY [Subject].subject_id,  [Subject].subject_name, [Subject].[image]");

                request.setAttribute("text_search", course_name);
                request.setAttribute("rsCourse", rsCourseOfSubject);
                request.setAttribute("subject_id", subject_id);
                request.setAttribute("rsSubject", rsSubject);
                request.getRequestDispatcher("/jspClient/SubjectDetails.jsp").forward(request, response);
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
