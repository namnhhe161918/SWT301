package DAO;

import Entities.AccountMentor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import module.DBConnect;

/**
 *
 * @author Admin
 */
public class DAOMentor extends DBConnect {

    //check emailInput & password
    public AccountMentor checkLogin(String emailInput, String password) {

        String sql = "SELECT [mentor_id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[describe_yourself]\n"
                + "      ,[fullname]\n"
                + "      ,[image]\n"
                + "      ,[display_name]\n"
                + "      ,[created_date]\n"
                + "      ,[address]\n"
                + "      ,[date_of_birth]\n"
                + "      ,[academic_level]\n"
                + "      ,[modify_date]\n"
                + "      ,[gender]\n"
                + "      ,[specialize]\n"
                + "      ,[role_id]\n"
                + "  FROM [QUIZ_PRACTICE].[dbo].[Mentor_type] WHERE email = ? AND password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AccountMentor ame = new AccountMentor(
                        rs.getInt("mentor_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id")
                );
                return ame;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //check exist
    public AccountMentor checkExist(String emailInput) {
        String sql = "SELECT * FROM [Mentor_type] WHERE email = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                AccountMentor ame = new AccountMentor(
                        rs.getInt("mentor_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id")
                );
                return ame;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //INSERT AccountMentor
    public void insertMentor(String emailInput, String password, String fullname, String displayname, String dob, int gender, int roleid) {
        String sql = "INSERT INTO [dbo].[Mentor_type]\n"
                + "           ([email]\n"
                + "           ,[password]\n"
                + "           ,[fullname]\n"
                + "           ,[display_name]\n"
                + "           ,[date_of_birth]\n"
                + "           ,[gender]\n"
                + "           ,[role_id])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            st.setString(2, password);
            st.setString(3, fullname);
            st.setString(4, displayname);
            st.setString(5, dob);
            st.setInt(6, gender);
            st.setInt(7, roleid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //CHECK EMAIL
    public boolean checkEmail(String emailInput) {

        String sql = "SELECT * FROM [Mentor_type] WHERE email = ?";
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
        String sql = "  UPDATE [dbo].[Mentor_type]\n"
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
    
          //update profile(fullname,describle yourself, image, display_name,address,modifiy date,dob, academic level, gender)
    public void updateProfile(int id,String descyouself, String fullname, String image, String displayname, String address, String dob, String academiclevel, String modifydate, int gender) {
        String sql = "UPDATE [dbo].[Mentor_type]\n"
                + "   SET [describe_yourself] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[display_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[date_of_birth] = ?\n"
                + "      ,[academic_level] = ?\n"
                + "      ,[modify_date] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE mentor_id = ?";

        try {
            PreparedStatement st = conn.prepareCall(sql);
            st.setString(1, descyouself);
            st.setString(2, fullname);
            st.setString(3, image);
            st.setString(4, displayname);
            st.setString(5, address);
            st.setString(6, dob);
            st.setString(7, academiclevel);
            st.setString(8, modifydate);
            st.setInt(9, gender);
            st.setInt(10, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


//delete
    public void deleteMentor(int mentorId) {
        String sql = "DELETE FROM [Mentor_type] WHERE mentor_id = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, mentorId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String args[]) {
        DAOMentor dudb = new DAOMentor();
        AccountMentor au = dudb.checkLogin("TranQuyBan@gmail.com", "12345");

        System.out.println(au.getDisplay_name());
    }
}
