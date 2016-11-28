<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


	<jsp:useBean scope="page" id="Myusers" class="com.bar.db.Myusers" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sMyuname = request.getParameter("Myuname");
		String sPname = request.getParameter("Pname");
		String sSex = request.getParameter("Sex");			
		String sAddr = request.getParameter("Addr");
		String sTel = request.getParameter("Tel");			
		String sEmail = request.getParameter("Email");
			
			Myusers.setMyuname(sMyuname);
			Myusers.setPname(sPname);
			Myusers.setSex(sSex);
			Myusers.setAddress(sAddr);
			Myusers.setTel(sTel);
			Myusers.setEmail(sEmail);
			
			if(Myusers.add())
			{
				out.println("<p><font color=blue>添加供应商信息成功</font></p>");
				out.println("<a href='./add_myusers.jsp' target='_self'><font color=blue>继续添加</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>添加供应商信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
		
%>
</div>
</body>
</html>
