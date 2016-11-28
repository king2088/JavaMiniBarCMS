<%-- 
    Document   : 404
    Created on : 2016-7-6, 21:38:13
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
    //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="GB2312">
    <title>404</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body>
<div id="tips_error">
    <i class="fa fa-bug fa-3x"></i><br>
    404错误<br>你访问的页面不存在或你无权访问该页面
    <div class="bottom_c"><a href="javascript:window.history.go(-1)">返回</a><a href="<%=basePath%>">首页</a><a href="news.jsp">资讯</a></div>
</div>
<div id="tips_bg"></div>
<script src="js/jQuery1.12.4.js"></script>
<script>
    $(function () {
        //tips提示框居中
        $('#tips_error').css({
            top:'50%',
            left:'50%',
            margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'
        });
        $('#tips_bg').css({
            width:$(window).width(),
            height:$(document).height()
        });
    });
</script>
</body>
</html>
