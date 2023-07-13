/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Account;

import DAO.DAOAdmin;
import DAO.DAOMarketer;
import DAO.DAOMentor;
import DAO.DAOUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import module.Mailer;

public class RestPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RestPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RestPasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.getRequestDispatcher("view/forgotpsw/forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        HttpSession session = request.getSession();

        if (new DAOAdmin().checkExist(email) != null) {
            sendDocumentHTML(email, 1);
            request.setAttribute("msg", "Check your email and verify!");
        } else if (new DAOMarketer().checkExist(email) != null) {
            sendDocumentHTML(email, 3);
            request.setAttribute("msg", "Check your email and verify!");
        } else if (new DAOMentor().checkExist(email) != null) {
            sendDocumentHTML(email, 2);
            request.setAttribute("msg", "Check your email and verify!");
        } else if (new DAOUser().checkExist(email) != null) {
            sendDocumentHTML(email, 4);
            request.setAttribute("msg", "Check your email and verify!");
//            System.out.println(session.getId());
        } else {
            request.setAttribute("msgerror", "Invalid email!");
            request.getRequestDispatcher("view/forgotpsw/forgotpassword.jsp").forward(request, response);
        }
        request.setAttribute("changepass", email);
        request.getRequestDispatcher("view/forgotpsw/sentlink.jsp").forward(request, response);

    }

    public void sendDocumentHTML(String email, int role) throws UnsupportedEncodingException {
        String linksend = Mailer.generateLink("http://localhost:8080/Project_SWP391/forgotten?action=reset&email=" + email + "&role=" + role);
        Mailer.send(email, "Verify",
                "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <style>body,\n"
                + "        html {\n"
                + "            padding: 0;\n"
                + "            margin: 0;\n"
                + "        }\n"
                + "        \n"
                + "        \n"
                + "        .abcd {\n"
                + "            width: 404.4px;\n"
                + "            height: 412px;\n"
                + "            border-radius: 3px;\n"
                + "            padding: 20px;\n"
                + "            margin: 3% auto 0;\n"
                + "            border: 1px solid;\n"
                + "            background-color: #4255ff;\n"
                + "            border-radius: 4px;\n"
                + "        \n"
                + "        \n"
                + "        }\n"
                + "        \n"
                + "        .title-logo {\n"
                + "            text-align: center;\n"
                + "            color: #fff;\n"
                + "            font-family: 'Trebuchet MS';\n"
                + "        \n"
                + "        }\n"
                + "        \n"
                + "        .content {\n"
                + "            background-color: #fff;\n"
                + "            padding: 24px 10%;\n"
                + "            border-radius: 4px;\n"
                + "            margin: 0 20px;\n"
                + "        }\n"
                + "        \n"
                + "        .title {\n"
                + "            text-align: left;\n"
                + "            color: #303545;\n"
                + "            font-family: 'Segoe UI';\n"
                + "            font-size: 15px;\n"
                + "            font-weight: 700;\n"
                + "        }\n"
                + "        \n"
                + "        .detail {\n"
                + "            font-family: 'Segoe UI';\n"
                + "            line-height: 24px;\n"
                + "            word-wrap: break-word;\n"
                + "        }\n"
                + "        \n"
                + "        .link {\n"
                + "            text-align: center;\n"
                + "            background-color: #000;\n"
                + "            text-decoration: none;\n"
                + "            padding: 15px 15px;\n"
                + "            border-radius: 4px;\n"
                + "            margin-bottom: 10px;\n"
                + "        }\n"
                + "        \n"
                + "        .link a {\n"
                + "            font-family: 'Segoe UI';\n"
                + "            color: #fff;\n"
                + "            text-decoration: none;\n"
                + "            padding: 10px 10px;\n"
                + "            font-weight: 700;\n"
                + "        }</style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"abcd\">\n"
                + "        <div class=\"title-logo\">\n"
                + "            <h3>QUIZ PRATICE</h3>\n"
                + "        </div>\n"
                + "         <div class=\"content\">\n"
                + "            <div class=\"title\"><p>May Be you forgot password? </p></div>\n"
                + "            <div class=\"detail\">\n"
                + "                <p>\n"
                + "                    Don't worry, This is a common problem ! Please enter a link at bottom to login quizlet\n"
                + "                    and rest password of you. Link that will dealine 10 min and only <b>use one time.</b> \n"
                + "                </p>\n"
                + "            </div>\n"
                + "            <div class=\"link\">\n"
                + "                <a href=" + linksend + ">Reset Password</a>\n"
                + "            </div>\n"
                + "         </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
