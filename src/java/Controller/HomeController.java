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

@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

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

            if (service.equals("displayAll")) {
                ResultSet rsSubject = daoSubject.getData("SELECT [Subject].subject_name, [Subject].subject_id, [Subject].[image], COUNT(Course.course_id) AS quantity_of_course\n"
                        + "FROM Subject\n"
                        + "LEFT JOIN Course ON Subject.subject_id = Course.subject_id\n"
                        + "GROUP BY [Subject].subject_id,  [Subject].subject_name, [Subject].[image]");
                ResultSet rsCourse = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id ");
                ResultSet rsMentor = daoMentor.getData("select * from Mentor_type");
                ResultSet rsPost = daoPost.getData("select * from Post");

                request.setAttribute("rsSubject", rsSubject);
                request.setAttribute("rsCourse", rsCourse);
                request.setAttribute("rsMentor", rsMentor);
                request.setAttribute("rsPost", rsPost);
                request.setAttribute("pageHome", "HomeController");

                request.getRequestDispatcher("/jspClient/HomePage.jsp").forward(request, response);
            }

            if (service.equals("search")) {
                HttpSession session = request.getSession();
                request.setCharacterEncoding("UTF-8");
                String type = request.getParameter("category");
                String search_name = request.getParameter("keyword");

                request.setAttribute("type", type);
//                session.setAttribute("type", type);

                switch (type) {
                    case "mentor":
                        ResultSet rsMentorS = daoMentor.getData("select * from Mentor_type m where m.display_name like N'%" + search_name + "%'");
                        request.setAttribute("rsMentor", rsMentorS);
//                        session.setAttribute("type", "mentor");
                        break;

                    case "blog":
                        ResultSet rsPostS = daoPost.getData("select * from Blog b where b.blog_name like N'%" + search_name + "%'");
                        request.setAttribute("rsPost", rsPostS);
//                        session.setAttribute("type", "blog");
                        break;

                    case "course":
                        ResultSet rsCourseS = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.course_name like N'%" + search_name + "%'");
                        request.setAttribute("rsCourse", rsCourseS);
//                        session.setAttribute("type", "course");
                        break;

                    default:
                        break;
                }

                ResultSet rsSubject = daoSubject.getData("SELECT [Subject].subject_name, [Subject].subject_id, [Subject].[image], COUNT(Course.course_id) AS quantity_of_course\n"
                        + "FROM Subject\n"
                        + "LEFT JOIN Course ON Subject.subject_id = Course.subject_id\n"
                        + "GROUP BY [Subject].subject_id,  [Subject].subject_name, [Subject].[image]");

                request.setAttribute("text_search", search_name);
                request.setAttribute("rsSubject", rsSubject);
                request.getRequestDispatcher("/jspClient/HomePage.jsp").forward(request, response);
            }
        }
    }

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
