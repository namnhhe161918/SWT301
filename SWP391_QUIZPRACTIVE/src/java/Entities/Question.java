/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author admin
 */
public class Question {
    private int question_id;
    private String question_name;
    private int course_id;

    public Question() {
    }

    public Question(String question_name, int course_id) {
        this.question_name = question_name;
        this.course_id = course_id;
    }
    
    public Question(int question_id, String question_name, int course_id) {
        this.question_id = question_id;
        this.question_name = question_name;
        this.course_id = course_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getQuestion_name() {
        return question_name;
    }

    public void setQuestion_name(String question_name) {
        this.question_name = question_name;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
    
    
}
