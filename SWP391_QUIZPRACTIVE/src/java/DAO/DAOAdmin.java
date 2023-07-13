
package DAO;

import Entities.AccountAdmin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import module.DBConnect;

/**
 *
 * @author Admin
 */
public class DAOAdmin extends DBConnect {

    //check login
    public AccountAdmin checkLogin(String emailInput, String pass) {
        String sql = "SELECT [admin_id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "  FROM [QUIZ_PRACTICE].[dbo].[Admin] WHERE email = ? AND password = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,emailInput);
            st.setString(2,pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                AccountAdmin aa = new AccountAdmin(rs.getInt("admin_id"),rs.getString("email"),rs.getString("password"));
                return aa;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    //check Exist
    public AccountAdmin checkExist(String emailInput){
          String sql = "SELECT [admin_id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "  FROM [QUIZ_PRACTICE].[dbo].[Admin] WHERE email = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,emailInput);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                AccountAdmin aa = new AccountAdmin(rs.getInt("admin_id"),rs.getString("email"),rs.getString("password"));
                return aa;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public boolean checkEmail(String emailInput) {

        String sql = "SELECT * FROM [Admin] WHERE email = ?";
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, emailInput);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    
                 //update password
    public void updatePasswordByName(String pass,String emailInput) {
        String sql = "  UPDATE [dbo].[Admin]\n"
                + "   SET [password] = ? \n"
                + " WHERE [email] = ?";
        
        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1,pass);
            st.setString(2,emailInput);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    
    

}

