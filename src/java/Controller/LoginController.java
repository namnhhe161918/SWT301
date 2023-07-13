/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOAdmin;
import DAO.DAOMarketer;
import DAO.DAOMentor;
import DAO.DAOUser;
import Entities.AccountAdmin;
import Entities.AccountMarketer;
import Entities.AccountMentor;
import Entities.AccountUser;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //check xem co cookie chua ?
        Cookie[] cookies = null;

        //lay ra mang cookies co lien quan toi mien nay
        cookies = request.getCookies();

        String email = null;
        String pass = null;
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("cemail")) {
                    email = cooky.getValue();
                }
                if (cooky.getName().equals("cpass")) {
                    pass = cooky.getValue();
                }
                if (email != null && pass != null) {
                    break;
                }
            }
        }

        if (email != null && pass != null) {
            HttpSession session = request.getSession();
            DAOUser dudb = new DAOUser();
            DAOMarketer dmdb = new DAOMarketer();
            DAOMentor dmedb = new DAOMentor();
            DAOAdmin dadb = new DAOAdmin();

            AccountUser au = dudb.checkLogin(email, pass);
            AccountMarketer am = dmdb.checkLogin(email, pass);
            AccountMentor ame = dmedb.checkLogin(email, pass);
            AccountAdmin aa = dadb.checkLogin(email, pass);

            if (aa != null && au == null && am == null && ame == null) {
                session.setAttribute("accountAdmin", aa);
                //tra ve Dashboard admin
                response.sendRedirect("User");
            } else if (am != null && au == null && ame == null && aa == null) {
                session.setAttribute("accountMarketer", am);
                //tra ve Dashboard marketing
                response.sendRedirect("cbl");
            } else if (ame != null && am == null && au == null && aa == null) {
                session.setAttribute("accountMentor", ame);
                //tra ve Dashboard mentor
                response.sendRedirect("cbl");
            } else {
                session.setAttribute("accountUser", au);
                //tra ve home
                response.sendRedirect("HomeController");
            }
        } else {
            request.getRequestDispatcher("view/login/sign_in.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String r = request.getParameter("remember");

        //Tao cookie cho clinent
        Cookie cu = new Cookie("cemail", email);
        Cookie cp = new Cookie("cpass", pass);
        Cookie cr = new Cookie("crem", r);

        //kiem tra xem cline co chon checkbox hay ko
        if (r != null) {
            //yes choose
            cu.setMaxAge(60 * 60);
            cp.setMaxAge(60 * 60);
            cr.setMaxAge(60 * 60);
        } else {
            //not choose
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }

        //luu ve browser
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);

        //-----------------------------------------------
        HttpSession session = request.getSession();

        DAOUser dudb = new DAOUser();
        DAOMarketer dmdb = new DAOMarketer();
        DAOMentor dmedb = new DAOMentor();
        DAOAdmin dadb = new DAOAdmin();

        AccountUser au = dudb.checkLogin(email, pass);
        AccountMarketer am = dmdb.checkLogin(email, pass);
        AccountMentor ame = dmedb.checkLogin(email, pass);
        AccountAdmin aa = dadb.checkLogin(email, pass);

        if (aa != null && au == null && am == null && ame == null) {
            session.setAttribute("accountAdmin", aa);
            //tra ve Dashboard admin
            response.sendRedirect("User");
        } else if (au != null && am == null && ame == null) {
            session.setAttribute("accountUser", au);
            //tra ve home
            response.sendRedirect("HomeController");

        } else if (am != null && au == null && ame == null) {
            session.setAttribute("accountMarketer", am);
            //tra ve Dashboard marketer
            response.sendRedirect("HomeController");
        } else if (ame != null && am == null && au == null) {
            session.setAttribute("accountMentor", ame);
            //tra ve Dashboard memtor
            response.sendRedirect("HomeController");
        } else {
            request.getRequestDispatcher("view/login/sign_in.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
