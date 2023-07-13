/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOCourse;
import DAO.DAOSubject;
import Entities.AccountMentor;
import Entities.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@MultipartConfig()
@WebServlet(name = "CourseMentor", urlPatterns = {"/CourseMentor"})
public class CourseMentor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            DAOCourse daoCourse = new DAOCourse();
            DAOSubject daoSubject = new DAOSubject();

            if (service == null) {
                service = "show";
            }

            if (service.equals("show")) {
                HttpSession session = request.getSession();
                AccountMentor mentor = (AccountMentor) session.getAttribute("accountMentor");
                int mentor_id = mentor.getMentor_id();

                ResultSet rsCourse = daoCourse.getData("select c.course_id, s.subject_name, c.course_name, c.[image], Count(q.question_name) as number_of_questions from [Course] c join [Subject] s on c.subject_id = s.subject_id left join Question q on q.course_id = c.course_id where c.mentor_id = " + mentor_id + " group by c.course_id, s.subject_name, c.course_name, c.[image]");
                ResultSet rsSubject = daoSubject.getData("select * from Subject");
                request.setAttribute("rsCourse", rsCourse);
                request.setAttribute("rsSubject", rsSubject);

                request.getRequestDispatcher("jspClient/CourseForMentor.jsp").forward(request, response);
            }

            if (service.equals("delete")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                int n = daoCourse.deleteCourseByCourseID(course_id);
                if (n > 0) {
                    response.sendRedirect("CourseMentor");
                }
            }

            if (service.equals("add")) {
                HttpSession session = request.getSession();
                AccountMentor mentor = (AccountMentor) session.getAttribute("accountMentor");
                int mentor_id = mentor.getMentor_id();
                
                String course_name = request.getParameter("name");
                String description = request.getParameter("description");

                Part imagePath = request.getPart("image");
                String fileName = imagePath.getSubmittedFileName();
                String relativePath = "./assets/images/categories/" + fileName;
                String absolutePath = getServletContext().getRealPath(relativePath);
                imagePath.write(absolutePath);
            
                int publish = Integer.parseInt(request.getParameter("publish"));
                int subject_id = Integer.parseInt(request.getParameter("subject_id"));

                ResultSet rsCourse = daoCourse.getData("select * from Subject s join Course c on s.subject_id = c.subject_id join Mentor_type m on c.mentor_id = m.mentor_id where m.mentor_id = 1");
                ResultSet rsSubject = daoSubject.getData("select * from Subject");
                request.setAttribute("rsCourse", rsCourse);
                request.setAttribute("rsSubject", rsSubject);
                Course course = new Course(course_name, mentor_id, description, relativePath, publish);
                int n = daoCourse.addCourseByMentor(subject_id, course);
                if (n > 0) {
                    response.sendRedirect("CourseMentor");
                }
            }
            
            if (service.equals("update")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                String submit = request.getParameter("submit");
                if(submit == null) {
                    ResultSet rsCourse = daoCourse.getData("select * from Subject s join Course c on s.subject_id = c.subject_id join Mentor_type m on c.mentor_id = m.mentor_id where c.course_id = " + course_id);
                    request.setAttribute("rsCourse", rsCourse);
                    request.getRequestDispatcher("jspClient/UpdateCourseByMentor.jsp").forward(request, response);
                } else {
                    String notifi = "";
                    String name = request.getParameter("name");
                    String description = request.getParameter("description");
                    int subject_id = Integer.parseInt(request.getParameter("subject_id"));
                    int mentor_id = Integer.parseInt(request.getParameter("mentor_id"));
                    int is_publish = Integer.parseInt(request.getParameter("is_publish"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
//                    String image = request.getParameter("image");
                    
                    Part imagePath = request.getPart("image");
                    String fileName = imagePath.getSubmittedFileName();
                    String image = "./assets/images/categories/" + fileName;
                    String absolutePath = getServletContext().getRealPath(image);
                    imagePath.write(absolutePath);
                    
                    String created_date = request.getParameter("created_date");
                    String updated_date = request.getParameter("updated_date");
                    Course course = new Course(course_id, subject_id, mentor_id, name, description, image, is_publish, quantity, created_date, updated_date);
                    int n = daoCourse.updateCourse(course);
                    if(n > 0) {
                        notifi = "Update course successfully!!";
                        request.setAttribute("notifi", notifi);
                        request.getRequestDispatcher("jspClient/UpdateCourseByMentor.jsp").forward(request, response);
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
