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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="ChangePasswordController", urlPatterns={"/ChangePassword"})
public class ChangePasswordController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("jspClient/changePassword.jsp").forward(request, response);
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
            request.getRequestDispatcher("jspClient/changePassword.jsp").forward(request, response);
        } else if (am != null) {
            am.setPassword(CPass);          
            marketerDao.updatePasswordByName(CPass, am.getEmail());
            request.setAttribute("message", "Update successful!");
            session.setAttribute("accountMarketer", am);
            request.getRequestDispatcher("/view/login/sign_in.jsp").forward(request, response);
        } else if (ame != null) {
            ame.setPassword(CPass);         
            mentorDao.updatePasswordByName(CPass, ame.getEmail());
            request.setAttribute("message", "Update successful!");
            session.setAttribute("accountMentor", ame);
            request.getRequestDispatcher("/view/login/sign_in.jsp").forward(request, response);
        } else if (au != null) {
            au.setPassword(CPass);
            userDao.updatePasswordByName(CPass, au.getEmail());
            request.setAttribute("message", "Update successful!");
            session.setAttribute("accountUser", au);
            request.getRequestDispatcher("/view/login/sign_in.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Update failed");
            request.getRequestDispatcher("jspClient/changePassword.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
