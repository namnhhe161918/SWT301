/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOAnswer;
import DAO.DAOCourse;
import DAO.DAOErrol;
import DAO.DAOExam_details;
import DAO.DAOExam_results;
import DAO.DAOQuestion;
import DAO.DAOResultTest;
import Entities.AccountUser;
import Entities.Answer;
import Entities.Course;
import Entities.Exam_details;
import Entities.Exam_results;
import Entities.Question;
import Entities.ResultTest;
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
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet(name = "CourseController", urlPatterns = {"/CourseController"})
public class CourseController extends HttpServlet {

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

            DAOCourse daoCourse = new DAOCourse();
            DAOErrol daoErrol = new DAOErrol();
            DAOQuestion daoQuestion = new DAOQuestion();
            DAOAnswer daoAnswer = new DAOAnswer();
            DAOResultTest daoResultTest = new DAOResultTest();
            DAOExam_details daoEd = new DAOExam_details();
            DAOExam_results daoEr = new DAOExam_results();

            String service = request.getParameter("service");

            if (service.equals("details")) {
                HttpSession session = request.getSession();
                AccountUser au = (AccountUser) session.getAttribute("accountUser");
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                ResultSet rsCourse = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.course_id = " + course_id);
                ResultSet rsCountQuestion = daoCourse.getData("select Count(q.question_name) from Course c, Question q where q.course_id = c.course_id and c.course_id = " + course_id);
                ResultSet rsErrol = daoErrol.getData("select * from Errol");
                int errol = 0;
                if (au != null) {
                    while (rsErrol.next()) {
                        if (rsErrol.getInt(1) == au.getUser_id() && rsErrol.getInt(2) == course_id) {
                            errol++;
                        }
                    }
                }
                int count = 0;
                if (rsCountQuestion.next()) {
                    count = rsCountQuestion.getInt(1);
                }
                
                //related course
                ResultSet rsCourse2 = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where c.course_id = " + course_id);
                int subject_id = 0;
                if (rsCourse2.next()){
                    subject_id = rsCourse2.getInt(2);
                }
                ResultSet rsRelCourse = daoCourse.getData("select * from [Course] c join [Subject] s on c.subject_id = s.subject_id where s.subject_id = " + subject_id + "  and c.course_id <> " + course_id);
                request.setAttribute("rsRelCourse", rsRelCourse);


                request.setAttribute("count", count);
                request.setAttribute("errol", errol);
                request.setAttribute("rsCourse", rsCourse);
                request.getRequestDispatcher("jspClient/CourseDetails.jsp").forward(request, response);
            }

            if (service.equals("errol")) {
                HttpSession session = request.getSession();
                if (session.getAttribute("accountUser") == null) {
                    response.sendRedirect("login");
                } else {
                    AccountUser au = (AccountUser) session.getAttribute("accountUser");
                    String id_raw = request.getParameter("id");
                    int id = Integer.parseInt(id_raw);
                    Vector<Course> list = daoCourse.getAll("select * from Course where course_id = " + id);
                    Course course = list.get(0);
                    int n = daoErrol.errolCourse(au, id);
                    if (n > 0) {
                        daoCourse.updateQuantity(course);
                        response.sendRedirect("HomeController");
                    }
                }
            }

            if (service.equals("learning")) {
                int id = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession();
                AccountUser au = (AccountUser) session.getAttribute("accountUser");
                String nameCourse = "";
                ResultSet rsCourse = daoCourse.getData("select * from Course where course_id = " + id);
                ResultSet listEd = daoEd.getData("select * from Exam_details where course_id = " + id + " and user_id = " + au.getUser_id());
                if (rsCourse.next()) {
                    nameCourse = rsCourse.getString(4);
                }
                Vector<Question> listQuestion = daoQuestion.getAll("select * from Question where course_id = " + id);
                Vector<Answer> listAnswer = daoAnswer.getAll("select * from Answer");
                request.setAttribute("id", id);
                request.setAttribute("nameCourse", nameCourse);
                request.setAttribute("listQuestion", listQuestion);
                request.setAttribute("listAnswer", listAnswer);
                request.setAttribute("listEd", listEd);
                request.getRequestDispatcher("jspClient/Learning.jsp").forward(request, response);
            }

            if (service.equals("exam")) {
                int id = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession();
                AccountUser au = (AccountUser) session.getAttribute("accountUser");
                ResultSet listEd = daoEd.getData("select * from Exam_details where course_id = " + id + " and user_id = " + au.getUser_id());
                if(listEd.next()) {
                    daoEd.removeExamdetails(au.getUser_id(), id);
                    daoResultTest.removeResultTest(au.getUser_id(), id);
                }
                String nameCourse = "";
                ResultSet rsCourse = daoCourse.getData("select * from Course where course_id = " + id);
                if (rsCourse.next()) {
                    nameCourse = rsCourse.getString(4);
                }
                Vector<Question> listQuestion = daoQuestion.getAll("select * from Question where course_id = " + id);
                Vector<Answer> listAnswer = daoAnswer.getAll("select * from Answer");
                request.setAttribute("id", id);
                request.setAttribute("nameCourse", nameCourse);
                request.setAttribute("listQuestion", listQuestion);
                request.setAttribute("listAnswer", listAnswer);
                request.getRequestDispatcher("jspClient/Exam.jsp").forward(request, response);
            }

            if (service.equals("result")) {
                HttpSession session = request.getSession();
                AccountUser au = (AccountUser) session.getAttribute("accountUser");
                int id = Integer.parseInt(request.getParameter("id"));
                ArrayList<Integer> answerCheck = new ArrayList<>();
                Vector<Question> listQuestion = daoQuestion.getAll("select * from Question where course_id = " + id);
                String nameCourse = "";
                ResultSet rsCourse = daoCourse.getData("select * from Course where course_id = " + id);
                Vector<Answer> listAnswer = daoAnswer.getAll("select * from Answer");
                ResultSet listEd = daoEd.getData("select * from Exam_details where course_id = " + id + " and user_id = " + au.getUser_id());
                if(listEd.next()) {
                    daoEd.removeExamdetails(au.getUser_id(), id);
                    daoResultTest.removeResultTest(au.getUser_id(), id);
                }
                if (rsCourse.next()) {
                    nameCourse = rsCourse.getString(4);
                }
                for (Question question : listQuestion) {
                    for (Answer answer : listAnswer) {
                        String getIs_correct = request.getParameter("question" + question.getQuestion_id());
                        if(getIs_correct == null) {
                            getIs_correct = "0_n";
                        }
                        String is_correct_raw = getIs_correct.split("_")[0];
                        String is_choose_raw = getIs_correct.split("_")[1];
                        int is_correct = Integer.parseInt(is_correct_raw);
                        answerCheck.add(is_correct);
                        String answer_choose = request.getParameter("answer" + answer.getAnswer_id());
                        if(is_choose_raw.equals("n")) {
                            Exam_details ed = new Exam_details(au.getUser_id(), id, question.getQuestion_id(), 0);
                            daoEd.addExamDetails(ed);
                        }
                        if(is_choose_raw.equals(answer_choose)) {
                            int choose = Integer.parseInt(is_choose_raw);
                            Exam_details ed = new Exam_details(au.getUser_id(), id, question.getQuestion_id(), choose);
                            daoEd.addExamDetails(ed);
                        }
                        
                    }
                }
                int count = 0;
                for (Integer check : answerCheck) {
                    if (check == 1) {
                        count = count + 1;
                    }
                }
                double score = (double) count / (double) answerCheck.size();
                double grade = ((double) Math.round(score * 100) / 100) * 100;
                String stauts = "";
                if (grade < 50) {
                    stauts = "Sorry! You failed!";
                } else {
                    stauts = "Congratulations! You passed!";
                }
                Vector<Exam_results> er = daoEr.getAll("select a.question_id, ed.answer_choose, a.answer_id, a.is_correct, a.answer_name from Exam_details ed join Answer a on ed.question_id = a.question_id where ed.user_id = " + au.getUser_id() + " and ed.course_id = " + id);
                ResultTest restultTest = new ResultTest(au.getUser_id(), id, stauts, grade);
                daoResultTest.addResultTest(restultTest);
                request.setAttribute("id", id);
                request.setAttribute("er", er);
                request.setAttribute("nameCourse", nameCourse);
                request.setAttribute("listQuestion", listQuestion);
                request.setAttribute("listAnswer", listAnswer);
                request.setAttribute("status", stauts);
                request.setAttribute("grade", grade);
                request.getRequestDispatcher("jspClient/Result.jsp").forward(request, response);
            }
            
            if(service.equals("review")) {
                HttpSession session = request.getSession();
                AccountUser au = (AccountUser) session.getAttribute("accountUser");
                int id = Integer.parseInt(request.getParameter("id"));
                Vector<Question> listQuestion = daoQuestion.getAll("select * from Question where course_id = " + id);
                Vector<Exam_results> er = daoEr.getAll("select a.question_id, ed.answer_choose, a.answer_id, a.is_correct, a.answer_name from Exam_details ed join Answer a on ed.question_id = a.question_id where ed.user_id = " + au.getUser_id() + " and ed.course_id = " + id);
                Vector<ResultTest> listrt = daoResultTest.getAll("select * from Result_test where user_id = " + au.getUser_id() + " and course_id = " + id);
                ResultTest rt = listrt.get(0);
                String nameCourse = "";
                ResultSet rsCourse = daoCourse.getData("select * from Course where course_id = " + id);
                if (rsCourse.next()) {
                    nameCourse = rsCourse.getString(4);
                }
                request.setAttribute("id", id);
                request.setAttribute("nameCourse", nameCourse);
                request.setAttribute("listQuestion", listQuestion);
                request.setAttribute("er", er);
                request.setAttribute("rt", rt);
                request.getRequestDispatcher("jspClient/ReviewExam.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
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
