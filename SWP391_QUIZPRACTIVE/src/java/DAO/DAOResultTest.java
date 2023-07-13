/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.ResultTest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import module.DBConnect;

/**
 *
 * @author admin
 */
public class DAOResultTest extends DBConnect{
    
    public int addResultTest(ResultTest resulttest) {
        int n = 0;
        String sql = "Insert into Result_test(user_id, course_id, status, score)"
                + " values (?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, resulttest.getUser_id());
            pre.setInt(2, resulttest.getCourse_id());
            pre.setString(3, resulttest.getStatus());
            pre.setDouble(4, resulttest.getGrade());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }
    
    public Vector<ResultTest> getAll(String sql) {
        Vector<ResultTest> vector = new Vector<ResultTest>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int user_id = rs.getInt(1);
                int course_id = rs.getInt(2);
                String status = rs.getString(3);
                double grade = rs.getDouble(4);
                ResultTest rt = new ResultTest(user_id, course_id, status, grade);
                vector.add(rt);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
    
    public int removeResultTest (int user_id, int course_id) {
        int n = 0;
        String sql = "delete from Result_test where user_id = " + user_id + " and course_id = " + course_id;
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }
}
