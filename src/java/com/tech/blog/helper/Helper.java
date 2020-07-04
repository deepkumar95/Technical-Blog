/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Deep Kumar
 */
public class Helper {
    private static boolean flag;
    public static boolean deleteFile(String path){
        flag=false;
        try{
            File f=new File(path);
            f.delete();
            flag=true;
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return flag;
    }
    public static boolean saveFile(InputStream is, String path){
        
        boolean flag=false;
        try{
            byte[] b=new byte[is.available()];
            is.read(b);
            
            FileOutputStream stream=new FileOutputStream(path);
            stream.write(b);
            stream.flush();
            stream.close();
            flag=true;
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return flag;
    }
}
