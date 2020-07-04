<%-- 
    Document   : profile
    Created on : 20 Jun, 2020, 8:53:33 PM
    Author     : Deep Kumar
--%>

<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.Dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
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
        
       
        
        
        <!-- Navbar secion is  started here -->
        
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-laptop fa-1x"></span>Technical Blog</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                  <a class="nav-link" href="#"><span class="fa fa-code fa-1x"></span>LearnToDoCode<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-list-alt fa-1x"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Programming Language</a>
                  <a class="dropdown-item" href="#">Project Implementation</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Data Structure</a>
                </div>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">Contact <span class="fa fa-phone fa-1x"></span></a>
              </li>
               <li class="nav-item">
                  <a class="nav-link" href="#" data-toggle="modal" data-target="#postModal">Add post <span class="fa fa-plus"></span></a>
              </li>
              
            </ul>
            <ul class="navbar-nav mr-right text-white">
                <li class="nav-item">
                   
                </li>
                <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">Logout <span class="fa fa-sign-out"></span></a>
                </li>
            </ul>
          </div>
        </nav>
        
        
        
        <!-- Navbar section is end here -->
        
        <!--now we are going to create the main body section-->
        
        <main>
            <div class="container mt-3">
                <div class="row">
                    <div class="col-sm-3">
                   
                     <!--All categories show in this section-->
                     
                     <div class="list-group">
                        <a href="#" onclick="loadPost(0)" class="c-link list-group-item list-group-item-action active ">
                          All Post
                        </a>
                         <% 
                             PostDao doa=new PostDao(ConnectionProvider.getConnection());
                             ArrayList<Category> list=doa.getCategory();
                             
                             for(Category c:list){
                         %>
                         <a href="#" onclick="loadPost(<%= c.getCid() %>)" class=" c-link list-group-item list-group-item-action active "><%= c.getName() %></a>
                         <%
                             
                             }
                         %>
                       
                    </div>
                        
                    </div>
                    <div class="col-md-9" id="main-content">
                   
                    </div>
        </main>
        
        <!-- Modal Section started Here -->
        
        
            

            <!-- Modal -->
            <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel" style="font-family:Pacifico;" >Technical Blog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                        <div class="modal-body">
                            <div class="container text-center" >
                                <img src="pic/<%= user.getProfile() %>" style="max-width:150px; border-radius:50%; ">
                                <br><br>
                                <h3 style="font-family:Pacifico; font-size:25px; "><%= user.getName() %></h3>
                                  <br>
                                <!-- user profile details -->
                                <div id="user_profile">
                                  <table class="table" >
                                      <tbody>
                                        <tr>
                                          <th scope="row">Id:</th>
                                          <td><%= user.getId() %></td>

                                        </tr>
                                        <tr>
                                          <th scope="row">Email:</th>
                                          <td ><%= user.getEmail() %></td>

                                        </tr>
                                        <tr>
                                          <th scope="row">Gender:</th>
                                          <td><%= user.getGender() %></td>

                                        </tr>
                                        <tr>
                                          <th scope="row">About:</th>
                                          <td><%= user.getAbout() %></td>

                                        </tr>
                                        <tr>
                                          <th scope="row">Registered Date:</th>
                                          <td><%= user.getTimestamp().toString() %></td>

                                        </tr>
                                      </tbody>
                                  </table>
                                </div>
                                <!-- Edit Section Started here -->
                                <div class="container" id="edit_profile" style="display:none;">
                                    <h3>Please Edit Carefully</h3>
                                    <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                         <table class="table">
                                            <tr>
                                                <th scope="row">ID:</th>
                                                <td><%= user.getId() %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Name:</th>
                                                <td><input name="name" type="text" class="form-control" value="<%= user.getName()%>"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email:</th>
                                                <td><input name="email" type="email" class="form-control" value="<%= user.getEmail()%>"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Password:</th>
                                                <td><input name="password" type="password" class="form-control" value="<%= user.getName()%>"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender:</th>
                                                <td><%= user.getGender() %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">About:</th>
                                                <td>
                                                    <textarea class="form-control" name="about" rows="3"><%= user.getAbout() %></textarea>
                                                </td> 
                                            </tr>
                                            <tr>
                                                <th scopr="row">New Profile:</th>
                                                <td>
                                                    <input type="file" name="image" class="form-control">
                                                </td>
                                            </tr>
                                    </table>  
                                    <div class="container text-center"> 
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                             
                        </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="update" class="btn primary-background">Edit</button>
                  </div>
                </div>
              </div>
            </div>
                                               
            
                                                
        
        <!-- Modal Section end here -->
        
        
        
        <!-- Modal for the Add post is started here -->
       
        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white">
                      <h5 class="modal-title" id="exampleModalLabel" >Provide the Post Detail... </h5>
                      
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="POST" enctype="multipart/form-data" id="form-data">
                            <div class="form-group" id="form1"> 
                                
                                <select class="form-control" required name="pcategory">
                                    <option selected disabled>--Select Category---</option>
                                    <%
                                        PostDao post=new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> lis=post.getCategory();
                                        for(Category c: lis){
                                            
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                    <% 
                                     }
                                    %>    
                                </select>
                            </div>
                            <div class="form-group">
                                <input id="title" class="form-control" type="text" name="ptitle" placeholder="Enter post title" required>
                            </div>
                            <div class=" form-group">
                                <label>Enter content here</label>
                                <textarea id="txtAddress" class="form-control" style="height:150px;" name="pcontent" required></textarea>
                            </div>
                            <div class=" form-group">
                                <label>Enter code here</label>
                                <textarea class="form-control" style="height:110px;" name="pcode"></textarea>
                            </div>
                            <div class=" form-group">
                                <label>Select image</label>
                                <input id="txtAddress" type="file" name="ppic" class="form-control">
                            </div>
                            <div class="container text-center" >
                                 <button type="submit"  class="btn btn-outline-primary primary-background text-white ">Post</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>        
                    </div>
                </div>  
            </div>
        </div>
                             
        <!-- Modal for the Add post is End here -->
        
        
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
               let editStatus=false;
               $('#update').click(function(){
                 if(editStatus==false){
                     $('#user_profile').hide();
                     $('#edit_profile').show();
                     editStatus=true;
                     $(this).text("Back");
                 }
                 else{
                     $('#user_profile').show();
                     $('#edit_profile').hide();
                     editStatus=false;
                     $(this).text("Edit");
                 }
               });
            });
        </script>
        
        <!-- now we are make this add post call asynchornous using the jQuery and ajax which we are not refresh the page and post 
        is also added -->
        
        <script>
            $(document).ready(function(){
                $('#form-data').on("submit", function(event){
                    // here we are stop this request goes to the another servlet
                    event.preventDefault();
                   
                   
                    // here we are get the data from the form and sto it into a variable
                    let form= new FormData(this);
                    
                    // now we have to send this data to the server for this we are using the ajax
                    $.ajax({
                        url: "AddPostServlet",
                        type:"POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if(data.trim()=='done'){
                                swal("Good job!", "Added Sccessfully", "success");
                               	
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false
                    });
                    
                });
            });
        </script>
        <script>
            function loadPost(catId, temp){
                $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_post.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#main-content').html(data)
                        $(temp).addClass('primary-background');
                    }
                });
            }
            $(document).ready(function(){
                let allpost=$(".c-link")[0];
                loadPost(0, allpost);
                
            });
        </script>
        <script>
            
            $(document).ready(function(){
               console.log("Like button is hit"); 
               
            });
            
        </script>
    </body>
</html>
