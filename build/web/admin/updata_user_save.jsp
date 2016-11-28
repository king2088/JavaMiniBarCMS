<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sUserID = request.getParameter("UserID");
		long lUserID = Long.parseLong(sUserID);
		User.setUserid(lUserID);
		User.init();	

			String sName = request.getParameter("Name");
			String sSex = request.getParameter("Sex");
			String sBirth = request.getParameter("Birth");
			String sTel = request.getParameter("Tel");		
			String sEmail = request.getParameter("Email");
			String sAddr = request.getParameter("Addr");
			String sMoney = request.getParameter("Money");
			float Money =  Float.parseFloat(sMoney);
			
			
			User.setName(sName);
			User.setSex(sSex);
			User.setBirth(sBirth);
			User.setEmail(sEmail);
			User.setTel(sTel);
			User.setAddress(sAddr);
			User.setMoney(Money);
			
			if(User.modify_info())
			{
				out.println("<p><font color=blue>修改员工信息成功</font></p>");
				out.println("<P><a href='./show_our_users.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回员工信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改员工信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
