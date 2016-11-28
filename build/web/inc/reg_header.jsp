<%-- 
    Document   : reg_header1
    Created on : 2016-7-7, 18:50:43
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<div id="header">
    <header>
        <h1>小型酒吧在线管理系统</h1>
        <div class="logo"><a href="<%=basePath%>"><img src="<%=basePath%>images/logo.png" title="小型酒吧在线管理系统"></a></div>
        <ul class="nav block">
            <li><a href="<%=basePath%>">首页</a></li>
        <li><a href="<%=basePath%>news.jsp">资讯</a></li>
        <!--<li><a href="beer.jsp">酒类</a></li>
        <li><a href="photos.jsp">相册</a></li>-->
        <li><a href="<%=basePath%>talk.jsp">留言</a></li>
        <li><a href="<%=basePath%>pay.jsp">预定/付款</a></li>
            <span id="navslip"></span>
        </ul>
        <ul class="login right">
            <li class="login_windows"><a href="#"><i class="fa fa-user"></i>登陆</a></li>
            <li><a href="<%=basePath%>reg.jsp"><i class="fa fa-user-plus"></i>注册</a></li>
        </ul>
    </header>
</div>
<div id="login">
    <div class="close"><a href="#"><i class="fa fa-close"></i></a></div>
    <div class="title">会员登陆</div>
    <form action="<%=basePath%>Login" method="post" name="from1">
        <label><i class="fa fa-user fa-2x"></i></label><input type="text" name="username" id="username" placeholder="用户名">
        <label><i class="fa fa-lock fa-2x"></i></label><input type="password" size="15" name="password" id="password" placeholder="密码">
        <div id="Ajax_Name"></div>
        <label></label><input style="margin: 5px 20px 0 15px;padding: 0; width: auto; height: auto; float: left;display: inline-block;" type="checkbox" name="ck_MNBUser"><div style="float: left;display: inline-block;font-size: 14px; margin-top: 3px; color: #222">7天内自动登陆</div><br><div class="clear"></div>
        <label></label><input type="submit" id="submit" name="submit" value="快速登陆"><a class="more" href="<%=basePath%>reg.jsp">注册</a><a class="more" href="<%=basePath%>get_pwd.jsp">忘记密码</a>
    </form>
</div>
<div id="login_bg"></div>