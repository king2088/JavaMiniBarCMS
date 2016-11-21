<%-- 
    Document   : load
    Created on : 2016-7-12, 20:53:07
    Author     : Mt.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
int id= 6;
int uid=10;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <title>JSP Page</title>
        <script src="js/jQuery1.12.4.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">

<script>
$(document).ready(function(){
  $('#Pay_for').click(function(){
      var url= $(this).attr('href');
      //alert(url);
      $('.payfor').css({
            top:'50%',
            left:'50%',
            margin:'-'+($('.payfor').height()/2 +'px 0 0 -'+$('.payfor').width()/2)+'px',
            zIndex:999
        }).slideDown(300);
        $('body').css({overflow:"hidden"});
        $('#login_bg').css({
            display:'block',
            width:$(window).width(),
            height:$(document).height(),
            zIndex:998
        }).slideDown(300);
        $('.payfor_x').load(url).css('display','block').slideDown(3000);
        return false;

    });
    $('.payfor .top_title .close_pay a').click(function () {
        $('.payfor').hide(200);
        $('#login_bg').hide();
        $('body').css({overflow:"scroll"});
  });
  
  
});
</script>
<style>
    .payfor{
        width: 300px;
        height: 300px;
        position: absolute;
        border-radius: 5px;
        background: #F1F1F1;
        padding: 10px;
        display: none;
        z-index: 9999999;
    }
    .payfor .top_title{
        width: 100%;
        text-align: center;
        margin-bottom: 20px;
        font-size: 16px;
        color: #0287CA;
    }
    .payfor .top_title .close_pay{
        float: right;
    }
    .payfor .top_title .close_pay a{
        color: #CCC;
    }
    .payfor .payfor_x{
        margin: 0;
        padding: 0;
    }
</style>
    </head>
    <body>
        <div id="test">
            <a id="Pay_for" href="http://localhost:8080/bar/payfor.jsp?Goodinfoid=<%=id%>&userid=<%=uid%>">获得外部的内容</a>
            <a href="http://localhost:8080/bar/payfor.jsp?Goodinfoid=<%=id%>&userid=<%=uid%>">获得外部的内容</a>
        </div>
        
        <div class="payfor">
            <div class="top_title">确认购买信息<div class="close_pay"><a href="#"><i class="fa fa-close"></i></a></div></div>
            <div class="payfor_x"></div>
        </div>
        <div id="login_bg"></div>
        
    </body>
</html>
