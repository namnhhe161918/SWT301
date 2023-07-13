/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Account;

import DAO.DAOCourse;
import Entities.Course;
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
@WebServlet(name="Course", urlPatterns={"/Course"})
public class CourseAdmin extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOCourse dao = new DAOCourse();
            
            String service = request.getParameter("service");
            
            if(service == null) {
                service = "show";
            }
            
            if(service.equals("show")) {
                ResultSet rsCourse = dao.getData("select c.course_id, s.subject_name, c.course_name, c.[image], Count(q.question_name) as number_of_questions from [Course] c join [Subject] s on c.subject_id = s.subject_id left join Question q on q.course_id = c.course_id group by c.course_id, s.subject_name, c.course_name, c.[image]");
                ResultSet subjectName = dao.getData("select subject_id, subject_name from Subject");
                request.setAttribute("subjectName", subjectName);
                request.setAttribute("rsCourse", rsCourse);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }
            
            if(service.equals("add")) {
                String course_name = request.getParameter("name");
                String description = request.getParameter("description");
                String image = request.getParameter("image");
                int publish = Integer.parseInt(request.getParameter("publish"));
                int subject_id = Integer.parseInt(request.getParameter("subject_id"));
                Course course = new Course(course_name, description, image, publish);
                int n = dao.addCourse(subject_id, course);
                if(n > 0) {
                    response.sendRedirect("Course");
                }
            }
            
            if(service.equals("delete")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                int n = dao.deleteCourseByCourseID(course_id);
                if(n > 0) {
                    response.sendRedirect("Course");
                }
            }
            
            if(service.equals("edit")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                String submit = request.getParameter("submit");
                if(submit == null) {
                    ResultSet rsCourse = dao.getData("select * from Course where course_id = " + course_id);
                    request.setAttribute("rsCourse", rsCourse);
                    request.getRequestDispatcher("jspClient/UpdateCourse.jsp").forward(request, response);
                } else {
                    String notifi = "";
                    String name = request.getParameter("name");
                    String description = request.getParameter("description");
                    int subject_id = Integer.parseInt(request.getParameter("subject_id"));
                    int mentor_id = Integer.parseInt(request.getParameter("mentor_id"));
                    int is_publish = Integer.parseInt(request.getParameter("is_publish"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String image = request.getParameter("image");
                    String created_date = request.getParameter("created_date");
                    String updated_date = request.getParameter("updated_date");
                    Course course = new Course(course_id, subject_id, mentor_id, name, description, image, is_publish, quantity, created_date, updated_date);
                    int n = dao.updateCourse(course);
                    if(n > 0) {
                        notifi = "Update course successfully!!";
                        request.setAttribute("notifi", notifi);
                        request.getRequestDispatcher("jspClient/UpdateCourse.jsp").forward(request, response);
                    }
                }
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
