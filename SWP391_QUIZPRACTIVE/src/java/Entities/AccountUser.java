/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

import java.sql.Date;

/**
 *
 * @author QUANG HAO
 */
public class AccountUser {

    private int user_id;
    private String email;
    private String password;
    private String descyourself;
    private String fullName;
    private String image;
    private String display_name;
    private String created_date;
    private String address;
    private String dob;
    private String academiclevel;
    private String modify_date;
    private int gender;
    private int role_id;

    public AccountUser() {
    }

    public AccountUser(int user_id, String email, String password, String descyourself, String fullName, String image, String display_name, String created_date, String address, String dob, String academiclevel, String modify_date, int gender, int role_id) {
        this.user_id = user_id;
        this.email = email;
        this.password = password;
        this.descyourself = descyourself;
        this.fullName = fullName;
        this.image = image;
        this.display_name = display_name;
        this.created_date = created_date;
        this.address = address;
        this.dob = dob;
        this.academiclevel = academiclevel;
        this.modify_date = modify_date;
        this.gender = gender;
        this.role_id = role_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDisplay_name() {
        return display_name;
    }

    public void setDisplay_name(String display_name) {
        this.display_name = display_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getModify_date() {
        return modify_date;
    }

    public void setModify_date(String modify_date) {
        this.modify_date = modify_date;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getDescyourself() {
        return descyourself;
    }

    public void setDescyourself(String descyourself) {
        this.descyourself = descyourself;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getAcademiclevel() {
        return academiclevel;
    }

    public void setAcademiclevel(String academiclevel) {
        this.academiclevel = academiclevel;
    }

    
    
}
