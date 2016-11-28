<%-- 
    Document   : updata_user
    Created on : 2016-7-30, 21:21:01
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ include file="systems.jsp" %>
<%
    String uname = (String) session.getAttribute("uname");
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    if(uname==null || uname.length() <= 0){
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
        out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
        out.println("<!--[if lt IE 9]>");
        out.println("<script src=\""+basePath+"js/html5.js\"></script>");
        out.println("<script src=\""+basePath+"js/respond.js\"></script>");
        out.println("<![endif]-->");
        out.println("<title>登陆超时，请重新登陆_"+Description+"</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("登陆超时，请重新登陆后再试");
        out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">返回</a><a href=\""+basePath+"\">首页</a><a href=\""+basePath+"news.jsp\">资讯</a></div>");
        out.println("</div>");
        out.println("<div id=\"tips_bg\"></div>");
        out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
        out.println("<script>");
        out.println("$(function () {");
        out.println("$('#tips_error').css({");
        out.println("top:'50%',");
        out.println("left:'50%',");
        out.println("margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'");
        out.println("});");
        out.println("$('#tips_bg').css({");
        out.println("width:$(window).width(),");
        out.println("height:$(document).height()");
        out.println("});");
        out.println("});");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
    }else{
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>用户信息修改_<%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=basePath%>css/jquery-ui.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
    </head>
    <body>
        <%@ include file="inc/header.jsp" %>
        <div class="focus">
            <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="list left">
                <h2><i class="fa fa-user-plus"></i>用户信息修改</h2>
                <div class="user_me">
                <%@ include file="inc/update_user.jsp" %>
                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>
        <script src="<%=basePath%>js/browser.js" charset="utf-8"></script>
    <script src="<%=basePath%>js/jquery.date_input.pack.js" charset="utf-8"></script>
    <script src="<%=basePath%>js/jquery.validate.min.js"></script>
    <script src="<%=basePath%>js/messages_zh.min.js" charset="utf-8"></script>
    <script>
        $(function(){
            //密码修改
            $("#PWD").validate({
                rules: {
                    pwd: {
                        required: true,
                        minlength: 6
                    },
                    pwd1: {
                        required: true,
                        minlength: 6,
                        equalTo: "#pwd"
                    },
                }
            });
            $('input[name=submit_psw]').click(function () {
                var Oldpwd = $('input[name=OldUserPassword]').val();
                var pwd = $('input[name=pwd]').val();
                var pwd1 = $('input[name=pwd1]').val();
                if(Oldpwd=='' || pwd=='' || pwd.length < 6 || pwd1=='' || pwd1.length < 6){
                $('#pwd_error').html('<i class=\"fa fa-bug\"></i>请输入旧密码和新密码');
                return false;
                }
            });
            
            //日历
            $('#birth').date_input();
            
            //JQ监听input的值是否发生变化，如果变化就允许提交，否则禁止提交
            //默认submit禁止提交
            $('input[name=submit_u_info]').attr("disabled","disabled");
            //鼠标经过获得原本的input值，并保存
            $('#Info_u input').hover(function() {
                var value_c=$(this).val().length;
                //alert(value_c);
                //键盘事件，获得input修改后的值
                $(this).keyup(function(){
                    var value_k = $(this).val().length;
                    //alert(value_k);
                    //假如原本的值与修改后的值不相等，说明input已经被修改，并且允许提交到服务器
                    if(value_c != value_k){
                        $('input[name=submit_u_info]').removeAttr("disabled"); 
                    }
                });
            });
        });
    </script>
    </body>
</html>
<%}%>