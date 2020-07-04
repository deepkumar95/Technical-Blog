/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.Dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Deep Kumar
 */
public class UserDao {
    private Connection con;
    
    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method for insert the  user to the database
    
    public boolean saveUser(User user){
        boolean flag=false;
        try{
            
            String query="Insert into user(name, email, password, gender, about) value(?,?,?,?,?)";
            PreparedStatement  stmt=con.prepareStatement(query);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getGender());
            stmt.setString(5, user.getAbout());
            stmt.executeUpdate();
            flag=true;
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return flag;
    }
    
    // Method for searching the user with the email and password
    
    public User getUserByEmailAndPassword(String email, String password){
       User user=null;
       try{
           String query="Select * from user where email=? and password=?";
           PreparedStatement stmt=con.prepareStatement(query);
           stmt.setString(1, email);
           stmt.setString(2, password);
           
           ResultSet set=stmt.executeQuery();
           if(set.next()){
               user=new User();
               user.setId(set.getInt("id"));
               user.setName(set.getString("name"));
               user.setEmail(set.getString("Email"));
               user.setPassword(set.getString("password"));
               user.setGender(set.getString("gender"));
               user.setAbout(set.getString("about"));
               user.setTimestamp(set.getTimestamp("current"));
               user.setProfile(set.getString("profile"));
              
           }
       }
       catch(Exception ex){
           ex.printStackTrace();
       }
       return user;
    }
    public boolean updateUserProfile(User user){
        boolean flag=false;
        try{
            String query="Update user set name=?, email=?, password=?, about=?, gender=?, profile=? where id=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getAbout());
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getProfile());
            stmt.setInt(7, user.getId());
            stmt.executeUpdate();
            flag=true;
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return flag;
    }
    
}
