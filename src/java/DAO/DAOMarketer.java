/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package DAO;

import Entities.AccountMarketer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import module.DBConnect;

/**
 *
 * @author Admin
 */
public class DAOMarketer extends DBConnect {
    
    
    public AccountMarketer getById(int id){
        String sql = "SELECT * FROM Marketer_type WHERE marketer_id = ?";
        try {
             PreparedStatement st = conn.prepareStatement(sql);
             st.setInt(1, id);
             ResultSet rs = st.executeQuery();
             if(rs.next()){
                 AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
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
                        rs.getInt("role_id") );
                 
                 return am;
             }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return null;
    }

    public AccountMarketer checkLogin(String emailInput, String password) {
        String sql = "SELECT[marketer_id]\n"
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
                + "      ,[role_id]\n"
                + "  FROM [QUIZ_PRACTICE].[dbo].[Marketer_type] WHERE email = ? AND password = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
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
                return am;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    //check exist
    public AccountMarketer checkExist(String emailInput) {
        String sql = "SELECT[marketer_id]\n"
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
                + "      ,[role_id]\n" +
        "  FROM [QUIZ_PRACTICE].[dbo].[Marketer_type] WHERE email = ?";
        
        try {
             PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, emailInput);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
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
                return am;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
     public boolean checkEmail(String emailInput) {

        String sql = "SELECT * FROM [Marketer_type] WHERE email = ?";
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
        String sql = "  UPDATE [dbo].[Marketer_type]\n"
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
    public void updateProfile(int id, String descyouself, String fullname, String image, String displayname, String address, String dob, String academiclevel, String modifydate, int gender) {
        String sql = "UPDATE [dbo].[Marketer_type]\n"
                + "   SET [describe_yourself] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[display_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[date_of_birth] = ?\n"
                + "      ,[academic_level] = ?\n"
                + "      ,[modify_date] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE marketer_id = ?";

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
//deleteMarketer
public void deleteMarketer(int marketerId) {
    String sql = "DELETE FROM Marketer_type WHERE marketer_id = ?";
    
    try {
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, marketerId);
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


    public static void main(String args[]) {
        DAOMarketer dudb = new DAOMarketer();
        AccountMarketer au = dudb.checkLogin("TranThiB@gmail.com", "12345");

        System.out.println(au.getDisplay_name());
    }
}
