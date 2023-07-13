/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOAdmin;
import DAO.DAOMarketer;
import DAO.DAOMentor;
import DAO.DAOUser;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Entities.AccountAdmin;
import Entities.AccountMarketer;
import Entities.AccountMentor;
import Entities.AccountUser;


public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("jspClient/profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String displayname = request.getParameter("displayname");
        String address = request.getParameter("address");
        String describeMe = request.getParameter("aboutme");
        String academicLevel = request.getParameter("academiclevel");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String avatar = request.getParameter("avatar");
        String modifydate = dateCurrent();

        if (avatar.isEmpty()) {
            avatar = "base.png";
        }

        HttpSession session = request.getSession();

        //khoi tao cac session cua each account trc do
        AccountAdmin aa = (AccountAdmin) session.getAttribute("accountAdmin");
        AccountMarketer am = (AccountMarketer) session.getAttribute("accountMarketer");
        AccountMentor ame = (AccountMentor) session.getAttribute("accountMentor");
        AccountUser au = (AccountUser) session.getAttribute("accountUser");

        //khoi tao dao cua each account
        DAOUser dudb = new DAOUser();
        DAOMarketer dmdb = new DAOMarketer();
        DAOMentor dmedb = new DAOMentor();
        DAOAdmin dadb = new DAOAdmin();

        if (aa != null) {
            request.getRequestDispatcher("jspClient/profile.jsp").forward(request, response);
        } else if (am != null) {
            am.setDisplay_name(displayname);
            am.setDescyourself(describeMe);
            am.setFullName(fullname);
            am.setImage(avatar);
            am.setAddress(address);
            am.setAcademiclevel(academicLevel);
            am.setDob(dob);
            dmdb.updateProfile(am.getMakerter_id(), describeMe, fullname, avatar, displayname, address, dob, academicLevel, modifydate, Integer.parseInt(gender));
            request.setAttribute("message", "Update successfull!");
            session.setAttribute("accountMarketer", am);
            request.getRequestDispatcher("jspClient/profile.jsp").forward(request, response);
        } else if (ame != null) {
            ame.setDisplay_name(displayname);
            ame.setDescyourself(describeMe);
            ame.setFullName(fullname);
            ame.setImage(avatar);
            ame.setAddress(address);
            ame.setAcademiclevel(academicLevel);
            ame.setDob(dob);
            dmedb.updateProfile(ame.getMentor_id(), describeMe, fullname, avatar, displayname, address, dob, academicLevel, modifydate, Integer.parseInt(gender));
            request.setAttribute("message", "Update successfull!");
            session.setAttribute("accountMentor", ame);
            request.getRequestDispatcher("jspClient/profile.jsp").forward(request, response);
        } else if (au != null) {
            au.setDisplay_name(displayname);
            au.setDescyourself(describeMe);
            au.setFullName(fullname);
            au.setImage(avatar);
            au.setAddress(address);
            au.setAcademiclevel(academicLevel);
            au.setDob(dob);
            au.setGender(Integer.parseInt(gender));
            dudb.updateProfile(au.getUser_id(), describeMe, fullname, avatar, displayname, address, dob, academicLevel, modifydate, Integer.parseInt(gender));
            request.setAttribute("message", "Update successfull!");
            session.setAttribute("accountUser", au);
            request.getRequestDispatcher("jspClient/profile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Update fail");
            request.getRequestDispatcher("jspClient/profile.jsp").forward(request, response);
        }
    }

    public String dateCurrent() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        return date.toString();
    }

}
