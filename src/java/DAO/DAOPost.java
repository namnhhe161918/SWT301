/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.AccountMarketer;
import Entities.Blog;
import Entities.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import module.DBConnect;

/**
 *
 * @author Admin
 */
public class DAOPost extends DBConnect {

    //getbyid
    public Post getById(int id) {
        String sql = "SELECT * FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id\n"
                + "INNER JOIN Blog b ON p.blog_id = b.blog_id WHERE p.post_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id"));
                Post p = new Post(rs.getInt("post_id"), rs.getInt("marketer_id"), rs.getInt("blog_id"), rs.getInt("subject_id"), rs.getString("tittle"), rs.getDate("posted_date"), rs.getDate("updated_date"), rs.getString("image"), rs.getString("content"), rs.getString("short_content"), rs.getString("status"), b, am);
                return p;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

//    getByid and except id of blog detail current
    public ArrayList<Post> ListPostExceptCurrent(String id) {
        ArrayList<Post> list = new ArrayList<>();
        for (Post post : list) {
            
        }
        String sql = "SELECT TOP(5)* FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id INNER JOIN Blog b ON p.blog_id = b.blog_id WHERE p.status = 'approved' \n"
                + "AND p.post_id != ? \n"
                + "AND p.blog_id = (SELECT blog_id FROM Post WHERE post_id = ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));
            st.setInt(2, Integer.parseInt(id));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id"));
                list.add(new Post(rs.getInt("post_id"), rs.getInt("marketer_id"), rs.getInt("blog_id"), rs.getInt("subject_id"), rs.getString("tittle"), rs.getDate("posted_date"), rs.getDate("updated_date"), rs.getString("image"), rs.getString("content"), rs.getString("short_content"), rs.getString("status"), b, am));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    //latest post
    public Post getTop1Post() {
        String sql = "SELECT TOP(1)* FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id INNER JOIN Blog b ON p.blog_id = b.blog_id WHERE p.status = 'approved' ORDER BY p.post_id DESC";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id"));
                Post p = new Post(rs.getInt("post_id"), rs.getInt("marketer_id"), rs.getInt("blog_id"), rs.getInt("subject_id"), rs.getString("tittle"), rs.getDate("posted_date"), rs.getDate("updated_date"), rs.getString("image"), rs.getString("content"), rs.getString("short_content"), rs.getString("status"), b, am);
                return p;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    //select blog list
    public ArrayList<Post> selectBlogList(String sort, String keyname, int offset) {
        String sortby = "";
        switch (sort) {
            case "1":
                sortby = "ORDER BY p.post_id DESC";
                break;
            case "2":
                sortby = "ORDER BY p.posted_date DESC";
                break;
            default:
                sortby = "ORDER BY p.post_id ASC";

        }
        ArrayList<Post> list = new ArrayList<>();
        String sql = "SELECT * FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id\n"
                + "INNER JOIN Blog b ON p.blog_id = b.blog_id\n"
                + "WHERE p.status = 'approved' AND  p.tittle LIKE ? " + sortby + "  OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + keyname + "%");
            st.setInt(2, (offset - 1) * 4);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id"));
                list.add(new Post(rs.getInt("post_id"), rs.getInt("marketer_id"), rs.getInt("blog_id"), rs.getInt("subject_id"), rs.getString("tittle"), rs.getDate("posted_date"), rs.getDate("updated_date"), rs.getString("image"), rs.getString("content"), rs.getString("short_content"), rs.getString("status"), b, am));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    //select blog list
    public ArrayList<Post> selectBlogList(String sort, String keyname, int offset, String blog_id) {
        String sortby = "";
        switch (sort) {
            case "1":
                sortby = "ORDER BY p.post_id DESC";
                break;
            case "2":
                sortby = "ORDER BY p.posted_date DESC";
                break;
            default:
                sortby = "ORDER BY p.post_id ASC";

        }
        ArrayList<Post> list = new ArrayList<>();
        String sql = "SELECT * FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id\n"
                + "INNER JOIN Blog b ON p.blog_id = b.blog_id\n"
                + "WHERE p.status = 'approved' AND p.tittle LIKE ? AND b.blog_id = ? " + sortby + "  OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + keyname + "%");
            st.setInt(2, Integer.parseInt(blog_id));
            st.setInt(3, (offset - 1) * 4);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id"));
                list.add(new Post(rs.getInt("post_id"), rs.getInt("marketer_id"), rs.getInt("blog_id"), rs.getInt("subject_id"), rs.getString("tittle"), rs.getDate("posted_date"), rs.getDate("updated_date"), rs.getString("image"), rs.getString("content"), rs.getString("short_content"), rs.getString("status"), b, am));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    //getAll verision 2
    public List<Post> getAllPost2(String key, int offset, int base) {
        List<Post> list = new ArrayList<>();
        String sql = "SELECT * FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id\n"
                + "INNER JOIN Blog b ON p.blog_id = b.blog_id\n"
                + "WHERE  p.tittle LIKE ? ORDER BY p.post_id  OFFSET ? ROW FETCH NEXT " + base + " ROWS ONLY";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            st.setInt(2, (offset - 1) * base);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blog_id"), rs.getString("blog_name"));
                AccountMarketer am = new AccountMarketer(
                        rs.getInt("marketer_id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("describe_yourself"),
                        rs.getString("fullname"),
                        rs.getString("image"),
                        rs.getString("display_name"),
                        rs.getString("created_date"),
                        rs.getString("address"),
                        rs.getString("date_of_birth"),
                        rs.getString("academic_level"),
                        rs.getString("modify_date"),
                        rs.getInt("gender"),
                        rs.getInt("role_id"));
                list.add(new Post(rs.getInt("post_id"), rs.getInt("marketer_id"), rs.getInt("blog_id"), rs.getInt("subject_id"), rs.getString("tittle"), rs.getDate("posted_date"), rs.getDate("updated_date"), rs.getString("image"), rs.getString("content"), rs.getString("short_content"), rs.getString("status"), b, am));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get number of post
    public int getNumberPost(String search) {
        String sql = "SELECT COUNT(*) FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id\n"
                + "INNER JOIN Blog b ON p.blog_id = b.blog_id\n"
                + "WHERE b.blog_name LIKE ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getNumberPost(String search, String blog_id) {
        String sql = "SELECT COUNT(*) FROM Post p INNER JOIN Marketer_type ma ON p.marketer_id = ma.marketer_id\n"
                + "INNER JOIN Blog b ON p.blog_id = b.blog_id\n"
                + "WHERE b.blog_name LIKE ? AND b.blog_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setInt(2, Integer.parseInt(blog_id));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    //insert
    public void insertPost(int marketerid, String tittle, String shortcontent, String content, int blogId, int subjectId, String status, String thumbnail) {
        String sql = "INSERT INTO [dbo].[Post]\n"
                + "           ([marketer_id]\n"
                + "           ,[subject_id]\n"
                + "           ,[blog_id]\n"
                + "           ,[tittle]\n"
                + "           ,[image]\n"
                + "           ,[content]\n"
                + "           ,[short_content]\n"
                + "           ,[status]) VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, marketerid);
            st.setInt(2, subjectId);
            st.setInt(3, blogId);
            st.setString(4, tittle);
            st.setString(5, thumbnail);
            st.setString(6, content);
            st.setString(7, shortcontent);
            st.setString(8, status);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //update
    public void updatePost(String tittle, String shortcontent, String content, int blogId, int subjectId, String status, Date updatePost, String thumbnail, int postId) {
        String sql = "UPDATE [dbo].[Post]\n"
                + "   SET [subject_id] = ?\n"
                + "      ,[blog_id] = ?\n"
                + "      ,[tittle] = ?\n"
                + "      ,[updated_date] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[short_content] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE post_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, subjectId);
            st.setInt(2, blogId);
            st.setString(3, tittle);
            st.setDate(4, (java.sql.Date) updatePost);
            st.setString(5, thumbnail);
            st.setString(6, content);
            st.setString(7, shortcontent);
            st.setString(8, status);
            st.setInt(9, postId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //delete
    public boolean delete(int postId) {
        String sql = "DELETE FROM [dbo].[Post]\n"
                + "      WHERE post_id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, postId);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.getMessage();
        }
        return false;
    }

    public static void main(String[] args) {
        DAOPost dpdb = new DAOPost();
//        System.out.println(dpdb.getNumberPost("C"));
//        ArrayList<Post> list = dpdb.selectBlogList("1", "", 1);
//        for (Post post : list) {
//            System.out.println(post.getShort_content());
//        }

//        Post p = dpdb.getTop1Post();
//        System.out.println(p.getB().getBlog_name());
//
//        Post p = dpdb.getById(1);
//        System.out.println(p.getContent());
//        Post p = dpdb.getTop1Post();
//        System.out.println(p.getB().getBlog_name());
//        Post p = dpdb.getById(13);
//        System.out.println(p.getStatus());
//        dpdb.insertPost(1, "This is title", "This is short content", "this is content", 1, 1, "pending", "");
    }

}
