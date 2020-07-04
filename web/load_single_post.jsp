<%-- 
    Document   : load_single_post
    Created on : 24 Jun, 2020, 2:43:43 PM
    Author     : Deep Kumar
--%>
<%@page import="com.tech.blog.Dao.LikeDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<% 
    
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
%>
<% 
    PostDao dao=new PostDao(ConnectionProvider.getConnection());
    Post post=dao.getPostById(Integer.parseInt(request.getParameter("post_Id")));
    int pid=Integer.parseInt(request.getParameter("post_Id"));
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!-- library for the fonts -->
        <link href="http://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet" type="text/css" />
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 83%, 95% 93%, 68% 88%, 19% 100%, 0 91%, 0% 35%, 0 0);
            }
        </style>
    </head>
    <body>
         
        <main class="banner-background  ">
            <div class="bg-image container_fluid text-white">
               
             <% if(post.getPpic().equals(" ")){
             
            %>
                   
                <img src="pic/default_image.png" class="card-img-top" alt="default_image" ">
                   
            <%
                }
                else{
            %>
                <img src="images/<%= post.getPpic() %>" class="card-img-top" alt="default_image" ">
              
            <%
                }
            %>
                
            </div>

            <div class="bg-text" >
               
                <div class="card " style="width: 40rem; margin-left:68px; opacity:0.9;">
                    <% if(post.getPpic().equals(" ")){

                    %>

                    <img src="pic/default_image.png" class="card-img-top" alt="default_image" height="300px;">

                     <%
                         }
                         else{
                     %>
                         <img src="images/<%= post.getPpic() %>" class="card-img-top" alt="default_image" height="300px;">

                     <%
                         }
                     %>
                    <!--card body section-->
                     
                    <div class="card-body ">
                        
                        <div class="container_fluid">
                            <div class="row">
                                <div class="col-md-1">
                                    <span class="fa fa-user-circle-o fa-3x" ></span>
                                </div>
                                <div class="col-md-11">
                                    <span class="card-text "><%= user.getName() %></span>
                                    <h5> <%= user.getEmail() %></h5>
                                </div>
                            </div> 
                        </div>
                        <h5 class="card-title"><%= post.getPtitle() %></h5>
                        <p class="card-text"><%= post.getPcontent() %></p>
                        <p class="card-text"> 
                             <%
                                String date= new SimpleDateFormat("dd/MM/yyyy").format(post.getPdime());
                                String time= new SimpleDateFormat("HH:mm").format(post.getPdime());
                             %> 
                        </p>
                        <p class="card-text"> <h6>Date: <%= date %></h6> </p>
                        <p class="card-text"> <h6>Time: <%= time %></h6> </p>
                        <div class="jumbotron bg-dark text-white " > <%= post.getPcode() %></div>
                    </div>
                    
                     <!--card footer section-->
                     <%
                         LikeDao dao1=new LikeDao(ConnectionProvider.getConnection());
                         
                     %>
                     
                    <div class="card-footer text-center primary-background">
                        <a onclick="getLike(<%= pid %>, <%= user.getId() %>)" class="btn btn-outline-light" style="border-radius:20%; "><span class="fa fa-thumbs-o-up fa-2x"></span><span><%= dao1.countLike(pid) %></span></a>
                        <a  class="btn  btn-outline-light" style="border-radius:30%; "><span class="fa fa-commenting-o fa-2x"></span><span> 30</span></a>
                    </div>
               </div>
                
            </div>
            
        </main>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
