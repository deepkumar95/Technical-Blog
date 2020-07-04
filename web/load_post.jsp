 <%@page import="com.tech.blog.Dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div  class="row">    
<!--All the post  in this section-->
    <% 
        User user=(User) session.getAttribute("currentUser");
        PostDao dao=new PostDao(ConnectionProvider.getConnection());
        List<Post> list1=null;
        int cid=Integer.parseInt(request.getParameter("cid"));
        if(cid==0){
            list1=dao.getAllPost();
        }
        else{
            list1=dao.getPostByCatId(cid);
            
        }
        
        for(Post p:list1){
    %>
    <div class="col-md-5 mt-2">
        <div class="card" >
            <% if(p.getPpic().equals(" ")){
             
            %>
                   
                <img src="pic/default_image.png" class="card-img-top" alt="default_image" style="height:150px;">
                   
            <%
                }
                else{
            %>
                <img src="images/<%= p.getPpic() %>" class="card-img-top" alt="default_image" style="height:150px;">
              
            <%
                }
            %>
            
            <div class="card-body">
                <h5 class="card-title"><%= p.getPtitle() %></h5>
                <p class="card-text"><%= p.getPcontent() %></p>
                <p class="card-text"> 
                     <%
                        String date= new SimpleDateFormat("dd/MM/yyyy").format(p.getPdime());
                        String time= new SimpleDateFormat("HH:mm").format(p.getPdime());
                     %> 
                </p>
                <p class="card-text"> <h6>Date: <%= date %></h6> </p>
                <p class="card-text"> <h6>Time: <%= time %></h6> </p>
                
                 
            </div>
            <div class="card-footer text-center primary-background">
                <% 
                    String s="load_single_post.jsp?post_Id=" +p.getPid()+ "&user_Id="+ user.getId();
                    LikeDao da=new LikeDao(ConnectionProvider.getConnection());
                %>
                <a onclick="getLike(<%= p.getPid() %>,<%= user.getId()%>)" id="like" class="btn btn-outline-light" style="border-radius:20%; "><span class="fa fa-thumbs-o-up fa-2x"></span><span class="LikeCount"><%= da.countLike(p.getPid())%></span></a>
           
                <a href="<%= s %>" class="btn  btn-outline-light btn-lg">Read more..</a>
                <a  class="btn  btn-outline-light" style="border-radius:20%; "><span class="fa fa-commenting-o fa-2x"></span><span> 30</span></a>
            </div>
       </div>
   </div>
   <% 
       }
   %>
</div>