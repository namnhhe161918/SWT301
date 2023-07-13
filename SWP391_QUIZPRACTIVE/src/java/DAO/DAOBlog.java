/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Blog;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import module.DBConnect;

/**
 *
 * @author Admin
 */
public class DAOBlog extends DBConnect {

    //count
    public int countBlog() {
        String sql = "SELECT COUNT(*) FROM Blog";
        int total = 0;

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

//    //getbyId
    public Blog getById(String id) {
        String sql = "SELECT * FROM Blog WHERE blog_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,Integer.parseInt(id));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
    

    //getAll
    public HashMap<Blog,Integer> getAll() {
       HashMap<Blog,Integer> hashMapBlog = new HashMap<>();
       
        String sql = "SELECT * FROM Blog";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                hashMapBlog.put(b, countById(rs.getInt("blog_id")));
            }
            return hashMapBlog;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<Blog> getAll2(){
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    //count by id post
    public int countById(int id){
        String sql = "SELECT COUNT(*) FROM Blog b  INNER JOIN Post p ON b.blog_id = p.blog_id  WHERE b.blog_id = ?";
        int num = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
               num = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return num;
    }

    public static void main(String[] args) {
        DAOBlog bdb = new DAOBlog();
//        System.out.println(bdb.countById(3));

        HashMap<Blog,Integer> hashmapBlog = bdb.getAll();
        Set<Blog> keySet = hashmapBlog.keySet();
        for (Blog key : keySet) {
            System.out.println(key.getBlog_id()+ " - " + hashmapBlog.get(key));
        }
    }
}
