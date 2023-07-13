/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOMarketer;
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
@WebServlet(name = "Marketer", urlPatterns = {"/Marketer"})
public class Marketer extends HttpServlet {

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
            DAOMarketer daoMarketer = new DAOMarketer();

            String service = request.getParameter("service");

            if (service == null) {
                service = "show";
            }

            if (service.equals("show")) {
                ResultSet rsMarketer = daoMarketer.getData("select * from Marketer_type");
                request.setAttribute("rsMarketer", rsMarketer);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }

            if (service.equals("search")) {
                String name = request.getParameter("name");
                ResultSet rsMarketer = daoMarketer.getData("select * from Marketer_type where fullname like '%" + name + "%'");
                request.setAttribute("rsMarketer", rsMarketer);
                request.getRequestDispatcher("jspClient/HomeForAdmin.jsp").forward(request, response);
            }
            if (service.equals("deleteMarketer")) {
                String marketerId = request.getParameter("marketerId");
                if (marketerId != null) {
                    int id = Integer.parseInt(marketerId);
                    daoMarketer.deleteMarketer(id);
                }
                response.sendRedirect("Marketer?service=show");
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
