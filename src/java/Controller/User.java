/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAORole;
import DAO.DAOUser;
import Entities.AccountUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.Random;

/**
 *
 * @author admin
 */
@WebServlet(name = "User", urlPatterns = {"/User"})
public class User extends HttpServlet {

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
            DAOUser daoUser = new DAOUser();

            String service = request.getParameter("service");

            if (service == null) {
                service = "show";
            }

            if (service.equals("show")) {
                ResultSet rsUser = daoUser.getData("select * from User_type");
                request.setAttribute("rsUser", rsUser);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }

            if (service.equals("search")) {
                String name = request.getParameter("name");
                ResultSet rsUser = daoUser.getData("select * from User_type where fullname like '%" + name + "%'");
                request.setAttribute("rsUser", rsUser);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }
            if (service.equals("deleteUser")) {
                String UserId = request.getParameter("UserId");
                if (UserId != null) {
                    int id = Integer.parseInt(UserId);
                    daoUser.deleteUser(id);
                }
                response.sendRedirect("User?service=show");
            }
            if (service.equals("newUser")) {
                // Thêm người dùng mới
                try {
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String fullname = request.getParameter("fullname");
                    String displayName = generateDisplayName();
                    String dob = request.getParameter("dob");
                    int gender = Integer.parseInt(request.getParameter("gender"));
                    int roleId = 4; // Role ID of the user

                    AccountUser existingUser = daoUser.checkExist(email);

                    if (existingUser != null) {
                        // Email đã tồn tại
                        request.setAttribute("message", "Email already exists.");
                        request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
                    } else {
                        // Thực hiện thêm người dùng mới
                        daoUser.insertUser(email, password, fullname, displayName, dob, gender, roleId);
                        response.sendRedirect("User?service=show");
                    }
                } catch (Exception e) {
                    // Lỗi nhập liệu
                    request.setAttribute("message", "Invalid input. Please try again!");
                    request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
                }
            }
        }
    }

    public String generateDisplayName() {
        Random random = new Random();
        String displayName = "@displayname";
        StringBuilder sb = new StringBuilder(10);
        String sequenceChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for (int i = 1; i < 10; i++) {
            int index = random.nextInt(sequenceChar.length());
            char randomChar = sequenceChar.charAt(index);
            sb.append(randomChar);
        }
        String randomString = sb.toString();
        return displayName + randomString;
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
