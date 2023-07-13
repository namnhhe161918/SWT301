/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOCourse;
import DAO.DAOMentor;
import DAO.DAOPost;
import DAO.DAOSubject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewAll", urlPatterns = {"/ViewAll"})
public class ViewAll extends HttpServlet {

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
            
            String service = request.getParameter("service");

            if (service == null) {
                service = "displayAll";
            }

            DAO.DAOSubject daoSubject = new DAOSubject();
            DAO.DAOCourse daoCourse = new DAOCourse();
            DAO.DAOMentor daoMentor = new DAOMentor();
            DAO.DAOPost daoPost = new DAOPost();

            //all course
            if (service.equals("viewAllCourse")) {
                ResultSet rsCourse = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id ");
                
                request.setAttribute("rsCourse", rsCourse);
                request.getRequestDispatcher("/jspClient/ViewAllCourse.jsp").forward(request, response);
            }
            
            //all mentor
            if (service.equals("viewAllMentor")) {
                ResultSet rsMentor = daoMentor.getData("select * from Mentor_type");
                
                request.setAttribute("rsMentor", rsMentor);
                request.getRequestDispatcher("/jspClient/ViewAllMentor.jsp").forward(request, response);
            }
            
            //all post
            if (service.equals("viewAllPost")) {
                ResultSet rsPost = daoPost.getData("select * from Post");
                request.setAttribute("rsPost", rsPost);
                request.getRequestDispatcher("/jspClient/ViewAllPost.jsp").forward(request, response);
            }
            
            
            //search course
            if (service.equals("searchCourse")) {
                request.setCharacterEncoding("UTF-8");
                String search_name = request.getParameter("keyword");
                ResultSet rsCourseS = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.course_name like N'%" + search_name + "%'");
                
                request.setAttribute("text_search", search_name);
                request.setAttribute("rsCourse", rsCourseS);
                request.getRequestDispatcher("/jspClient/ViewAllCourse.jsp").forward(request, response);
            }
            
            //search mentor
            if (service.equals("searchMentor")) {
                request.setCharacterEncoding("UTF-8");
                String search_name = request.getParameter("keyword");
                ResultSet rsMentorS = daoMentor.getData("select * from Mentor_type m where m.display_name like N'%" + search_name + "%'");
                
                request.setAttribute("rsMentor", rsMentorS);
                request.setAttribute("text_search", search_name);
                request.getRequestDispatcher("/jspClient/ViewAllMentor.jsp").forward(request, response);
            }
            
            //search post
            if (service.equals("searchPost")) {
                request.setCharacterEncoding("UTF-8");
                String search_name = request.getParameter("keyword");
                ResultSet rsPostS = daoMentor.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.course_name like N'%" + search_name + "%'");
                
                request.setAttribute("rsPost", rsPostS);
                request.setAttribute("text_search", search_name);
                request.getRequestDispatcher("/jspClient/ViewAllPost.jsp").forward(request, response);
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
