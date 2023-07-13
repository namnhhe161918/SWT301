/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author admin
 */
public class Errol {
    private int user_id, course_id;
    private String erroled_date;

    public Errol() {
    }

    public Errol(int user_id, int course_id, String erroled_date) {
        this.user_id = user_id;
        this.course_id = course_id;
        this.erroled_date = erroled_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getErroled_date() {
        return erroled_date;
    }

    public void setErroled_date(String erroled_date) {
        this.erroled_date = erroled_date;
    }
    
    
}
