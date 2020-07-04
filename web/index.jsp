<%-- 
    Document   : index
    Created on : 19 Jun, 2020, 12:15:58 PM
    Author     : Deep Kumar
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="Nav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technical Blog</title>
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
    <body >
        <%-- This is the Navbar Section --%>
        <Nav:navbar/>       
        
       <%-- Main Section --%>
       <div class="container-fluid h-0 p-0  ">
           <div class="jumbotron primary-background text-white banner-background" >
               <div class="container">
                    <h1 class="display-3">Welcome to the Technical Blog</h1>
                    <h5>Programming Language and the Data structure are the most popular at that time, So if you are decide
                      to Learn Something technical here you will find the something which is very important for you. Here
                      you can also share you know with the other geeks also and get the knowledge from the other Geeks as well.
                    </h5>
                    <br>
                    <a href="registration.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start! its Free </a>
                    <a href="login.jsp" class="btn btn-outline-light btn-lg">Login <span class="fa fa-user-circle-o fa-spin"></span></a>
               </div>
           </div>
       </div>
       <div class="container">
           <div class="row">
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                   </div>
               </div>
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                   </div>
               </div>
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                   </div>
               </div>
           </div>
           <br>
           <div class="row">
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                   </div>
               </div>
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                   </div>
               </div>
               <div class="col-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                   </div>
               </div>
           </div>
       </div>
        
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
