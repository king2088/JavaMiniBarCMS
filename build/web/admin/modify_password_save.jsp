<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
        <jsp:useBean id="oMD5" scope="request" class="com.bar.safe.MD5"/>
	</head>
	<body>
	<div align="center"><br>
<%
	//获取session中保存的UserName
	String sUserName = (String) session.getAttribute("uname");
	User.setUname(sUserName);
	//获取session中保存的UserID
	long lUserID = (Long) session.getAttribute("userid");	
	User.setUserid(lUserID);
	//获取所填写的旧密码
	String sOldUserPassword = oMD5.getMD5ofStr(request.getParameter("OldUserPassword"));

	User.setPwd(sOldUserPassword);
	//判断用户填写的旧密码是否正确
	if(User.valid())
	{
		//修改用户密码
		String sUserPassword = oMD5.getMD5ofStr(request.getParameter("pwd"));
		String sPwd = request.getParameter("pwd");
		
		User.setSpwd(sPwd);
		
		User.setPwd(sUserPassword);	
		if(User.modify_UserPassword())
		{
			out.println("<p><font color=blue>修改用户密码成功</font></p>");
		out.println("<p><a href=\"admin_info.jsp\" target=\"_self\"><font color=blue>返回资料管理</font></a></p>");

		}
		else
		{
			out.println("<p><font color=red>修改用户密码失败，请稍后重试</font></p>");
			out.println("<input type=button name=btn value=返回 onClick='window.history.go(-1)'>");
		}
	}
	else
	{
		out.println("<p><font color=red>您输入的旧密码错误</font></p>");
		out.println("<input type=button name=btn value=返回 onClick='window.history.go(-1)'>");
	}
%>
	</div>
	</body>
</html>
