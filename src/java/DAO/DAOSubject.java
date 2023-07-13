/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import module.DBConnect;

/**
 *
 * @author admin
 */
public class DAOSubject extends DBConnect {

    //getall
    public List<Subject> getAll() {
        String sql = "SELECT * FROM Subject";
        List<Subject> list = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject s = new Subject(rs.getInt("subject_id"), rs.getString("subject_name"), rs.getString("image"), rs.getString("title"), rs.getString("description"), rs.getBoolean("status"));
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get by id
    public Subject getById(int id) {
        String sql = "SELECT * FROM Subject WHERE subject_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Subject s = new Subject(rs.getInt("subject_id"), rs.getString("subject_name"), rs.getString("image"), rs.getString("title"), rs.getString("description"), rs.getBoolean("status"));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int deleteSubject(int id) {
        int n = 0;
        String sql = "delete from Subject\n "
                + "where subject_id =?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            n = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return n;
    }

    //add
    public int addSubject(Subject subject) {
        int n = 0;
        String sql = "Insert into [Subject]([subject_name], [image])"
                + " values (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, subject.getSubject_name());
            pre.setString(2, subject.getImage());
            //run
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }

    public int updateSubject(Subject subject) {
        int n = 0;
        String sql = "UPDATE [dbo].[Subject]\n"
                + "   SET [subject_name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE [subject_id] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setString(1, subject.getSubject_name());
            pre.setString(2, subject.getImage());
            pre.setString(3, subject.getTilte());
            pre.setBoolean(4, subject.getStatus());
            pre.setString(5, subject.getDescription());
            pre.setInt(6, subject.getSubject_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
}
