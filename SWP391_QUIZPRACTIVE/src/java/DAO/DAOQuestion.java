/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Entities.Question;
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
public class DAOQuestion extends DBConnect{
    
    public int addQuestion(Question question) {
        int n = 0;
        String sql = "Insert into Question(question_name, course_id)"
                + " values (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, question.getQuestion_name());
            pre.setInt(2, question.getCourse_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public Vector<Question> getAll(String sql) {
        Vector<Question> vector = new Vector<Question>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int question_id = rs.getInt(1);
                String question_name = rs.getString(2);
                int course_id = rs.getInt(3);
                Question question = new Question(question_id, question_name, course_id);
                vector.add(question);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
    
    public int updateQuestion(Question question) {
        int n = 0;
        String sql = "UPDATE Question set question_name = N'" + question.getQuestion_name() + "'  where question_id = " + question.getQuestion_id();
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
}
