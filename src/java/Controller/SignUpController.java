package Controller;

import DAO.DAOAdmin;
import DAO.DAOMarketer;
import DAO.DAOMentor;
import DAO.DAORole;
import DAO.DAOUser;
import Entities.AccountAdmin;
import Entities.AccountMarketer;
import Entities.AccountMentor;
import Entities.AccountUser;
import Entities.Role;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Admin
 */
public class SignUpController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAORole drdb = new DAORole();
        ArrayList<Role> chooserolesignup = drdb.getRoleStudentandTeacher();
        HttpSession session = request.getSession();
        session.setAttribute("chooserole", chooserolesignup);
        request.getRequestDispatcher("view/login/sign_up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String pass = request.getParameter("pass");
            String gender = request.getParameter("gender");
            String cpass = request.getParameter("cpass");
            String roleid = request.getParameter("role");

            //initial parameter each role in database
            AccountUser au = new DAOUser().checkExist(email);
            AccountMentor ame = new DAOMentor().checkExist(email);
            AccountMarketer am = new DAOMarketer().checkExist(email);
            AccountAdmin aa = new DAOAdmin().checkExist(email);

            if (dob == null) {
                request.setAttribute("messregis", "Date of birth may be invalid");
                request.getRequestDispatcher("view/login/sign_up.jsp").forward(request, response);
            }
            //Compare pass from user with confirm pass from user must be equal
            if (pass.equals(cpass) == false) {
                request.setAttribute("messregis", "Confirm Password is not correct");
                request.getRequestDispatcher("view/login/sign_up.jsp").forward(request, response);
            } else {
                boolean flag = true;
                String displayname = randomdisplayName();
                //loop insert follow role
                while (aa == null && am == null && au == null && ame == null) {
                    if (new DAORole().getRoleById(Integer.valueOf(roleid)).getRoleName().equals("user")) {
                        new DAOUser().insertUser(email, pass, fullname, displayname, dob, Integer.valueOf(gender), Integer.valueOf(roleid));
                        request.getRequestDispatcher("view/login/sign_in.jsp").forward(request, response);
                    } else {
                        new DAOMentor().insertMentor(email, pass, fullname, randomdisplayName(), dob, Integer.valueOf(gender), Integer.valueOf(roleid));
                        request.getRequestDispatcher("view/login/sign_in.jsp").forward(request, response);
                    }
                    flag = false;
                    break;
                }

                //Comprare flag with true the same email is exist
                if (flag == true) {
                    request.setAttribute("messregis", "Email already exist in system!");
                    request.getRequestDispatcher("view/login/sign_up.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("messregis", "Invalid input.Please Try again!");
            request.getRequestDispatcher("view/login/sign_up.jsp").forward(request, response);
        }

    }

//    public String formatDOB(String dateoutput) {
//        //2023-05-31
//
//        String[] arrStr = dateoutput.split("-");
//        String res = "";
//        for (int i = arrStr.length - 1; i >= 0; i--) {
//            if (i == 0) {
//                res += arrStr[i];
//                break;
//            }
//            res += arrStr[i] + "/";
//        }
//
//        SimpleDateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
//        try {
//            dateformat.setLenient(false);
//            dateformat.parse(res);
//            return res;
//        } catch (ParseException e) {
//            System.out.println(e);
//        }
//
//        return null;
//    }

    public String randomdisplayName() {
        Random r = new Random();
        String res = "@displayname";
        StringBuilder sb = new StringBuilder(10);
        String sequencechar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for (int i = 1; i < 10; i++) {
            int index = r.nextInt(sequencechar.length());
            char randomChar = sequencechar.charAt(index);
            sb.append(randomChar);
        }
        String randomString = sb.toString();
        return res + randomString;
    }

}
