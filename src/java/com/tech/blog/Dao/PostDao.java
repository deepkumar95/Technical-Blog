/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.Dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Deep Kumar
 */
public class PostDao {
    public static int count;
    Connection con;
    public PostDao(Connection con){
        this.con=con;
    }
    public ArrayList<Category> getCategory(){
        ArrayList<Category> list=new ArrayList<>();
        try{
            String query="Select * from category";
            Statement stmt=con.createStatement();
            ResultSet set=stmt.executeQuery(query);
            while(set.next()){
                int id=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category cat=new Category(id, name, description);
                list.add(cat);
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return list;
       
    }
    public boolean addPost(Post post){
        boolean flag=false;
        try{
            String query="Insert into post(ptitle, pcontent, pcode, ppic, catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, post.getPtitle());
            stmt.setString(2, post.getPcontent());
            stmt.setString(3, post.getPcode());
            stmt.setString(4, post.getPpic());
            stmt.setInt(5, post.getCatId());
            stmt.setInt(6, post.getUserId());
            
            stmt.executeUpdate();
            flag=true;
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return flag;
    }
    public List<Post> getAllPost(){
        count=0;
        List<Post> list=new ArrayList<Post>();
        try{
            String query="Select * from post";
            Statement stmt=con.createStatement();
            ResultSet set=stmt.executeQuery(query);
            while(set.next()){
                int pid=set.getInt("pid");
                String title=set.getString("ptitle");
                String content=set.getString("pcontent");
                String  code=set.getString("pcode");
                String pic=set.getString("ppic");
                Timestamp time=set.getTimestamp("pdate");
                int cid=set.getInt("catId");
                int userId=set.getInt("userId");
                Post post=new Post(pid, title, content, code, pic, time, cid, userId);
                list.add(post);
                count++;
                
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return list;
    }
    public List<Post> getPostByCatId(int catId){
        count=0;
        List<Post> list=new ArrayList<Post>();
        try{
            String query="Select * from post where catId=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, catId);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String title=set.getString("ptitle");
                String content=set.getString("pcontent");
                String  code=set.getString("pcode");
                String pic=set.getString("ppic");
                Timestamp time=set.getTimestamp("pdate");
                
                int userId=set.getInt("userId");
                Post post=new Post(pid, title, content, code, pic, time, catId, userId);
                list.add(post);
                count++;
                
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return list;
    }
    public Post getPostById(int pid){
        Post post=null;
        try{
            String query="Select * from post where pid=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, pid);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                String title=set.getString("ptitle");
                String content=set.getString("pcontent");
                String code=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp time=set.getTimestamp("pdate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                post=new Post(title, content, code, ppic, time, catId, userId);
                return post;
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return post;
    }
}
