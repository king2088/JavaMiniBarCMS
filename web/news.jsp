<%-- 
    Document   : news
    Created on : 2016-7-6, 21:49:07
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean scope="page" id="Page" class="com.bar.page.SplitPage" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%@ include file="systems.jsp" %>
<%
    //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    String uname = (String) session.getAttribute("uname");

    ResultSet rs = Article.show_all_articles();
			Page.initialize(rs,20);
			String strPage=null;
			int showPage = 1;
			strPage=request.getParameter("showPage");	
			if (strPage==null)
				showPage=1;
			else
			{
				try
				{
					showPage=Integer.parseInt(strPage);
				}
				catch(NumberFormatException e)
				{
					showPage = 1;
				}
				if(showPage<1) 
					showPage=1;
		
				if(showPage>Page.getPageCount()) 
					showPage=Page.getPageCount();
			}
			//获取要显示的数据集合
			Vector vData=Page.getPage(showPage);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title>酒吧资讯_<%=Sitename%></title>
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
                <h2><i class="fa fa-list-ol"></i>资讯文章列表</h2>
                <ul>
    <%
        for(int i=0;i<vData.size();i++){ 
            //循环显示文章信息
            String[] sData=(String[])vData.get(i);
            long lUserID = Long.parseLong(sData[2]);
            User.setUserid(lUserID);
            if(User.init())
            {
    %>
                <li>
                    <div class="title"><a href="<%=basePath%>show_news.jsp?articleid=<%=sData[0]%>" target="_self"><%="&nbsp;"+sData[1]%></a></div>
                    <div class="writer"><i class="fa fa-user"></i><%=User.getUname()%></div>
                    <div class="date"><i class="fa fa-calendar"></i><%=sData[5]%></div> 	
                    <div class="view"><i class="fa fa-eye"></i><%=sData[3]%></div>
                </li> 		
	<%
            }
	}
	%>
                   
                </ul>
                <div class="page">
                <div class="page_info">第<%=showPage%>页/共<%=Page.getPageCount()%>页</div>
                    <a href="<%=basePath%>news.jsp?showPage=1">首页</a>
                    <%
			//判断"上一页"链接是否要显示
			if(showPage > 1){				
                    %>
                    <a href="<%=basePath%>news.jsp?showPage=<%=showPage-1%>">上一页</a>
                    <%
			}
			else
                            out.println("<a href=\"#\">上一页</a>");
			//判断"下一页"链接是否要显示
			if(showPage < Page.getPageCount())
			{				
                    %>
                    <a href="<%=basePath%>news.jsp?showPage=<%=showPage+1%>">下一页</a>
                    <%
			}
			else
                            out.println("<a href=\"#\">下一页</a>");
                    %> 
                    <a href="<%=basePath%>news.jsp?showPage=<%=Page.getPageCount()%>">尾页</a>
                    <div class="page_info">
                        <form action="<%=basePath%>news.jsp" method="post" class="page_form" target="_self">
                            <label>
                                <select name="showPage">跳转到
                <%
                    for(int x=1;x<=Page.getPageCount();x++){
		%>
                    <option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
		<%
                    }
		%>
                                </select>页
                            </label>
                                    <input type="submit" name="go" value="提交">
                        </form>
                    </div>
                </div>
            </div>
         <%rs.close();%>
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
