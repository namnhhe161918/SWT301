/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;


/**
 *
 * @author admin
 */
public class Course {

    private int course_id;
    private int subject_id;
    private int mentor_id;
    private String course_name;
    private String description;
    private String image;
    private int is_publish;
    private int quantity;
    private String created_date;
    private String updated_date;

    public Course() {
    }

    public Course(String course_name, String description, String image, int is_publish) {
        this.course_name = course_name;
        this.description = description;
        this.image = image;
        this.is_publish = is_publish;
    }  
    public Course(String course_name, int mentor_id, String description, String image, int is_publish) {
        this.course_name = course_name;
        this.mentor_id = mentor_id;
        this.description = description;
        this.image = image;
        this.is_publish = is_publish;
    }  

    public Course(int course_id, int subject_id, int mentor_id, String course_name, String description, String image, int is_publish, int quantity, String created_date, String updated_date) {
        this.course_id = course_id;
        this.subject_id = subject_id;
        this.mentor_id = mentor_id;
        this.course_name = course_name;
        this.description = description;
        this.image = image;
        this.is_publish = is_publish;
        this.quantity = quantity;
        this.created_date = created_date;
        this.updated_date = updated_date;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getIs_publish() {
        return is_publish;
    }

    public void setIs_publish(int is_publish) {
        this.is_publish = is_publish;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(String updated_date) {
        this.updated_date = updated_date;
    }
    
    

}
