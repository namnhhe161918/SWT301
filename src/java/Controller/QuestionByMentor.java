/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOAnswer;
import DAO.DAOQuestion;
import Entities.AccountMentor;
import Entities.Answer;
import Entities.Question;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "QuestionByMentor", urlPatterns = {"/QuestionByMentor"})
public class QuestionByMentor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");

            DAOQuestion dao = new DAOQuestion();
            DAOAnswer daoAnswer = new DAOAnswer();

            if (service == null) {
                service = "show";
            }

            if (service.equals("show")) {
                HttpSession session = request.getSession();
                AccountMentor mentor = (AccountMentor) session.getAttribute("accountMentor");
                int mentor_id = mentor.getMentor_id();

                int course_id = Integer.parseInt(request.getParameter("course_id"));
                //get course name
                ResultSet name = dao.getData("select course_name from Course where course_id = " + course_id);
                String course_name = "";
                if (name.next()) {
                    course_name = name.getString(1);
                }

                ResultSet rsQuestion = dao.getData("select q.question_name, q.question_id from Question q join Course c on c.course_id = q.course_id where q.course_id = " + course_id + " and c.mentor_id = " + mentor_id);
//                ResultSet rsAnswer = dao.getData("select * from Question where course_id = " + course_id);
                request.setAttribute("course_id", course_id);
                request.setAttribute("course_name", course_name);
                request.setAttribute("rsQuestion", rsQuestion);
                request.getRequestDispatcher("jspClient/QuestionByMentor.jsp").forward(request, response);
            }

            if (service.equals("update")) {
                int question_id = Integer.parseInt(request.getParameter("question_id"));
                Vector<Question> vectorQuestion = dao.getAll("select * from Question where question_id = " + question_id);
                Question question = vectorQuestion.get(0);
                int course_Id = question.getCourse_id();
                Vector<Answer> vectorAnswer = daoAnswer.getAll(("select * from Answer where question_id = " + question_id));
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.setAttribute("course_id", course_Id);
                    request.setAttribute("vectorQuestion", vectorQuestion);
                    request.setAttribute("vectorAnswer", vectorAnswer);
                    request.getRequestDispatcher("jspClient/UpdateQuestionByMentor.jsp").forward(request, response);
                } else {
                    int question_Id = Integer.parseInt(request.getParameter("question_id"));
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                    String question_name = request.getParameter("question_name");
                    Question q = new Question(question_Id, question_name, course_id);
                    dao.updateQuestion(q);

                    for (int i = 0; i < vectorAnswer.size(); i++) {
                        int anwser_id = Integer.parseInt(request.getParameter("answer_id" + i));
                        String anwser_name = request.getParameter("answer_name" + i);
                        int is_correct = Integer.parseInt(request.getParameter("is_correct" + i));
                        Answer a = new Answer(anwser_id, anwser_name, is_correct, question_Id);
                        daoAnswer.updateAnswer(a);
                    }
                    response.sendRedirect("QuestionByMentor?service=show&course_id=" + course_Id);
                }
            }

            if (service.equals("create")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                String name = request.getParameter("name");

                Question ques = new Question(name, course_id);
                String key[] = {"a", "b", "c", "d", "e"};
                dao.addQuestion(ques);
                ResultSet rsQuestion = dao.getData("select Top(1) question_id from Question order by question_id desc");
                int ques_id = 0;
                if (rsQuestion.next()) {
                    ques_id = rsQuestion.getInt(1);
                }
                for (int i = 0; i < 5; i++) {
                    String op = request.getParameter("op" + (i + 1));
                    if (!op.equals("")) {
                        String answer_name = key[i] + ". " + op;
                        int sl = Integer.parseInt(request.getParameter("sl" + (i + 1)));
                        Answer ans = new Answer(answer_name, sl, ques_id);
                        daoAnswer.addAnswer(ans);
                    } else {
                        break;
                    }
                }
                response.sendRedirect("QuestionByMentor?service=show&course_id=" + course_id);
            }

            if (service.equals("delete")) {

            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionByMentor.class.getName()).log(Level.SEVERE, null, ex);
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
