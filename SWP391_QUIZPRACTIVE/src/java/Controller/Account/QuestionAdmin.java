/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Account;

import DAO.DAOAnswer;
import DAO.DAOQuestion;
import Entities.Answer;
import Entities.Question;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet(name="QuestionAdmin", urlPatterns={"/QuestionAdmin"})
public class QuestionAdmin extends HttpServlet {
   
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
            
            DAOQuestion dao = new DAOQuestion();
            DAOAnswer daoAnswer = new DAOAnswer();
            
            String service = request.getParameter("service");
            
            if(service.equals("show")) {
                int course_id = Integer.parseInt(request.getParameter("courseID"));
                ResultSet course_name = dao.getData("select course_name from Course where course_id = " + course_id);
                String coursename = "";
                if(course_name.next()) {
                    coursename = course_name.getString(1);
                }
                ResultSet listQuestion = dao.getData("select q.question_id, q.question_name, c.course_name, s.subject_name from Question q join Course c on c.course_id = q.course_id join Subject s on c.subject_id = s.subject_id where c.course_id = " + course_id);
                request.setAttribute("course_id", course_id);
                request.setAttribute("coursename", coursename);
                request.setAttribute("listQuestion", listQuestion);
                request.getRequestDispatcher("jspClient/QuestionAdmin.jsp").forward(request, response);
            }
            
            if(service.equals("add")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                String name = request.getParameter("name");
                Question ques = new Question(name, course_id);
                String key[] = {"a", "b", "c", "d", "e"};
                dao.addQuestion(ques);
                ResultSet rsQuestion = dao.getData("select Top(1) question_id from Question order by question_id desc");
                int ques_id = 0;
                if(rsQuestion.next()) {
                    ques_id = rsQuestion.getInt(1);
                }
                for(int i = 0; i < 5; i++) {
                    String op = request.getParameter("op" + (i+1));
                    if(!op.equals("")) {
                        String answer_name = key[i] + ". " + op;
                        int sl = Integer.parseInt(request.getParameter("sl" + (i+1)));
                        Answer ans = new Answer(answer_name, sl, ques_id);
                        daoAnswer.addAnswer(ans);
                    } else {
                        break;
                    }
                }
                response.sendRedirect("QuestionAdmin?service=show&courseID=" + course_id);
            }
            
            if(service.equals("edit")) {
                int question_id = Integer.parseInt(request.getParameter("question_id"));
                int tr = 1;
                int fa = 0;
                Vector<Question> vectorQues = dao.getAll("select * from Question where question_id = " + question_id);
                Vector<Answer> vectorAns = daoAnswer.getAll(("select * from Answer where question_id = " + question_id));
                String submit = request.getParameter("submit");
                if(submit == null) {
                    request.setAttribute("vectorQues", vectorQues);
                    request.setAttribute("vectorAns", vectorAns);
                    request.setAttribute("tr", tr);
                    request.setAttribute("fa", fa);
                    request.getRequestDispatcher("jspClient/UpdateQuestion.jsp").forward(request, response);
                }
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(QuestionAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
