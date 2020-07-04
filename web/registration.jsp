<%-- 
    Document   : registration
    Created on : 19 Jun, 2020, 9:19:22 PM
    Author     : Deep Kumar
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="Nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <style>
            .banner-background{
                 clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 83%, 95% 93%, 68% 88%, 19% 100%, 0 91%, 0% 35%, 0 0);
            }
        </style>
    </head>
    <body>
        <Nav:navbar/>
        <main class="primary-background banner-background" style="padding-bottom:80px; padding-top:20px; ">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-center text-white">
                            <p><span class="fa fa-user-plus fa-4x"></span></p>
                            <h3>Register</h3>
                        </div>
                        <% 
                          Message mess=(Message)request.getAttribute("msg");
                          if(mess !=null){
                        %>
                         <div class="alert <%= mess.getCssClass() %>" role="alert">
                            <%= mess.getContent() %>
                        </div>
                        <%
                            request.removeAttribute("msg");
                            
                          }
                        %>
                       
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                  <div class="col-md-12 mb-3">
                                    <label for="validationDefault01">Username</label>
                                    <input name="name" type="text" class="form-control" id="validationDefault01"  required placeholder="Enter name">
                                  </div>
                                  <div class="col-md-12 mb-3">
                                    <label for="validationDefault02">Email</label>
                                    <input name="email" type="email" class="form-control" id="validationDefault02"  required placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  </div>
                                  <div class="col-md-12 mb-3">
                                    <label for="validationDefault03">Password</label>
                                    <input name="password" type="Password" class="form-control" id="validationDefault03"  required placeholder="Enter password"> 
                                  </div>
                                <div class="form-group col-md-12">
                                    <label for="gender">Gender</label><br>
                                    <input type="radio"  id="gender" name="gender" value="Male"  required>Male
                                    <input type="radio"  id="gender" name="gender" value="Female" required>Female
                                </div>
                  
                                <div class=" col-md-12 form-group">
                                  <div class="form-check">
                                    <input name="check" class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                                    <label class="form-check-label" for="invalidCheck2">
                                     check me
                                    </label>
                                  </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <textarea name="about" required type="about" class="form-control" rows="2" placeholder="Enter Something about youself" ></textarea>
                                </div>
                                <div class="form-group text-center " id="loader" style="display:none;">
                                    <span class="fa fa fa-refresh fa-4x fa-spin "></span>
                                    <h3>Please Wait</h3>
                                </div>
                                <button id="submit" class="col-md-12 form-control btn btn-outline-light primary-background" type="submit">Submit form</button>
                              </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
                $("#submit").click(function(){
                    $("#loader").show();
                });
        </script>
    </body>
</html>
