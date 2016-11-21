<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		

		<jsp:useBean scope="page" id="Ku" class="com.bar.db.Ku" />

	</head>
	<body>
		<div align="center"><br>

<%
	//设置编码格式
	request.setCharacterEncoding("gb2312");
	
	String fKuid = request.getParameter("kuid");
	long cKuid = Long.parseLong(fKuid);
	Ku.setKuid(cKuid);

	//获取修改后的用户信息
	String sGoodname = request.getParameter("goodname");
	String fNum = request.getParameter("num");
	int sNum = Integer.parseInt(fNum);


	
	//保存用户信息
	Ku.setGoodname(sGoodname);
	Ku.setNum(sNum);
	if(Ku.updata())
	{
		out.println("<p><font color=blue>修改产品库存信息成功</font></p>");
		out.println("<p><a href=\"ku_list.jsp\" target=\"_self\"><font color=blue>返回产品库存管理</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>修改产品库存信息失败，请稍后重试</font></p>");
		out.println("<div><input type=button name=btn value=返回 onClick='window.history.go(-1)'></div>");
	}
%>
	</div>
	</body>
</html>
