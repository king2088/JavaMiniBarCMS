<%@ page contentType="text/html; charset=gb2312" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />

	</head>
	<body bgcolor="#F4FFFE">
	<div align=center>

<%
	//获取所要删除的商品信息的索引号
	String[] sGoodinfoid = request.getParameterValues("DeleteID");	
	//将所有索引号组成一个字符串
	String sDeleteGoodinfoid = "0";
	if (sGoodinfoid != null)
	{
		for(int i=0;i<sGoodinfoid.length;i++)
		{
			sDeleteGoodinfoid = sDeleteGoodinfoid +"," + sGoodinfoid[i];	
		}		
	}	
	//删除选中的商品信息信息
	if(Goodinfo.delete(sDeleteGoodinfoid))
	{
		out.println("<p><font color=blue>商品信息删除成功</font></p>");
		out.println("<p><a href=\"goods_list.jsp\" target=\"_self\"><font color=blue>返回商品信息管理</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>商品信息删除失败，请重试</font></p>");
		out.println("<input type=\"button\" name=\"btn2\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
	}
%>
	</div>
	</body>
</html>
