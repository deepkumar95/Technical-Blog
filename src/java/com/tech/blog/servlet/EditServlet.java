/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlet;

import com.tech.blog.Dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Deep Kumar
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String about=request.getParameter("about");
        Part part=request.getPart("image");
        String image=part.getSubmittedFileName();
        
        // get the current user and change the data in the session
        HttpSession sess=request.getSession();
        User user=(User)sess.getAttribute("currentUser");
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAbout(about);
        user.setProfile(image);
        
        // now update this to the database to update the database we simply use the UserDao class in which all the data function are their
        UserDao dao=new UserDao(ConnectionProvider.getConnection());
        boolean c=dao.updateUserProfile(user);
        if(c==true){
            String path=request.getRealPath("/")+"pic"+File.separator+user.getProfile();
            
            boolean b=Helper.saveFile(part.getInputStream(), path);
            if(b){
                Message msg=new Message("Profile Updated Successfully", " success","alert-success");
                sess.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }
            else{
                Message msg=new Message("Something went wrong...", "error","alert-danger");
                sess.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }
        }
        else{
            out.println("not updated");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
