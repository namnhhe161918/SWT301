/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author admin
 */
public class Exam_results {
    private int question_id, answer_choose, answer_id, is_correct;
    private String answer_name;

    public Exam_results() {
    }

    public Exam_results(int question_id, int answer_choose, int answer_id, int is_correct, String answer_name) {
        this.question_id = question_id;
        this.answer_choose = answer_choose;
        this.answer_id = answer_id;
        this.is_correct = is_correct;
        this.answer_name = answer_name;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public int getAnswer_choose() {
        return answer_choose;
    }

    public void setAnswer_choose(int answer_choose) {
        this.answer_choose = answer_choose;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public int getIs_correct() {
        return is_correct;
    }

    public void setIs_correct(int is_correct) {
        this.is_correct = is_correct;
    }

    public String getAnswer_name() {
        return answer_name;
    }

    public void setAnswer_name(String answer_name) {
        this.answer_name = answer_name;
    }
    
}
