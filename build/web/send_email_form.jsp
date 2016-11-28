<%-- 
    Document   : send_email_form
    Created on : 2016-7-29, 13:54:29
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ include file="systems.jsp" %>
<jsp:useBean scope="page" id="MyEmail" class="com.bar.db.Email" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
	String uname = (String) session.getAttribute("uname");
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        //获取当前用户的用户名
	String sUserName = (String) session.getAttribute("uname");
        if(sUserName==null || sUserName.length() <= 0){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
            out.println("<!--[if lt IE 9]>");
            out.println("<script src=\""+basePath+"js/html5.js\"></script>");
            out.println("<script src=\""+basePath+"js/respond.js\"></script>");
            out.println("<![endif]-->");
            out.println("<title>请登陆后，再发送站内邮件_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("请登陆后，再发送站内邮件");
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
	String sSubject = "";
	String sContent = "";
	String sReceiver = "";
	//获得索要回复的邮件的索引号，并将它转化为长整型	
	String sEmailID = request.getParameter("EmailID");
	long lEmailID = Long.parseLong(sEmailID);

	//判断是否是回复邮件，如果是的话则获取邮件信息
	if(lEmailID != 0)
	{
		MyEmail.setEmailid(lEmailID);
		MyEmail.init();
		sSubject = "回复："+MyEmail.getSubject();		
		sReceiver = MyEmail.getSender();
		sContent = MyEmail.getContent();
		if(sContent.length()>100)
		{
			sContent = sContent.substring(1,100);
			sContent = sContent + "………………";
		}
		sContent = "【 在 "+sReceiver+" 的来信中提到: 】\r\n" + sContent;
		sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	}
	//获取所要回信的文章的索引号，并将它转化为长整型
	String sArticleID = request.getParameter("ArticleID");
	long lArticleID = Long.parseLong(sArticleID);

	//判断是否是回信文章，如果是的话则获取文章信息
	if(lArticleID != 0)
	{
		Article.setArticleid(lArticleID);
		Article.init();		
		sSubject = "回复："+Article.getTitle();		
		User.setUserid(Article.getUserid());
		User.init();
		sReceiver = User.getUname();
		sContent = Article.getContent();				
		if(sContent.length()>100)
		{
			sContent = sContent.substring(1,100);
			sContent = sContent + "………………";
		}
		sContent = "【 在 "+sReceiver+" 的来信中提到: 】\r\n" + sContent;
		sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
        <script type="text/javascript" charset="gbk" src="ueditor/ueditor.configmini.js"></script>
        <script type="text/javascript" charset="gbk" src="ueditor/ueditor.all.min.js"></script>
        <script type="text/javascript" charset="gbk" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    </head>
    <body>
        <%@ include file="inc/header.jsp" %>
        <div class="focus">
            <div class="news_pic"></div>
        </div>
        <div class="container">
            <div class="list left">
                <h2><i class="fa fa-send-o"></i>站内邮件发送</h2>
                <div class="myemail">
                    <form name="form_send" method="post" action="<%=basePath%>EmailSave.Tao" target="_self" class="send_form">
                        <label>发信人：</label><%=sUserName%><br>
                        <label>标题：</label> <input style="width: 400px" type="text" name="Subject" value="<%=sSubject%>">
                        <label>收信人：</label><input type="text" id="Receiver" name="Receiver" value="<%=sReceiver%>">
                        <textarea name="Content" style="height: 400px;" id="editor"><%=sContent%></textarea>
                        <input type="submit" value="发送" name="submit_email"><div id="email_error"></div>
                    </form>
                </div>
            </div>
            <jsp:include page="inc/figure.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>
        <script src="js/jquery-ui.js"></script>
<script>
$(function () {
    $("#Receiver").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<%=basePath%>Email.Json",
                dataType: "jsonp",
                success: function(data) {
                    response($.map(data.Email_name, function(item) {
                        return {
                            label: item.name,
                            value: item.name
                        }
                    }));
                }
            });
        },
        minLength: 2
    });
    $('input[name=submit_email]').click(function () {
        var Subject = $('input[name=Subject]').val();
        var Receiver=$('input[name=Receiver]').val();
        var Content = $('textarea[name=Content]').val();
        if(Subject=='' || Content=='' || Content.length < 15){
        $('#email_error').html('请正确填写邮件标题、收件人以及邮件内容');
        return false;
        }
    });
});

    var ue = UE.getEditor('editor');
</script>
    </body>
</html>
<%}%>