/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author Admin
 */
public class Slider {

    private String url, content, note;
    private boolean isShow;
    private int slider_id, subject_id;
    Subject s;

    public Slider() {
    }

    public Slider(int slider_id, String url, String content, String note, boolean isShow, int subject_id) {
        this.slider_id = slider_id;
        this.url = url;
        this.content = content;
        this.note = note;
        this.isShow = isShow;
        this.subject_id = subject_id;
    }

    public Slider(int slider_id, String url, String content, String note, boolean isShow, int subject_id, Subject s) {
        this.slider_id = slider_id;
        this.url = url;
        this.content = content;
        this.note = note;
        this.isShow = isShow;
        this.subject_id = subject_id;
        this.s = s;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isIsShow() {
        return isShow;
    }

    public void setIsShow(boolean isShow) {
        this.isShow = isShow;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getSlider_id() {
        return slider_id;
    }

    public void setSlider_id(int slider_id) {
        this.slider_id = slider_id;
    }

    public Subject getS() {
        return s;
    }

    public void setS(Subject s) {
        this.s = s;
    }

}
