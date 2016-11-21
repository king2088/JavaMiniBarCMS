<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />

	</head>

	<body bgcolor="#F4FFFE">
	<div align=center>
	<%
	//获取所要删除的订单信息的索引号
	String[] sGoodsID = request.getParameterValues("DeleteID");	
	String sDeleteGoodsID = "0";
	if (sGoodsID != null)
	{
		for(int i=0;i<sGoodsID.length;i++)
		{
			sDeleteGoodsID = sDeleteGoodsID +"," + sGoodsID[i];	
		}		
	}	
		//删除选中的订单信息
		if(Goods.delete(sDeleteGoodsID))
		{
			out.println("<p><font color=blue>订单信息删除成功</font></p>");
			out.println("<p><a href=\"goods.jsp\" target=\"_self\"><font color=blue>返回订单信息管理</font></a></p>");
		}
		else
		{
			out.println("<p><font color=red>订单信息删除失败，请重试</font></p>");
			out.println("<input type=\"button\" name=\"btn2\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
