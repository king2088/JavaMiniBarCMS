<%-- 
    Document   : 注册
    Created on : 2016-7-7, 17:57:12
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ include file="systems.jsp" %>
<% 
   request.setCharacterEncoding("gb2312");
   response.setCharacterEncoding("gb2312");
   //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title><%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
    </head>
    <body>
        <%@ include file="inc/reg_header.jsp" %>
        <div class="focus">
            <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="list left">
                <h2><i class="fa fa-user-plus"></i>用户注册 <small>(请认真填写以下注册信息，以便我们更好的为您服务)</small></h2>
                <jsp:include page="inc/reg_form.jsp" flush="true"></jsp:include>
                </div>
            <figure class="right">
                <img src="<%=basePath%>images/112.jpg">
                <div class="title"><i class="fa fa-retweet" aria-hidden="true"></i>
                    巴黎5日游</div>
                <span>如图所示就是第一次打开的计算器的样子。默认第一次打开的功能是标准，我们在这里可以做做简单的加减乘除的计算。另外，根号的使用要先输入数字再点击根号，1/x即倒数的使用也要先输入数字再点击1/x倒数功能。</span>
            </figure>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>
    <script src="<%=basePath%>js/jquery.validate.min.js"></script>
    <script src="<%=basePath%>js/messages_zh.min.js" charset="utf-8"></script>
    <script src="<%=basePath%>js/browser.js" charset="utf-8"></script>
    <script src="<%=basePath%>js/jquery.date_input.pack.js" charset="utf-8"></script>
    <script>
        $(function(){
            //注册页面日历插件使用
            $('.birth_day').date_input();
             //注册表单验证
            $("#Join").validate({
                rules: {
                    pwd1: {
                        required: true,
                        minlength: 6
                    },
                    pwd2: {
                        required: true,
                        minlength: 6,
                        equalTo: "#pwd1"
                    },
                }
            });
            //注册表单ajax查询用户名是否可用
            $('input[name=uname]').blur(function(){
                $.ajax({
                    type:'GET',
                    url:'<%=basePath%>NameChek.Tao',
                    dataType:'html',
                    data:'uname='+encodeURI(encodeURI($(this).val())),
                    beforeSend:function(XMLHttpRequest)
                    {
                        $('#AjaxUname').text('正在查询');
                        //Pause(this,100000);
                    },
                    success:function (response,status,xhr) {
                        $('#AjaxUname').html(response);
                    }
                });
            //alert($(this).val());
            });
            //检测注册表单中验证码是否正确
            $('input[name=Rand]').blur(function(){
                $.ajax({
                    type:'GET',
                    url:'<%=basePath%>CodeAjax.Tao',
                    dataType:'html',
                    data:'Rand='+$(this).val(),
                    beforeSend:function(XMLHttpRequest)
                    {
                        $('#AjaxCode').text('正在查询');
                        //Pause(this,100000);
                    },
                    success:function (response,status,xhr) {
                        $('#AjaxCode').html(response);
                    }
                });
                //alert($(this).val());
            });
        });
        </script>
    </body>
</html>