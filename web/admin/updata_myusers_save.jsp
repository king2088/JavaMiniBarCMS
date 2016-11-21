<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="Myusers" class="com.bar.db.Myusers" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sMyuserid = request.getParameter("Myuserid");
		long lMyuserid = Long.parseLong(sMyuserid);
		Myusers.setMyuserid(lMyuserid);
		Myusers.init();	

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
			
			if(Myusers.modify_info())
			{
				out.println("<p><font color=blue>修改供应商信息成功</font></p>");
				out.println("<P><a href='./myusers_list.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回员工信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改供应商信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
