/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;
import module.DBConnect;

/**
 *
 * @author admin
 */
public class DAOCourse extends DBConnect {

    LocalDate date1 = LocalDate.now();
    LocalDate date2 = LocalDate.now();

    public int addCourse(int subject_id, Course course) {
        int n = 0;
        String sql = "Insert into [Course]([subject_id], [course_name], [description], [image], [is_publish], [created_date]) "
                + "values (" + subject_id
                + ", N'" + course.getCourse_name()
                + "', N'" + course.getDescription()
                + "', '" + course.getImage()
                + "', " + course.getIs_publish()
                + ", '" + date1
                + "')";
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int addCourseByMentor(int subject_id, Course course) {
        int n = 0;
        String sql = "Insert into [Course]([subject_id], [mentor_id], [course_name], [description], [image], [is_publish], [created_date]) "
                + "values (" + subject_id
                + ", "+ course.getMentor_id()
                + ", N'" + course.getCourse_name()
                + "', N'" + course.getDescription()
                + "', '" + course.getImage()
                + "', " + course.getIs_publish()
                + ", '" + date1
                + "')";
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateCourse(Course course) {
        int n = 0;
        String sql = "UPDATE Course set course_name = N'" + course.getCourse_name() + "', description = N'" + course.getDescription() + "', image = '" + course.getImage() + "', updated_date = '" + date2 + "' where course_id = " + course.getCourse_id();
        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateQuantity(Course course) {
        int n = 0;
        String sql = "UPDATE Course set quantity = " + (course.getQuantity() + 1) + " where course_id = " + course.getCourse_id();

        try {
            Statement statement = conn.createStatement();
            n = statement.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Vector<Course> getAll(String sql) {
        Vector<Course> vector = new Vector<Course>();
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                int course_id = rs.getInt(1);
                int subject_id = rs.getInt(2);
                int mentor_id = rs.getInt(3);
                String course_name = rs.getString(4);
                String description = rs.getString(5);
                String image = rs.getString(6);
                int is_publish = rs.getInt(7);
                int quantity = rs.getInt(8);
                String created_date = rs.getString(9);
                String updated_date = rs.getString(10);
                Course course = new Course(course_id, subject_id, mentor_id, course_name, description, image, is_publish, quantity, created_date, updated_date);
                vector.add(course);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public int deleteCourseByCourseID(int id) {
        int n = 0;
        String sql = "delete from Course\n "
                + "where course_id =?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            n = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return n;
    }

    public int getEndPage(String sql) {
        int endPage = 0;
        Vector<Course> vector = getAll(sql);
        endPage = vector.size() / 12;
        if (vector.size() % 12 != 0) {
            endPage++;
        }
        return endPage;
    }
    
    public static void main(String[] args) {
        DAOCourse dao = new DAOCourse();
        Course course = new Course("C nang cao",1 , "Hoc C nang cao", "./assets/images/categories/CourseC(1).png", 1);
        int n = dao.addCourseByMentor(1, course);
        if (n > 0) {
            System.out.println("add success");
        }
    }
    
}
