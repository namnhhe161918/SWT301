/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.AccountUser;
import Entities.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import module.DBConnect;

public class DAOUser extends DBConnect {

    //check emailInput & password
    public AccountUser checkLogin(String emailInput, String password) {

        String sql = "SELECT * FROM User_type WHERE email = ? AND password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AccountUser au = new AccountUser(
                        rs.getInt("user_id"),
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
                return au;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //check exist
    public AccountUser checkExist(String emailInput) {
        String sql = "SELECT * FROM User_type WHERE email = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                AccountUser au = new AccountUser(
                        rs.getInt("user_id"),
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
                return au;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //INSERT AccountUser
    public void insertUser(String emailInput, String password, String fullname, String displayname, String dob, int gender, int roleid) {
        String sql = "INSERT INTO [dbo].[User_type]\n"
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

        String sql = "SELECT * FROM [User_type] WHERE email = ?";
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
        String sql = "  UPDATE [dbo].[User_type]\n"
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
    public void updateProfile(int id , String descyouself, String fullname, String image, String displayname, String address, String dob, String academiclevel, String modifydate, int gender) {
        String sql = "UPDATE [dbo].[User_type]\n"
                + "   SET [describe_yourself] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[display_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[date_of_birth] = ?\n"
                + "      ,[academic_level] = ?\n"
                + "      ,[modify_date] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE user_id = ?";

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
    
    public Vector<AccountUser> getAll(String sql) {
        Vector<AccountUser> vector = new Vector<AccountUser>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int user_id = rs.getInt(1);
                String email = rs.getString(2);
                String password = rs.getString(3);
                String descyourself = rs.getString(4);
                String fullName = rs.getString(5);
                String image = rs.getString(6);
                String display_name = rs.getString(7);
                String created_date = rs.getString(8);
                String address = rs.getString(9);
                String dob = rs.getString(10);
                String academiclevel = rs.getString(11);
                String modify_date = rs.getString(12);
                int gender = rs.getInt(13);
                int role_id = rs.getInt(14);
                AccountUser au = new AccountUser(user_id, email, password, descyourself, fullName, image, display_name, created_date, address, dob, academiclevel, modify_date, gender, role_id);
                vector.add(au);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
  //deleteUser
    public void deleteUser(int userId) {
        String sql = "DELETE FROM [User_type] WHERE user_id = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAOUser dudb = new DAOUser();
        AccountUser au = dudb.checkLogin("ngohuunam2002@gmail.com", "123456789");
        System.out.println(au.getDisplay_name());
    }
}
