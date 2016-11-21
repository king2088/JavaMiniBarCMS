<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		

		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />

	</head>
	<body>
		<div align="center"><br>

<%
	//设置编码格式
	request.setCharacterEncoding("gb2312");
	
	String sUserName = (String) session.getAttribute("uname");
	
	long userid = (Long) session.getAttribute("userid");
	User.setUserid(userid);

	//获取修改后的用户信息
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");
	String post = request.getParameter("post");
	String safequestion = request.getParameter("safequestion");
	String safeanswer = request.getParameter("safeanswer");
	String smoney = request.getParameter("money");
	float money =  Float.parseFloat(smoney);

	
	//保存用户信息
	User.setName(name);
	User.setSex(sex);
	User.setEmail(email);
	User.setAddress(address);
	User.setTel(tel);
	User.setBirth(birth);
	User.setPost(post);
	User.setSafequestion(safequestion);
	User.setSafeanswer(safeanswer);
	User.setMoney(money);
	if(User.modify_info())
	{
		out.println("<p><font color=blue>修改用户信息成功</font></p>");
		out.println("<p><a href=\"admin_info.jsp\" target=\"_self\"><font color=blue>返回资料管理</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>修改用户信息失败，请稍后重试</font></p>");
		out.println("<div><input type=button name=btn value=返回 onClick='window.history.go(-1)'></div>");
	}
%>
	</div>
	</body>
</html>
