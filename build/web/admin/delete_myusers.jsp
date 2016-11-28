<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临企业办公平台</title>
		<jsp:useBean scope="page" id="Myusers" class="com.bar.db.Myusers" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
	String strPage = request.getParameter("showPage");

	//获取所要删除的员工信息的索引号
	String[] sMyuserid = request.getParameterValues("DeleteID");	
	String sDeleteUserID = "0";
	if (sMyuserid != null)
	{
		for(int i=0;i<sMyuserid.length;i++)
		{
			sDeleteUserID = sDeleteUserID +"," + sMyuserid[i];	
		}		
	}	
		//删除选中的员工信息
		if(Myusers.delete(sDeleteUserID))
		{
			out.println("<p><font color=blue>供应商信息删除成功</font></p>");
			out.println("<p><a href=\"myusers_list.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>返回员工信息管理</font></a></p>");
		}
		else
		{
			out.println("<p><font color=red>供应商信息删除失败，请重试</font></p>");
			out.println("<input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
