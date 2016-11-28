<%-- 
    Document   : email_detail
    Created on : 2016-7-30, 19:47:53
    Author     : Mt.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="MyEmail" class="com.bar.db.Email" />
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
        out.println("<title>你无权访问此页面_"+Description+"</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"tips_error\">");
        out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
        out.println("你无权访问此页面，请登陆后再试");
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
    
    //获取当前用户的用户名
    String sUserName = (String) session.getAttribute("uname");

    //获得索要显示邮件的索引号
    String sID = request.getParameter("EmailID");
    long lEmailID = Long.parseLong(sID);

    //获得邮件信息
    MyEmail.setEmailid(lEmailID);
    MyEmail.init();

    //判断当前用户是否有权察看该邮件
    if(MyEmail.getReceiver().compareTo(sUserName) != 0 && MyEmail.getSender().compareTo(sUserName) != 0)
    {
            out.println("<p align=center>您没权查看该邮件！</p>");
            out.println("<div align=\"center\"><input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\"></div>");
            return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>站内邮件发送_<%=Sitename%></title>
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
                <h2><i class="fa fa-send-o"></i>邮件内容</h2>
                <div class="myemail">
                    <div class="email_info">
                        <strong>发信人：</strong><%=MyEmail.getSender()%><br>
                        <!--<strong>收信人：</strong><%=MyEmail.getReceiver()%><br>-->
                        <strong>标题：</strong><%=MyEmail.getSubject()%>
                    </div>
                    <div class="email_contents">
                        <%
                            //替换邮件内容中的回车和换行符号，以便在页面上能正常显示
                            String sContent = MyEmail.getContent();
                            sContent = sContent.replaceAll("\r\n","<br>");
                            out.println(sContent+"<br>");
                        %>
                        <div class="clear"></div>
                    </div>
                    <div class="email_more">
                        <a class="send_to" href="<%=basePath%>send_email_form.jsp?ArticleID=0&EmailID=<%=lEmailID%>" target="_self">回复</a><a class="send_no" href="javascript:window.history.go(-1)" target="_self">返回</a>
                    </div>
                </div>
        <%
		//将邮件设置了已读
		MyEmail.update_tag();
	%>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>    
    </body>
</html>
<%}%>