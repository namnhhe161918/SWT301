/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Account;

import DAO.DAOAdmin;
import DAO.DAOMarketer;
import DAO.DAOMentor;
import DAO.DAOUser;
import Entities.AccountAdmin;
import Entities.AccountMarketer;
import Entities.AccountMentor;
import Entities.AccountUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import module.Mailer;

public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String attribute = request.getParameter("role");
        String expiration = request.getParameter("expiration");

        if (!Mailer.isValidLink(expiration)) {
            response.sendRedirect("jspClient/404.jsp");
        } else {
            HttpSession session = request.getSession();

            if (action != null && email != null && attribute != null) {
                if (action.equals("reset")) {
                    switch (attribute) {
                        case "1":
                            request.getSession().setAttribute("AccountA", new DAOAdmin().checkExist(email));
                            break;
                        case "2":
                            request.getSession().setAttribute("AccountM", new DAOMentor().checkExist(email));
                            break;
                        case "3":
                            request.getSession().setAttribute("AccountMa", new DAOMarketer().checkExist(email));
                            break;
                        case "4":
                            request.getSession().setAttribute("AccountU", new DAOUser().checkExist(email));
                            break;
                        default:
                            response.sendRedirect("login");
                    }
                    session.setAttribute("eemail", email);
                    session.setAttribute("attribute", attribute);
                    request.getRequestDispatcher("view/forgotpsw/resetpsw.jsp").forward(request, response);
                } else {
//                request.getRequestDispatcher("view/Error/404.jsp").forward(request, response);
                    response.sendRedirect("jspClient/404.html");
                }
            } else {
                //tra ve cai gi khi khong co action 
                request.getRequestDispatcher("jspClient/404.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String npass = request.getParameter("password");
        String cpass = request.getParameter("repassword");
        String attribute = (String) request.getSession().getAttribute("attribute");

        HttpSession session = request.getSession();
        if (!npass.equals(cpass)) {
            request.setAttribute("msg", "New password and confirm new password fields do not match.");
            request.getRequestDispatcher("view/forgotpsw/resetpsw.jsp").forward(request, response);
            return;
        } else {
            switch (attribute) {
                case "1":
                    AccountAdmin aa = (AccountAdmin) session.getAttribute("AccountA");
                    //update new password for you
                    new DAOAdmin().updatePasswordByName(npass, aa.getEmail());
                    //send page login
                    break;
                case "2":
                    AccountMentor am = (AccountMentor) session.getAttribute("AccountM");
                    //update new password for you
                    new DAOMentor().updatePasswordByName(npass, am.getEmail());
                    //send page login
                    break;
                case "3":
                    AccountMarketer ama = (AccountMarketer) session.getAttribute("AccountMa");
                    //update new password for you
                    new DAOMarketer().updatePasswordByName(npass, ama.getEmail());
                    //send page login
                    break;
                case "4":
                    AccountUser au = (AccountUser) session.getAttribute("AccountU");
                    //update new password for you
                    new DAOUser().updatePasswordByName(npass, au.getEmail());
                    //send page login
                    break;
            }
            request.getRequestDispatcher("view/login/sign_in.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
