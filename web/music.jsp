<%-- 
    Document   : music
    Created on : 2016-7-12, 14:25:23
    Author     : Mt.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Music" class="com.bar.db.Music" />
<%
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
        out.println("<title>请登陆后，再推荐音乐_MiniBarCMS</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("请登陆后，再推荐音乐");
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

            String sMusicname = request.getParameter("musicname");

            if(sMusicname != null)
            {
                //获取留言内容
                String sMusicurl = request.getParameter("musicurl");
                //保存留言

                Music.setMusicname(sMusicname);
                Music.setMusicurl(sMusicurl);
                Music.setUserid(lUserID);
                Music.add();
            }	
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>音乐推荐_<%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
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
                <h2><i class="fa fa-music"></i>推荐音乐</h2>
                <div class="music">
                    <div class="music_list">
                        
                            <%
                                //获取当前的所有留言信息
                                ResultSet rs = Music.show_music();
                                //循环显示当前的所有留言信息
                                while(rs.next())
                                {
                                    String sMusicurl = rs.getString("musicurl");
                                    sMusicurl = sMusicurl.replaceAll("\r\n","<br>");
                                    lUserID = rs.getLong("userid"); 
                                    User.setUserid(lUserID);
                                    User.init();
                            %>
                        <div class="box">
                            <div class="title">
                                <span class="gname">歌名：<%=rs.getString("musicname")%></span>
                                <span class="muser">推荐者：<%=User.getUname()%></span>
                                <span class="download"><a href="<%=sMusicurl%>" title="下载" target="_blank"><i class="fa fa-cloud-download"></i></a></span>
                                <div class="clear"></div>
                            </div>
                                <audio controls="controls">
                                    <source src="<%=sMusicurl%>" type="audio/mpeg">
                                    你的浏览器不支持此播放器，请升级浏览器
                                </audio>
                        </div>
                          <%}%>
                    
                    </div>
                    
                    <div class="music_form">
                        <form name="music_form" method="post" action="music.jsp" target="_self">
                            每次只能输入一个音乐地址<br><br>
                            歌曲名字：<br><input type="text" name="musicname">
                            歌曲地址：(地址必须以http://开始)<br><input type="text" name="musicurl" value="http://">
                            <input type="submit" name="submit_music" value="发布歌曲">
                            <div id="music_error"></div>
                        </form>
                    </div>

                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>
        <script src="<%=basePath%>js/jquery.pin.js"></script>
        <script>
            $(function(){
                $('input[name=submit_music]').click(function () {
                var musicname = $('input[name=musicname]').val();
                var musicurl = $('input[name=musicurl]').val();
                if(musicname=='' || musicurl=='' || musicurl.length < 15){
                $('#music_error').html('请输入要推荐的歌曲名字和歌曲地址');
                return false;
                }
            });
            $(".music_form").pin();
            });
        </script>
    </body>
</html>
<%}%>