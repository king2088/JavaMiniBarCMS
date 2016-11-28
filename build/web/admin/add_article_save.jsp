<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
	body{ font-family:Georgia, "Times New Roman", Times, serif; font-size:12px}
	</style>
	
	<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
	</head>
	<body>
	<div align="center"><br>
	<%
	request.setCharacterEncoding("gb2312");
		//获取当前用户的索引号
        long lUserid = (Long) session.getAttribute("userid");

			String sTypeid = request.getParameter("Typeid");
		    long lTypeid = Long.parseLong(sTypeid);
			String stitle=request.getParameter("Title");
			String scontent=request.getParameter("content");

			//将文章信息保存到数据库中
			Article.setTitle(stitle);
			Article.setContent(scontent);
			Article.setTypeid(lTypeid);
			Article.setUserid(lUserid);
			if(Article.add())
			{
				out.println("<p><font color=blue>文章发表成功</font></p>");
				out.println("<div><input type=button name=btn value=\"回到文章列表\" onClick='window.location=\"./article_list.jsp?typeid="+lTypeid+"\"'></div>");
			}
			else
			{
				out.println("<p><font color=red>文章发表失败，请重试</font></p>");
				out.println("<div><input type=button name=btn value=\"返回\" onClick='window.history.go(-1)'></div>");
				return;
			}
			
		
	%>
	</div>
	</body>
</html>
