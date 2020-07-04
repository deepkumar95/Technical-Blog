function getLike(pid, uid){
    $.ajax({
       url: "LikeServlet",
       type: "POST",
       data: {post_Id:pid , user_Id:uid },
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()){
                $('.LikeCount').html(data);
               
            }    
        },
        error: function(jqXHR, textStatus, erroThrown){
            console.log(jqXHR);
        }
    });
}