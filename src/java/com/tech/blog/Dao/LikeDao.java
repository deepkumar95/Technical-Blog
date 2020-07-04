/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Deep Kumar
 */
public class LikeDao {
    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    public boolean insertLike(int pid, int uid){
        try{
            String query="Insert into Liked(pid, uid) value(?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, pid);
            stmt.setInt(2, uid);
            stmt.executeUpdate();
            return true;
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public boolean deleteLike(int pid, int uid){
        try{
            String query="Delete From Liked where uid=? and pid=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, uid);
            stmt.setInt(2, pid);
            stmt.executeUpdate();
            return true;
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public boolean isLikedByUser(int pid, int uid){
        try{
            String query="Select * from Liked where uid=? and pid=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, uid);
            stmt.setInt(2,pid);
            ResultSet set=stmt.executeQuery();
            if(set.next()){
                return true;
            }
        }
        
        catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public int countLike(int pid){
        int count=0;
        try{
            String query="Select * from Liked where pid=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, pid);
            ResultSet set=stmt.executeQuery();
            while(set.next()){
                count++;
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return count;
    }
    
}
