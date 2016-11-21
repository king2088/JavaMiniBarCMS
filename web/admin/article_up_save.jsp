<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%
request.setCharacterEncoding("gb2312");
            String sArticleid = request.getParameter("articleid");
	        long lArticleid = Long.parseLong(sArticleid);
			String stitle=request.getParameter("title");
			String scontent=request.getParameter("content");
			//将文章信息保存到数据库中
			Article.setArticleid(lArticleid);
			Article.setTitle(stitle);
			Article.setContent(scontent);
			if(Article.modify())
			{
				out.println("<p><font color=blue>文章修改成功</font></p>");
				out.println("<input type=button name=btn1 value=\"返回文章列表\" onClick='window.location=\"./type_list.jsp\"'>");
			}
			else
			{
				out.println("<p><font color=red>文章修改失败，请重试</font></p>");
				out.println("<input type=button name=btn2 value=\"返回\" onClick='window.history.go(-1)'>");
				return;
			}
%>