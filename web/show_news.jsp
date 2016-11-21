<%-- 
    Document   : show_news
    Created on : 2016-7-7, 10:15:56
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
<%@ include file="systems.jsp" %>
<%
    String uname = (String) session.getAttribute("uname");
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    
    //获得要显示的文章的参数，并将它转为整型值
    String sArticleid = request.getParameter("articleid");
    long lArticleid = Long.parseLong(sArticleid);

    //获得主题文章信息
    Article.setArticleid(lArticleid);
    Article.init();

    //获得作者信息
    User.setUserid(Article.getUserid());
    User.init();

    //获得当前讨论区信息
    Type.setTypeid(Article.getTypeid());
    Type.init();	

    int count=1;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title><%=Article.getTitle()%>_<%=Sitename%></title>
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
        <div class="container">
            <div class="article left">
                <h1><%=Article.getTitle()%></h1>
                <div class="info">
                    <span><i class="fa fa-user"></i><%=User.getUname()+"（"+User.getName()+"）"%></span>
                    <span><i class="fa fa-calendar"></i><%=Article.getCreatetime()%></span>
                    <span><i class="fa fa-eye"></i><%=Article.getReadcount()%></span>
                    <span><i class="fa fa-font"></i>字体：<a id="font-mx" href="#">大</a> <a id="font-lx" href="#">中</a> <a id="font-sx" href="#">小</a></span>
                    <span><i class="fa fa-share-square"></i>分享：<a href=""><i class="fa fa-qq"></i></a> <a href=""><i class="fa fa-google-plus-square"></i></a></span>
                </div>
                <div class="content">
                    <%
                        String sContent = Article.getContent();
                        sContent = sContent.replaceAll("\r\n","<br>");
                        out.println(sContent);
                    %>
                </div>
            </div>
                <%
                    //将阅读数加1
                    int iReadCount = Article.getReadcount()+1;
                    Article.setReadcount(iReadCount);
                    Article.modify_readcount();
                %>
            <figure class="right">
                <img src="<%=basePath%>images/112.jpg">
                <div class="title"><i class="fa fa-retweet" aria-hidden="true"></i>
                    巴黎5日游</div>
                <span>如图所示就是第一次打开的计算器的样子。默认第一次打开的功能是标准，我们在这里可以做做简单的加减乘除的计算。另外，根号的使用要先输入数字再点击根号，1/x即倒数的使用也要先输入数字再点击1/x倒数功能。</span>
            </figure>
            <jsp:include page="inc/new_article.jsp" flush="true"></jsp:include>
        </div>
        <%@ include file="inc/footer.jsp" %>
    </body>
</html>
