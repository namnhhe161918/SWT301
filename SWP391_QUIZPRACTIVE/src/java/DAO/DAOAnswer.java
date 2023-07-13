/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Entities.Answer;
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
public class DAOAnswer extends DBConnect{
    
    public int addAnswer(Answer answer) {
        int n = 0;
        String sql = "Insert into Answer(answer_name, is_correct, question_id)"
                + " values (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, answer.getAnswer_name());
            pre.setInt(2, answer.getIs_correct());
            pre.setInt(3, answer.getQuestion_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }
    
    public Vector<Answer> getAll(String sql) {
        Vector<Answer> vector = new Vector<Answer>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int answer_id = rs.getInt(1);
                String answer_name = rs.getString(2);
                int is_correct = rs.getInt(3);
                int question_id = rs.getInt(4);
                Answer answer = new Answer(answer_id, answer_name, is_correct, question_id);
                vector.add(answer);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
    
    public int updateAnswer(Answer answer) {
        int n = 0;
        String sql = "UPDATE Answer set answer_name = N'" + answer.getAnswer_name() + "', is_correct = " + answer.getIs_correct() +  "  where answer_id = " + answer.getAnswer_id();
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
}
