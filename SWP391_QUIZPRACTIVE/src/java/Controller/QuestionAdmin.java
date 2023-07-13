/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOAnswer;
import DAO.DAOQuestion;
import Entities.Answer;
import Entities.Question;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 3,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)

@WebServlet(name = "QuestionAdmin", urlPatterns = {"/QuestionAdmin"})
public class QuestionAdmin extends HttpServlet {

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

            DAOQuestion daoQues = new DAOQuestion();
            DAOAnswer daoAns = new DAOAnswer();

            String service = request.getParameter("service");

            if (service.equals("show")) {
                int course_id = Integer.parseInt(request.getParameter("courseID"));
                ResultSet course_name = daoQues.getData("select course_name from Course where course_id = " + course_id);
                String coursename = "";
                String open = "";
                if (course_name.next()) {
                    coursename = course_name.getString(1);
                }
                ResultSet listQuestion = daoQues.getData("select q.question_id, q.question_name, c.course_name, s.subject_name from Question q join Course c on c.course_id = q.course_id join Subject s on c.subject_id = s.subject_id where c.course_id = " + course_id);
                request.setAttribute("course_id", course_id);
                request.setAttribute("coursename", coursename);
                request.setAttribute("listQuestion", listQuestion);
                request.setAttribute("open", open);
                request.getRequestDispatcher("jspClient/QuestionAdmin.jsp").forward(request, response);
            }

            if (service.equals("add")) {
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                String fileName = "";
                String a = "";
                String notifi = "";
                Part part = request.getPart("file");
                String realPath = request.getServletContext().getRealPath("/upload");
                fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }
                part.write(realPath + "/" + fileName);
                a = realPath + "/" + fileName;

                if (checkFormatFileExcel(a)) {
                    importDataFromExcel(a, daoQues, daoAns, course_id);
                    response.sendRedirect("QuestionAdmin?service=show&courseID=" + course_id);
                } else {
                    notifi = "Your file format is wrong. Please follow the instructions properly!";
                    String open = " open";
                    ResultSet course_name = daoQues.getData("select course_name from Course where course_id = " + course_id);
                    String coursename = "";
                    if (course_name.next()) {
                        coursename = course_name.getString(1);
                    }
                    ResultSet listQuestion = daoQues.getData("select q.question_id, q.question_name, c.course_name, s.subject_name from Question q join Course c on c.course_id = q.course_id join Subject s on c.subject_id = s.subject_id where c.course_id = " + course_id);
                    request.setAttribute("course_id", course_id);
                    request.setAttribute("coursename", coursename);
                    request.setAttribute("listQuestion", listQuestion);
                    request.setAttribute("notifi", notifi);
                    request.setAttribute("open", open);
                    request.getRequestDispatcher("jspClient/QuestionAdmin.jsp").forward(request, response);
                }
            }

            if (service.equals("edit")) {
                int question_id = Integer.parseInt(request.getParameter("question_id"));
                Vector<Question> vectorQuestion = daoQues.getAll("select * from Question where question_id = " + question_id);
                Question question = vectorQuestion.get(0);
                int course_Id = question.getCourse_id();
                Vector<Answer> vectorAnswer = daoAns.getAll(("select * from Answer where question_id = " + question_id));
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.setAttribute("course_id", course_Id);
                    request.setAttribute("vectorQuestion", vectorQuestion);
                    request.setAttribute("vectorAnswer", vectorAnswer);
                    request.getRequestDispatcher("jspClient/UpdateQuestion.jsp").forward(request, response);
                } else {
                    int question_Id = Integer.parseInt(request.getParameter("question_id"));
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                    String question_name = request.getParameter("question_name");
                    Question q = new Question(question_Id, question_name, course_id);
                    daoQues.updateQuestion(q);

                    for (int i = 0; i < vectorAnswer.size(); i++) {
                        int anwser_id = Integer.parseInt(request.getParameter("answer_id" + i));
                        String anwser_name = request.getParameter("op" + i);
                        int is_correct = Integer.parseInt(request.getParameter("sl" + i));
                        Answer a = new Answer(anwser_id, anwser_name, is_correct, question_Id);
                        daoAns.updateAnswer(a);
                    }
                    response.sendRedirect("QuestionAdmin?service=show&courseID=" + course_Id);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionAdmin.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean checkFormatFileExcel(String fileName) throws IOException {
        boolean check = true;
        InputStream inp = new FileInputStream(fileName);
        HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));
        Sheet sheet = wb.getSheetAt(0);
        int index[] = {1, 2, 3, 4, 5};
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            if (row.getCell(0) == null) {
                check = false;
                break;
            }
            int count = 0;
            if (row.getCell(6) == null) {
                check = false;
                break;
            }
            for (int j = 0; j < index.length; j++) {
                count++;
                if (row.getCell(index[j]) == null) {
                    break;
                }
            }
            if (count < 2) {
                check = false;
            }
        }
        return check;
    }

    public void importDataFromExcel(String fileName, DAOQuestion daoQues, DAOAnswer daoAns, int course_id) throws IOException {
        InputStream inp = new FileInputStream(fileName);
        HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));
        Sheet sheet = wb.getSheetAt(0);
        String key[] = {"a", "b", "c", "d", "e"};
        int index[] = {1, 2, 3, 4, 5};
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            String question_name = row.getCell(0).getStringCellValue();
            daoQues.addQuestion(new Entities.Question(question_name, course_id));
            ResultSet rsQuestion = daoQues.getData("select Top(1) question_id from Question order by question_id desc");
            int ques_id = 0;
            try {
                if (rsQuestion.next()) {
                    ques_id = rsQuestion.getInt(1);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, ex);
            }
            int is_correct = (int) row.getCell(6).getNumericCellValue();
            for (int j = 0; j < index.length; j++) {
                if (row.getCell(index[j]) == null) {
                    break;
                }
                String answer_name = key[j] + ". " + row.getCell(index[j]).getStringCellValue();
                if (index[j] == is_correct) {
                    daoAns.addAnswer(new Answer(answer_name, 1, ques_id));
                } else {
                    daoAns.addAnswer(new Answer(answer_name, 0, ques_id));
                }
            }
        }
    }

}
