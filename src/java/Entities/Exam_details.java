/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author admin
 */
public class Exam_details {
    
    private int user_uid, course_id, question_id, answer_choose;

    public Exam_details() {
    }

    public Exam_details(int user_uid, int course_id, int question_id, int answer_choose) {
        this.user_uid = user_uid;
        this.course_id = course_id;
        this.question_id = question_id;
        this.answer_choose = answer_choose;
    }

    public int getUser_uid() {
        return user_uid;
    }

    public void setUser_uid(int user_uid) {
        this.user_uid = user_uid;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
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
    
    
}
