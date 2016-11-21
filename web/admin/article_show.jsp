<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
		<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
        <style type="text/css">
		body{margin:0 auto; font-family: Georgia, "Times New Roman", Times, serif; font-size:12px;}
		</style>
<%
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
	</head>
	<body>
	<div align="center"><br>
	<h3><font color="#0000FF"><%=Type.getTypename()%></font>	</h3>
	<table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#E1E1E1">
	<tr bgcolor="#F5F5F5">
	<td width="95%" height="20" align="left"><font color="#0000FF">[发布者]<font color="#000000"><%=User.getUname()+"（"+User.getName()+"）"%></font>]</font>&nbsp;[<a href="article_update.jsp?articleid=<%=Article.getArticleid()%>&typeid=<%=Article.getTypeid()%>">重新编辑文章</a>] <a href="./article_del.jsp?articleid=<%=Article.getArticleid()%>&typeid=<%=Article.getTypeid()%>" target="_self"><font color="#0000FF">[删除文章]</font></a>&nbsp;</td>
	<td width="5%" height="20" align="center"><font color="#0000FF"><%=count++%></font></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td width="100%" align="left" colspan="2">
	&nbsp;文章标题：<font color="#0000FF"><%=Article.getTitle()%></font><br>
	
	<%
	String sContent = Article.getContent();
	sContent = sContent.replaceAll("\r\n","<br>");
	out.println("&nbsp;"+sContent);
	%>
	<br>

	</td>
	</tr>
	</table>
	<%
		//将阅读数加1
		int iReadCount = Article.getReadcount()+1;
		Article.setReadcount(iReadCount);
		Article.modify_readcount();
		
		//获得当前主题文章的所有回复文章信息
		ResultSet rs = Article.show_son_articles();
		while(rs.next())
		{
			//循环显示所有回复文章的信息
			long lUserID = rs.getLong("userid");
			User.setUserid(lUserID);		
			User.init();
	%>
	<%
		}
	%>
	<br>
	<br>
    <a href="#" onClick="javascript:window.history.go(-1)">返回文章列表</a>
	</div>
	</body>
</html>
