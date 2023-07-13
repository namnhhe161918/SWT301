/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Exam_results;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import module.DBConnect;

/**
 *
 * @author admin
 */
public class DAOExam_results extends DBConnect{
    
    public Vector<Exam_results> getAll(String sql) {
        Vector<Exam_results> vector = new Vector<Exam_results>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int question_id = rs.getInt(1);
                int answer_choose = rs.getInt(2);
                int answer_id = rs.getInt(3);
                int is_correct = rs.getInt(4);
                String answer_name = rs.getString(5);
                Exam_results er = new Exam_results(question_id, answer_choose, answer_id, is_correct, answer_name);
                vector.add(er);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
}
