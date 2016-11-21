<%-- 
    Document   : get_pwd
    Created on : 2016-8-2, 20:14:47
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>找回密码/忘记密码_<%=Sitename%></title>
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
            <div class="get_pwd left">
                <h2><i class="fa fa-key"></i>找回密码</h2>
                <form name="form_getpwd" action="<%=basePath%>GetPwd.Tao" method="post" target="_self">
                    您在本站注册的用户名：
                    <input name="UserName" type="text" id="UserName">
                    <input name="submit_getpwd" type="submit" value="取回密码">
                </form>
                <div class="error"></div>
                <div class="some_info" style="line-height: 3;color: #666">
                    <i>*找回密码，请正确输入在本站注册的用户名，否则将无法找回密码！</i><br>
                    <i>*密码发送失败，主要原因是服务器正在维护中，因此不要太过担心，我们会尽快处理网站服务器，如果尝试多次无果，请与管理员联系！</i><br>
                    <i>*密码发送成功后，请及时查看你在本站注册时使用的注册邮箱内的邮件，并且获得密码后，请及时删除邮件，以防密码泄露！</i>
                </div>
            </div>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp"%>
        <script>
            $(function(){
                $('input[name=submit_getpwd]').click(function(){
                    if($('input[name=UserName]').val()==='' || $('input[name=UserName]').val().length<=0){
                        return false;
                    }
                });
                //用户登录ajax查询用户名是否存在或者为空
                $('input[name=UserName]').blur(function(){
                        $.ajax({
                                type:'GET',
                                url:'<%=basePath%>LoginUser.Tao',
                                dataType:'html',
                                data:'username='+encodeURI(encodeURI($(this).val())),
                                beforeSend:function(XMLHttpRequest)
                                {
                                        $('.error').text('正在查询');
                                        //Pause(this,100000);
                                },
                                success:function (response,status,xhr) {
                                        $('.error').html(response);
                                }
                        });
                //alert($(this).val());
                });
            });
            
        
        </script>
    </body>
</html>
