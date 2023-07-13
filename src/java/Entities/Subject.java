/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author admin
 */
public class Subject {
    private String subject_name, image;
    private String tilte, description;
    private boolean status;
    private int subject_id;

    public Subject() {
    }

    public Subject(String subject_name, String image) {
        this.subject_name = subject_name;
        this.image = image;
    }

    public Subject(int subject_id,String subject_name, String image, String tilte, String description, boolean status) {
        this.subject_id = subject_id;
        this.subject_name = subject_name;
        this.image = image;
        this.tilte = tilte;
        this.description = description;
        this.status = status;
    }

    
    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTilte() {
        return tilte;
    }

    public void setTilte(String tilte) {
        this.tilte = tilte;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }
    
}
