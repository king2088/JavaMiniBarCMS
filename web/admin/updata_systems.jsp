<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		

		<jsp:useBean scope="page" id="Systems" class="com.bar.db.Systems" />

	</head>
	<body>
		<div align="center"><br>

<%
	//设置编码格式
	request.setCharacterEncoding("gb2312");
	
	String ssid = request.getParameter("sid");
	long sid = Long.parseLong(ssid);

	//获取修改后的用户信息
	String sitename = request.getParameter("sitename");
	String keywords = request.getParameter("keywords");
	String description = request.getParameter("description");
	String author = request.getParameter("author");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");

	
	//保存用户信息
	Systems.setSitename(sitename);
	Systems.setKeywords(keywords);
	Systems.setDescription(description);
	Systems.setAuthor(author);
	Systems.setTel(tel);
	Systems.setEmail(email);
	
	if(Systems.update())
	{
		out.println("<p><font color=blue>修改网站参数成功</font></p>");
		out.println("<p><a href=\"systems.jsp\" target=\"_self\"><font color=blue>返回网站管理</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>修改网站参数失败，请稍后重试</font></p>");
		out.println("<div><input type=button name=btn value=返回 onClick='window.history.go(-1)'></div>");
	}
%>
	</div>
	</body>
</html>
