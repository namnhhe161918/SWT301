package test.com.controllers;

import test.com.daos.DAOAdmin;
import test.com.daos.DAOMarketer;
import test.com.daos.DAOMentor;
import test.com.daos.DAOUser;
import test.com.entities.AccountAdmin;
import test.com.entities.AccountMarketer;
import test.com.entities.AccountMentor;
import test.com.entities.AccountUser;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="ChangePasswordController", urlPatterns={"/ChangePassword"})
public class ChangePasswordController extends HttpServlet {

   private final static String url = "/view/login/sign_in.jsp";
   private final static String urlsucess = "jspClient/changePassword.jsp";
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        request.getRequestDispatcher(urlsucess).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldP = request.getParameter("oldPassword");
        String NPass = request.getParameter("newPassword");
        String CPass = request.getParameter("rePassword");
        String email = request.getParameter("email");
        
        HttpSession session = request.getSession();
        // Initialize session for each account
        AccountAdmin aa = (AccountAdmin) session.getAttribute("accountAdmin");
        AccountMarketer am = (AccountMarketer) session.getAttribute("accountMarketer");
        AccountMentor ame = (AccountMentor) session.getAttribute("accountMentor");
        AccountUser au = (AccountUser) session.getAttribute("accountUser");

        // Initialize DAO for each account
        DAOUser userDao = new DAOUser();
        DAOMarketer marketerDao = new DAOMarketer();
        DAOMentor mentorDao = new DAOMentor();
        DAOAdmin adminDao = new DAOAdmin();
        
        if (aa != null) {
            request.getRequestDispatcher(urlsucess).forward(request, response);
        } else if (am != null) {
            am.setPassword(CPass);          
            marketerDao.updatePasswordByName(CPass, am.getEmail());
            request.setAttribute("message", "Update successful!");
            session.setAttribute("accountMarketer", am);
            request.getRequestDispatcher(url).forward(request, response);
        } else if (ame != null) {
            ame.setPassword(CPass);         
            mentorDao.updatePasswordByName(CPass, ame.getEmail());
            request.setAttribute("message", "Update successful!");
            session.setAttribute("accountMentor", ame);
            request.getRequestDispatcher(url).forward(request, response);
        } else if (au != null) {
            au.setPassword(CPass);
            userDao.updatePasswordByName(CPass, au.getEmail());
            request.setAttribute("message", "Update successful!");
            session.setAttribute("accountUser", au);
            request.getRequestDispatcher(url).forward(request, response);
        } else {
            request.setAttribute("error", "Update failed");
            request.getRequestDispatcher(urlsucess).forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
