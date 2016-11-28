<%-- 
    Document   : email
    Created on : 2016-7-26, 17:01:12
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
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
    MyEmail.setReceiver(sUserName);
    //获取所有邮件信息
    ResultSet rs = MyEmail.rec_list();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>邮件列表_<%=Sitename%></title>
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
                <h2><i class="fa fa-send"></i><strong><%=sUserName%></strong>的邮件列表</h2>
                <div class="myemail">
                    <form name="myemail" method="post" action="<%=basePath%>DelEmail.Tao" target="_self">
                        <table class="email" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>选中</th>
                                    <th>序号</th>
                                    <th>状态</th>
                                    <th>发信人</th>
                                    <th>标题</th>
                                    <th>发信时间</th>
                                </tr>
                            </thead>
                        <tbody>
                        <%
                        int i=0;
                        //循环显示邮件信息
                        while(rs.next())
                        {
                                i++;
                        %>
                                <tr>
                                <td><input name="DeleteID" type="checkbox" value='<%=rs.getLong("EmailID")%>'></td>
                                <td><%=i%></td>
                                <td>
                        <%
                                int iTag = rs.getInt("Tag");
                                if(iTag == 0)
                                {
                                        out.println("<span style=\"color: red\">未读</span>");
                                }
                                else
                                {
                                        out.println("<span style=\"color: blue\">已读</span>");
                                }
                        %>
                                </td>
                                <td><%=rs.getString("Sender")%></td>
                                <td><a href='<%=basePath%>email_detail.jsp?EmailID=<%=rs.getLong("EmailID")%>' target="_self"><span style="color: #0000FF"><%=rs.getString("Subject")%></span></a></td>
                                <td><%=rs.getString("CreateTime")%></td>
                                </tr>
                        <%
                        }
                        %>
                        </tbody>
                        </table>
                        <a class="send_email" href="<%=basePath%>send_email_form.jsp?ArticleID=0&EmailID=0" target="_self">发送邮件</a><a class="delete_email" href="javascript:myemail.submit()">删除选中邮件</a>
                    </form>
                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
                        <%rs.close();%>
        <%@ include file="inc/footer.jsp"%>
    </body>
</html>
<%}%>