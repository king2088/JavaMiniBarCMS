<%-- 
    Document   : talk
    Created on : 2016-7-11, 12:52:43
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Talk" class="com.bar.db.Talk" />
<%
    //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    String uname = (String) session.getAttribute("uname");
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
        out.println("<title>请登陆后，再进行留言发表_MiniBarCMS</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("请登陆后，再进行留言发表");
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
    }
    
    else{    
    request.setCharacterEncoding("gb2312");
    String sUserName = (String) session.getAttribute("uname");
    long lUserID = (Long) session.getAttribute("userid");


    //获取是否需要处理留言信息的参数值	
    String sWords = request.getParameter("Words");

    //判断是否需要处理留言信息
    if(sWords != null)
    {
            //获取留言内容
            String sContent = request.getParameter("Content");
            //保存留言

            Talk.setContent(sContent);
            Talk.setUserid(lUserID);		
            Talk.add();
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>留言_<%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
        <script type="text/javascript" charset="gbk" src="<%=basePath%>ueditor/ueditor.configmini.js"></script>
        <script type="text/javascript" charset="gbk" src="<%=basePath%>ueditor/ueditor.all.min.js"></script>
        <script type="text/javascript" charset="gbk" src="<%=basePath%>ueditor/lang/zh-cn/zh-cn.js"></script>
    </head>
    <body>
        <%@ include file="inc/header.jsp" %>
        <div class="focus">
            <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="list left">
                <h2><i class="fa fa-comments"></i>用户留言</h2>
                <div class="comment">
                    <div class="someinfo">您的用户名是：<mark><%=sUserName%></mark>，请在下面输入框中填写留言信息</div>
                <form name="comments" method="post" action="<%=basePath%>talk.jsp" target="_self">
                <input type="hidden" name="Words" value="YES" />
                <textarea name="Content" id="editor" style="width: 100%;height: 200px"></textarea>
		<input type="submit" name="sub" value="发表留言"><span id="editor_error" style="color:red;margin-left: 20px"></span>
                </form>
                    
                <%
                    //获取当前的所有留言信息
                    ResultSet rs = Talk.show_talk();
                    //循环显示当前的所有留言信息
                    while(rs.next())
                    {
                            String sContent = rs.getString("content");
                            sContent = sContent.replaceAll("\r\n","<br>");
                            lUserID = rs.getLong("userid"); 
                            User.setUserid(lUserID);

                            User.init();
                %>
                    <div class="comments_header">
                        <div class="left">用户名：<mark><%=User.getUname()%></mark></div><div class="right">留言时间：<%=rs.getString("createtime")%></div><div class="clear"></div>
                    </div>
                    <div class="comments_body">
                        <%=sContent%>
                    </div>
                <%}%>
                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>
        <script type="text/javascript">
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');
        $(function(){
            $('input[name=sub]').click(function () {
        var Content = $('#editor').val();
        if(Content=='' || Content.length>=10){
            $('#editor_error').append('<i class=\"fa fa-close\"></i>请输入至少10个字符以上的内容才可以发表留言');
            return false;
        }
    });
        });
        </script>
    </body>
</html>
<%}%>