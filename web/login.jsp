<%-- 
    Document   : login
    Created on : 19 Jun, 2020, 7:37:16 PM
    Author     : Deep Kumar
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="Nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                 clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 83%, 95% 93%, 68% 88%, 19% 100%, 0 91%, 0% 35%, 0 0);
            }
        </style>
    </head>
    <body>
        <Nav:navbar/>
        <main class="d-flex align-items-center primary-background banner-background" style="height:70vh;">
            <div class="container" >
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <p><span class="fa fa-user-circle-o fa-4x"></span></p>
                                <h3>Login</h3>
                            </div>
                           <%
                               Message sess=(Message)session.getAttribute("msg");
                               if(sess != null){
                           %>
                            <div class="alert <%= sess.getCssClass() %>" role="alert">
                                <%= sess.getContent() %>
                            </div>
                           <%
                               session.removeAttribute("msg");
                               }
                           %>
                            <div class="card-body">
                                <form action="LoginServlet" method="POST">
                                  <div class="col-md-12 mb-3">
                                    <label for="validationDefault01">Email</label>
                                    <input name="email" type="email" class="form-control" id="validationDefault01"  required placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  </div>
                                  <div class="col-md-12 mb-3">
                                    <label for="validationDefault02">Password</label>
                                    <input name="password" type="Password" class="form-control" id="validationDefault02"  required placeholder="Enter password">
                                  </div>
                                  <div class="container text-center">
                                    <button class="btn btn-outline-light primary-background" type="submit">Login</button>
                                  </div>
                              </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
    </body>
    <script src="js/myjs.js" type="text/javascript"></script>
</html>
