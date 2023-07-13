/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author admin
 */
public class Answer {
    private int answer_id;
    private String answer_name;
    private int is_correct;
    private int question_id;

    public Answer() {
    }

    public Answer(String answer_name, int is_correct, int question_id) {
        this.answer_name = answer_name;
        this.is_correct = is_correct;
        this.question_id = question_id;
    }
    
    public Answer(int answer_id, String answer_name, int is_correct, int question_id) {
        this.answer_id = answer_id;
        this.answer_name = answer_name;
        this.is_correct = is_correct;
        this.question_id = question_id;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public String getAnswer_name() {
        return answer_name;
    }

    public void setAnswer_name(String answer_name) {
        this.answer_name = answer_name;
    }

    public int getIs_correct() {
        return is_correct;
    }

    public void setIs_correct(int is_correct) {
        this.is_correct = is_correct;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }
    
}
