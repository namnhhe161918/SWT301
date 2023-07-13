/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Exam_details;
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
public class DAOExam_details extends DBConnect {
    
    public int addExamDetails(Exam_details ed) {
        int n = 0;
        String sql = "Insert into Exam_details"
                + " values (?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, ed.getUser_uid());
            pre.setInt(2, ed.getCourse_id());
            pre.setInt(3, ed.getQuestion_id());
            pre.setInt(4, ed.getAnswer_choose());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }
    
    public Vector<Exam_details> getAll(String sql) {
        Vector<Exam_details> vector = new Vector<Exam_details>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int user_id = rs.getInt(1);
                int course_id = rs.getInt(2);
                int question_id = rs.getInt(3);
                int answer_choose = rs.getInt(4);
                Exam_details ed = new Exam_details(user_id, course_id, question_id, answer_choose);
                vector.add(ed);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
    
    public int removeExamdetails (int user_id, int course_id) {
        int n = 0;
        String sql = "delete from Exam_details where user_id = " + user_id + " and course_id = " + course_id;
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }
}
