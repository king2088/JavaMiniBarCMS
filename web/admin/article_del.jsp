<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />

	</head>
	<body>
	<div align="center"><br>
<%
	//获取所要删除的讨论区信息索引号
	String[] sArticleid = request.getParameterValues("articleid");	
	//将所有索引号组织成一个字符串
	String sDeleteArticleid = "0";
	if (sArticleid != null)
	{
		for(int i=0;i<sArticleid.length;i++)
		{
			sDeleteArticleid = sDeleteArticleid +"," + sArticleid[i];	
		}		
	}

	//删除讨论区
	if(Article.delete(sDeleteArticleid))
	{
		out.println("<p><font color=blue>文章删除成功</font></p>");
		out.println("<p><a href=\"type_list.jsp\" target=\"_self\"><font color=blue>返回文章管理</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>文章删除失败，请重试</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
