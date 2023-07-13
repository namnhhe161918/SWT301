
package Controller.PostCRUD;

import DAO.DAOPost;
import Entities.AccountMarketer;
import Entities.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class PostListController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //pagination
        String search = request.getParameter("search") == null ? "" : request.getParameter("search");
        String entry = request.getParameter("entry") == null || request.getParameter("entry") == "" ? "10" : request.getParameter("entry");
        String currentPage = request.getParameter("index");

        //check user thuoc role marketer xem la ai
        
        
        
        DAOPost dpdb = new DAOPost();
        try {
            search = search.trim();
            int indexp = Integer.parseInt(entry);
            int totalPost = dpdb.getNumberPost(search);

            //assgin numberPage
            int numberPage = 0;

            if (indexp > totalPost) {
                numberPage = 1;
            } else {
                numberPage = (int) Math.ceil((double) totalPost / indexp);
            }

            //pagination current
            int index;
            if (currentPage == "0" || currentPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(currentPage);
            }

            //view slider list follow some option
            List<Post> list = dpdb.getAllPost2(search, index, indexp);

            request.setAttribute("listpost", list);
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("search", search);
            request.setAttribute("index", index);
            request.setAttribute("pagepost", "dashboardlistpost");
        } catch (Exception e) {
        }
        request.getRequestDispatcher("view/marketer/dashboard-postlist.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}
